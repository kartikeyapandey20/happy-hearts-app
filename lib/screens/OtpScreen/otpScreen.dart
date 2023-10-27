import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:happyheart/Constant/CustomText.dart';
import 'package:happyheart/Constant/background.dart';
import 'package:happyheart/Constant/customTextButtton.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/colors.dart';
import '../../utils/image_path.dart';
import '../Dashboard/dashBoard.dart';

class OtpScreen extends StatefulWidget {
  final String phoneNo;

  const OtpScreen({Key? key, required this.phoneNo}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String? verificationCode;
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  final FirebaseAuth auth = FirebaseAuth.instance;

  Timer? _timer;
  int _resendDuration = 120; // 2 minutes
  bool _isCodeInvalid = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
    _verifyPhone();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_resendDuration > 0) {
          _resendDuration--;
        } else {
          _timer?.cancel();
        }
      });
    });
  }

  void _resendOtp() {
    if (_resendDuration == 0) {
      _verifyPhone();
      _startTimer();
      setState(() {
        _isCodeInvalid = false;
      });
    } else {
      Fluttertoast.showToast(msg: "Please Wait for Timer to be Over");
    }
  }

  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: "+91 ${widget.phoneNo}",
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance.signInWithCredential(credential).then(
          (value) async {
            if (value.user != null) {
              print("userLogged in");
            }
          },
        );
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
      },
      codeSent: (String verificationId, int? resendToken) {
        setState(() {
          verificationCode = verificationId;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        setState(() {
          verificationCode = verificationId;
        });
      },
      timeout: const Duration(seconds: 0),
    );
  }

  setData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool("login", true);
  }

  void _verifyOtp(String pin) {
    try {
      FirebaseAuth.instance
          .signInWithCredential(
        PhoneAuthProvider.credential(
          verificationId: verificationCode!,
          smsCode: pin,
        ),
      )
          .then(
        (value) {
          if (value.user != null) {
            print('pass to home');
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => DashBoard(),
              ),
              (route) => false,
            );
          } else {
            Fluttertoast.showToast(msg: "Invalid OTP");
          }
        },
      );
    } catch (e) {
      print("Invalid Otp");
      setState(() {
        _isCodeInvalid = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 15,
      textStyle: TextStyle(
        fontSize: 22,
        fontFamily: "Poppins",
        color: AppColors.black,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: AppColors.textFieldBorderColor),
        color: AppColors.borderColor,
      ),
    );
    String timerText =
        '${_resendDuration ~/ 60}:${(_resendDuration % 60).toString().padLeft(2, '0')}';

    return Scaffold(
      body: BackgroundSetup(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 20),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.arrow_back),
                    ),
                    Image.asset(
                      ImagePath.smallhhlogo,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 15,
                    ),
                    // Expanded(
                    // child:
                    CustomText(
                      text: "Verification",
                      fontSize: MediaQuery.of(context).size.height / 24,
                      textColor: AppColors.appPrimaryColor,
                    ),
                    // ),
                  ],
                ),
              ),
              Image.asset(ImagePath.veficationLogo),
              SizedBox(
                height: MediaQuery.of(context).size.height / 14,
              ),
              Padding(
                padding: EdgeInsets.all(30),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Directionality(
                        textDirection: TextDirection.ltr,
                        child: Pinput(
                          length: 6,
                          controller: pinController,
                          focusNode: focusNode,
                          androidSmsAutofillMethod:
                              AndroidSmsAutofillMethod.smsUserConsentApi,
                          listenForMultipleSmsOnAndroid: true,
                          defaultPinTheme: defaultPinTheme,
                          onSubmitted: (pin) async {
                            try {
                              await FirebaseAuth.instance
                                  .signInWithCredential(
                                PhoneAuthProvider.credential(
                                  verificationId: verificationCode!,
                                  smsCode: pin,
                                ),
                              )
                                  .then(
                                (value) async {
                                  if (value.user != null) {
                                    print('pass to home');
                                    Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                        builder: (context) => DashBoard(),
                                      ),
                                      (route) => false,
                                    );
                                  }
                                },
                              );
                            } catch (e) {
                              FocusScope.of(context).unfocus();
                              print("Invalid Otp");
                              setState(() {
                                _isCodeInvalid = true;
                              });
                            }
                          },
                          onChanged: (value) {
                            debugPrint('onChanged: $value');
                          },
                          cursor: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 9),
                                width: 22,
                                height: 1,
                                color: Colors.black,
                              ),
                            ],
                          ),
                          focusedPinTheme: defaultPinTheme.copyWith(
                            decoration: defaultPinTheme.decoration!.copyWith(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: AppColors.appPrimaryColor,
                              ),
                            ),
                          ),
                          submittedPinTheme: defaultPinTheme.copyWith(
                            decoration: defaultPinTheme.decoration!.copyWith(
                              color: AppColors.borderColor,
                              borderRadius: BorderRadius.circular(19),
                              border: Border.all(
                                color: AppColors.appPrimaryColor,
                              ),
                            ),
                          ),
                          errorPinTheme: defaultPinTheme.copyBorderWith(
                            border: Border.all(
                              color: AppColors.appPrimaryColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 14,
                      ),
                      TextButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            // Form is valid, execute logic
                            setData();
                            // print('pass to home');
                            // Navigator.of(context).pushAndRemoveUntil(
                            //   MaterialPageRoute(
                            //     builder: (context) => DashBoard(),
                            //   ),
                            //       (route) => false,
                            // );
                            String pin = pinController.text;
                            if (pin.isNotEmpty) {
                              _verifyOtp(pin);
                            }
                          } else {
                            Fluttertoast.showToast(msg: "Error occurred");
                          }
                        },
                        child: Center(
                          child: CustomeTextButton(
                            width: MediaQuery.of(context).size.width / 1.2,
                            borderColor: Color(0xFFFFFFFF),
                            bacgroundColor: Color(0xFFFA4A71),
                            text: "Verification",
                            borderWidth: 2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              CustomText(
                text: "Time Left : $timerText",
                fontSize: MediaQuery.of(context).size.height / 24,
                textColor: AppColors.primarytextColor,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 120,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText(
                    text: 'Haven’t received your OTP yet?',
                    fontSize: MediaQuery.of(context).size.height / 35,
                    textColor: AppColors.primarytextColor,
                    fontWeight: FontWeight.w600,
                  ),
                  InkWell(
                    onTap: _resendOtp,
                    child: CustomText(
                      text: ' Resend',
                      fontSize: MediaQuery.of(context).size.height / 35,
                      textColor: _resendDuration > 0
                          ? AppColors.hhred
                          : AppColors.hhred,
                      fontWeight: _resendDuration > 0
                          ? FontWeight.bold
                          : FontWeight.bold,
                    ),
                  ),
                ],
              ),
              if (_isCodeInvalid)
                CustomText(
                  text: 'Invalid OTP code',
                  fontSize: 19,
                  textColor: Colors.red,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
