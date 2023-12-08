import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:happyheart/Constant/CustomText.dart';
import 'package:happyheart/Constant/background.dart';
import 'package:happyheart/Constant/customTextButtton.dart';
import 'package:happyheart/Constant/customTextFormField.dart';
import 'package:happyheart/screens/LoginScreen/login_screen.dart';
import 'package:happyheart/utils/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../howOldIsYourChildScreen/how_old_is_your_child_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool valuefirst = false;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController childNameController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  saveDataToASession() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("firstName", firstNameController.text);
    preferences.setString("lastName", lastNameController.text);
    preferences.setString("childName", childNameController.text);
    preferences.setString("mobile", mobileNoController.text);
    preferences.setString("email", emailController.text);
  }

  final Uri _url =
      Uri.parse('http://happyhearts.telesia.in/terms&conditions/index.html');

  @override
  Widget build(BuildContext context) {
    Future<void> _launchUrl() async {
      if (!await launchUrl(_url)) {
        throw Exception('Could not launch $_url');
      }
    }

    return Scaffold(
        body: Scaffold(
      body: BackgroundSetup(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 35),
                child: Center(
                    child: CustomText(
                        text: "Sign Up",
                        fontWeight: FontWeight.w600,
                        fontSize: MediaQuery.of(context).size.height / 24,
                        textColor: AppColors.appPrimaryColor)),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 90,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                child: CustomText(
                    text:
                        "Welcome to The Happy Hearts! Club Create an account to transcend into the magical journey of profound healing for your child.",
                    fontSize: MediaQuery.of(context).size.height / 33,
                    textColor: AppColors.primarytextColor,
                    align: TextAlign.justify),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 40,
              ),
              CustomTextFormField(
                hintText: "First Name",
                textController: firstNameController,
                inputType: TextInputType.name,
                IsValidate: true,
                width: MediaQuery.of(context).size.width / 1.2,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 55,
              ),
              CustomTextFormField(
                hintText: "Last Name",
                textController: lastNameController,
                inputType: TextInputType.name,
                IsValidate: true,
                width: MediaQuery.of(context).size.width / 1.2,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 55,
              ),
              CustomTextFormField(
                hintText: "Child Name",
                textController: childNameController,
                inputType: TextInputType.name,
                IsValidate: true,
                width: MediaQuery.of(context).size.width / 1.2,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 55,
              ),
              CustomTextFormField(
                hintText: "Mobile Number",
                textController: mobileNoController,
                inputType: TextInputType.number,
                IsValidate: true,
                width: MediaQuery.of(context).size.width / 1.2,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 55,
              ),
              CustomTextFormField(
                hintText: "Email Id",
                textController: emailController,
                inputType: TextInputType.emailAddress,
                IsValidate: true,
                width: MediaQuery.of(context).size.width / 1.2,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 35,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 15.5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Checkbox(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                        value: valuefirst,
                        onChanged: (value) {
                          setState(() {
                            valuefirst = value!;
                          });
                        }),
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 43, 0),
                        child: RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                              text:
                                  "By continuing, you agree to our Terms & Conditions and Privacy Policy.  ",
                              // Hearts.Club’s Terms and Conditions & Privacy Policy.",
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height / 40,
                                color: AppColors.primarytextColor,
                                fontFamily: 'Poppins',
                                overflow: TextOverflow.ellipsis,
                              ),
                              children: [
                                // TextSpan(
                                //   text: "Happy Hearts.Club’s Terms and Conditions & Privacy Policy.",
                                //   style: TextStyle(
                                //     fontSize: MediaQuery
                                //         .of(context)
                                //         .size
                                //         .height / 40,
                                //     color: AppColors.primarytextColor,
                                //     fontFamily: 'Poppins',
                                //     fontWeight: FontWeight.w600,
                                //   ),
                                // ),
                                // TextSpan(text: "Conditions & Privacy Policy.",
                                //   style: TextStyle(
                                //     fontSize: MediaQuery
                                //         .of(context)
                                //         .size
                                //         .height / 40,
                                //     color: AppColors.primarytextColor,
                                //     fontFamily: 'Poppins',
                                //     fontWeight: FontWeight.w600,
                                //   ),
                                // ),
                                TextSpan(
                                    text: " T&C",
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              40,
                                      color: AppColors.hhred,
                                      fontFamily: 'Poppins',
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        print("object");
                                        _launchUrl();
                                      })
                              ]),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 35,
              ),
              InkWell(
                onTap: () {
                  if (firstNameController.text.isEmpty ||
                      lastNameController.text.isEmpty ||
                      childNameController.text.isEmpty ||
                      mobileNoController.text.isEmpty ||
                      emailController.text.isEmpty) {
                    Fluttertoast.showToast(msg: "Please enter All the Values");
                  } else {
                    saveDataToASession();
                    if (mobileNoController.text.length < 10) {
                      Fluttertoast.showToast(
                          msg: "Please Enter A valid Mobile Number");
                    } else if (!valuefirst) {
                      Fluttertoast.showToast(
                          msg: "Please Agree to terms and Condition");
                    } else {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => HowOldIsYourChildScreen(
                                firstName: firstNameController.text,
                                lastName: lastNameController.text,
                                childName: childNameController.text,
                                mobileNo: mobileNoController.text,
                                email: emailController.text,
                              )));
                    }
                  }
                },
                child: CustomeTextButton(
                  width: MediaQuery.of(context).size.width / 1.2,
                  borderColor: AppColors.borderColor,
                  bacgroundColor: AppColors.appPrimaryColor,
                  text: "Sign Up",
                  borderWidth: 2,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                      text: "Already have an account?",
                      fontSize: MediaQuery.of(context).size.height / 29,
                      textColor: AppColors.primarytextColor),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LoginScreen()));
                    },
                    child: CustomText(
                        text: " Login",
                        fontSize: MediaQuery.of(context).size.height / 29,
                        textColor: Colors.yellow,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
