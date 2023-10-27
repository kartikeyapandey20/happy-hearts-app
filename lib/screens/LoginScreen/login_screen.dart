import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:happyheart/Constant/background.dart';
import 'package:happyheart/data/model/login_model.dart';
import 'package:happyheart/screens/OtpScreen/otpScreen.dart';
import 'package:happyheart/screens/playrecording/free_audio_recording.dart';
import 'package:happyheart/screens/signUpScreen.dart';
import 'package:happyheart/utils/image_path.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Constant/CustomText.dart';
import '../../Constant/customTextButtton.dart';
import '../../Constant/customTextFormField.dart';
import '../../Constant/loader.dart';
import '../../data/api_calling/user_api_calling/login_api_calling.dart';
import '../../utils/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneNoController = TextEditingController();
  bool isLoading = false;
  LoginApiCalling _loginApiCalling = LoginApiCalling();

  Future<void> showLoader() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: HeartLoader(),
          ),
        );
      },
    );
  }

  void _login() async {
    showLoader(); // Show the loader dialog

    try {
      final LoginModel? response =
          await _loginApiCalling.loginApiCalling(phoneNoController.text);

      if (response != null && response.isSuccess!) {
        if (response.data!.isNotEmpty) {
          // User exists, navigate to OTP screen
          SharedPreferences preferences = await SharedPreferences.getInstance();
          preferences.setString("userId", response.data![0].sId!);
          preferences.setString("firstName", response.data![0].firstName!);
          preferences.setString("lastName", response.data![0].lastName!);
          preferences.setString(
              "childName", response.data![0].child!.childName!);
          preferences.setString("mobile", response.data![0].mobileNumber!);
          preferences.setString("email", response.data![0].email!);
          Navigator.of(context).pop();
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => OtpScreen(
                phoneNo: phoneNoController.text,
              ),
            ),
          );
        } else {
          // User does not exist
          Fluttertoast.showToast(msg: "User does not exist");
        }
      } else {
        // Error occurred during API call
        Fluttertoast.showToast(msg: "Failed to login. Please try again.");
      }
    } catch (e) {
      print('API request failed with error: $e');
      Fluttertoast.showToast(msg: "Failed to login. Please try again.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundSetup(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 20,
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.arrow_back)),
                  Image.asset(
                    ImagePath.smallhhlogo,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 14,
                  ),
                  Center(
                      child: CustomText(
                          text: "Login Screen",
                          fontSize: MediaQuery.of(context).size.height / 24,
                          textColor: AppColors.appPrimaryColor)),
                ],
              ),
              Image.asset(
                ImagePath.handLogo,
                height: MediaQuery.of(context).size.height / 3.5,
              ),
              Column(
                children: [
                  CustomText(
                    text:
                        "Take on this Magical Journey \nto Energise Your Child’s ",
                    fontSize: MediaQuery.of(context).size.height / 27,
                    textColor: AppColors.primarytextColor,
                  ),
                  CustomText(
                    text: "\"Body - Mind - Soul\"",
                    fontSize: MediaQuery.of(context).size.height / 27,
                    textColor: AppColors.hhred,
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.03,
                child: CustomTextFormField(
                  hintText: "Phone number",
                  textController: phoneNoController,
                  inputType: TextInputType.number,
                  IsValidate: true,
                  width: MediaQuery.of(context).size.width / 1.2,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              InkWell(
                onTap: () {
                  if (phoneNoController.text.isEmpty) {
                    Fluttertoast.showToast(msg: "Please Enter a Number");
                  } else if (phoneNoController.text.length < 10) {
                    Fluttertoast.showToast(msg: "Please Enter A Valid Number");
                  } else {
                    _login();
                  }
                },
                child: CustomeTextButton(
                  width: MediaQuery.of(context).size.width / 1.15,
                  borderColor: AppColors.borderColor,
                  bacgroundColor: AppColors.appPrimaryColor,
                  text: "Send OTP",
                  borderWidth: 2,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 45,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => SignUpScreen()),
                      (route) => false);
                },
                child: Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 26,
                  ),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                          // align: TextAlign.left,
                          text: "  Don't Have an Account?",
                          fontSize: MediaQuery.of(context).size.height / 27,
                          textColor: AppColors.primarytextColor),
                      CustomText(
                        text: "  Create",
                        fontSize: MediaQuery.of(context).size.height / 27,
                        textColor: AppColors.appPrimaryColor,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 15,
                    right: MediaQuery.of(context).size.width / 15),
                child: RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                      text: "Listen to this ",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height / 37,
                          color: AppColors.primarytextColor,
                          fontFamily: "Popppins"),
                      children: [
                        TextSpan(
                          text: "Free Gift Offering",
                          style: TextStyle(
                              fontSize: MediaQuery.of(context).size.height / 38,
                              color: AppColors.appPrimaryColor,
                              fontFamily: "Popppins"),
                        ),
                        TextSpan(
                          text: " and experience what your child will feel ",
                          style: TextStyle(
                              fontSize: MediaQuery.of(context).size.height / 37,
                              color: AppColors.primarytextColor,
                              fontFamily: "Popppins"),
                        ),
                      ]),
                ),
              ),

              // CustomText(
              //   align: TextAlign.justify,
              //     text:
              //         "Listen to this free gift offering and experience what your child will feel",
              //     fontSize: MediaQuery
              //         .of(context)
              //         .size
              //         .height / 33,
              //     textColor: AppColors.primarytextColor,),
              SizedBox(
                height: 13,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => FreePlayRecording()));
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Align(
                      alignment: Alignment.center,
                      child: CustomeTextButton(
                        borderColor: AppColors.borderColor,
                        bacgroundColor: AppColors.appPrimaryColor,
                        text: "Tap here for free gift",
                        borderWidth: 2,
                        width: MediaQuery.of(context).size.width,
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
