import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:happyheart/Constant/background.dart';
import 'package:happyheart/Constant/customTextButtton.dart';
import 'package:happyheart/Constant/customTextFormField.dart';
import 'package:happyheart/screens/Dashboard/Drawer/add_child.dart';
import 'package:happyheart/screens/Dashboard/dashBoard.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Constant/CustomText.dart';
import '../../../utils/colors.dart';
import '../../../utils/image_path.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  _UpdateProfileScreenState createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController childNameController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  loadDataFromSession() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String firstName = preferences.getString("firstName")!;
    String lastName = preferences.getString("lastName")!;
    String childName = preferences.getString("childName")!;
    String mobile = preferences.getString("mobile")!;
    String email = preferences.getString("email")!;
    firstNameController.text = firstName;
    lastNameController.text = lastName;
    childNameController.text = childName;
    mobileNoController.text = mobile;
    emailController.text = email;
  }

  upDateData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("firstName", firstNameController.text);
    preferences.setString("lastName", lastNameController.text);
    preferences.setString("childName", childNameController.text);
    preferences.setString("mobile", mobileNoController.text);
    preferences.setString("email", emailController.text);

    Fluttertoast.showToast(msg: "Profile Updated");
  }

  void handleProfileImageSelected(String? imagePath) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('profileImagePath', image!.path);
  }

  @override
  void initState() {
    super.initState();
    loadDataFromSession();
  }

  handleWillPop(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => DashBoard()), (route) => false);
  }

  XFile? image;
  ImagePicker picker = ImagePicker();

  selecteimage() async {
    if (image != null) {
      print("select image");
      Text("select image");
    } else {
      image = await picker.pickImage(source: ImageSource.gallery);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => handleWillPop(context),
      child: Scaffold(
        body: SingleChildScrollView(
          child: YellowBacground(
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
                        icon: Icon(Icons.arrow_back)),
                    Image.asset(ImagePath.smallhhlogo),
                    CustomText(
                        text: "  Update Profile",
                        fontSize: 33,
                        textColor: AppColors.appPrimaryColor),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Stack(
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundImage: image == null
                        ? Image.asset(ImagePath.green).image
                        : Image.file(
                            File(image!.path),
                            height: MediaQuery.of(context).size.height / 5,
                          ).image,
                  ),
                  Positioned(
                    bottom: MediaQuery.of(context).size.height / 100,
                    right: MediaQuery.of(context).size.width / 70,
                    child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            // image: DecorationImage(
                            // image: Image.file(File(image!.path)).image),
                            border: Border.all(color: AppColors.black)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              selecteimage();
                            },
                            child: Icon(
                              Icons.camera_alt_sharp,
                              size: 30,
                            ),
                          ),
                        )),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                hintText: "First Name",
                textController: firstNameController,
                inputType: TextInputType.name,
                IsValidate: true,
                width: MediaQuery.of(context).size.width / 1.2,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
              CustomTextFormField(
                hintText: "Last Name",
                textController: lastNameController,
                inputType: TextInputType.name,
                IsValidate: true,
                width: MediaQuery.of(context).size.width / 1.2,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
              CustomTextFormField(
                hintText: "Child Name",
                textController: childNameController,
                inputType: TextInputType.name,
                IsValidate: true,
                width: MediaQuery.of(context).size.width / 1.2,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
              // InkWell(
              //   onTap: () {
              //     Navigator.of(context).push(
              //         MaterialPageRoute(builder: (context) => AddChild()));
              //   },
              //   child: CustomeTextButton(
              //     width: MediaQuery.of(context).size.width / 1.2,
              //     height: MediaQuery.of(context).size.height / 18,
              //     borderColor: AppColors.borderColor,
              //     bacgroundColor: AppColors.appPrimaryColor,
              //     text: "Add or Update Child",
              //     borderWidth: 2,
              //   ),
              // ),
              // SizedBox(
              //   height: MediaQuery.of(context).size.height / 50,
              // ),
              CustomTextFormField(
                hintText: "Mobile Number",
                textController: mobileNoController,
                inputType: TextInputType.number,
                IsValidate: true,
                width: MediaQuery.of(context).size.width / 1.2,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
              CustomTextFormField(
                hintText: "Email Id",
                textController: emailController,
                inputType: TextInputType.emailAddress,
                IsValidate: true,
                width: MediaQuery.of(context).size.width / 1.2,
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  upDateData();
                  ;
                },
                child: CustomeTextButton(
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: MediaQuery.of(context).size.height / 18,
                    borderColor: AppColors.borderColor,
                    bacgroundColor: AppColors.appPrimaryColor,
                    text: "Update Profile",
                    borderWidth: 2),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
