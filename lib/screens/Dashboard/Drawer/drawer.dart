import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:happyheart/data/api_calling/user_api_calling/delete_user_api_calling.dart';
import 'package:happyheart/data/model/delete_user_model.dart';
import 'package:happyheart/screens/Dashboard/Drawer/faq_page.dart';
import 'package:happyheart/screens/Dashboard/Drawer/contact_us.dart';
import 'package:happyheart/screens/Dashboard/Drawer/profie_update_screen.dart';
import 'package:happyheart/screens/MyFavourite/my_favourite.dart';
import 'package:happyheart/screens/Subscription/subscription_page.dart';
import 'package:happyheart/screens/signUpScreen.dart';
import 'package:happyheart/utils/colors.dart';
import 'package:happyheart/utils/image_path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:string_capitalize_extension/string_capitalize_extension.dart';

import '../../../Constant/loader.dart';
import 'add_child.dart';

class NavDrawer extends StatefulWidget {
  final String name;
  NavDrawer({super.key, required this.name, required onProfileImageSelected});

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  DeleteUserApiCalling _deleteUserApiCalling = DeleteUserApiCalling();
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

  void _deleteUser() async {
    showLoader(); // Show the loader dialog

    try {
      final DeleteModel? response =
          await _deleteUserApiCalling.deleteUserApiCalling();

      if (response != null && response.isSuccess!) {
        if (response.isSuccess!) {
          Navigator.of(context).pop();
          SharedPreferences preferences = await SharedPreferences.getInstance();
          preferences.clear();
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => SignUpScreen(),
            ),
          );
        } else {
          // User does not exist
          Fluttertoast.showToast(msg: "Failed to Delete. Please try again");
        }
      } else {
        // Error occurred during API call
        Fluttertoast.showToast(msg: "Failed to Delete. Please try again.");
      }
    } catch (e) {
      print('API request failed with error: $e');
      Fluttertoast.showToast(msg: "Failed to Delete. Please try again.");
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.drawerColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
              decoration: const BoxDecoration(
                color: AppColors.hhpink,
              ),
              child: InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.blueGrey,
                      radius: 28,
                      backgroundImage:
                          Image.asset(ImagePath.updateProfile).image,

                      // backgroundImage:
                      // image == null ?
                      // Image.asset(
                      //     ImagePath.updateProfile).image:
                      // Image.file(
                      //   File(image!.path),
                      //   height: MediaQuery.of(context).size.height / 5,
                      // ).image,
                    ),
                    Container(
                      height: 40,
                      width: 130,
                      margin: const EdgeInsets.only(left: 7),
                      child: Center(
                        child: Text(
                          "Hi, ${widget.name.onlyFirstCase}",
                          style: TextStyle(
                              fontSize: MediaQuery.of(context).size.height / 29,
                              color: Colors.white,
                              fontFamily: "Poppins"),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
          // Expanded(
          // child:
          Container(
            color: AppColors.drawerColor,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 8,
                  ),
                  ListTile(
                    // leading: const  Icon(Icons.verified_user),
                    title: Text(
                      'Profile',
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w400,
                          fontSize: MediaQuery.of(context).size.height / 30),
                    ),
                    onTap: () => {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => UpdateProfileScreen()))
                    },
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  ListTile(
                    // leading: const  Icon(Icons.verified_user),
                    title: Text(
                      'Favourite',
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w400,
                          fontSize: MediaQuery.of(context).size.height / 30),
                    ),
                    onTap: () => {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MyFavourite()))
                    },
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  ListTile(
                    // leading:const  Icon(Icons.settings),
                    title: Text(
                      'Subscription',
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w400,
                          fontSize: MediaQuery.of(context).size.height / 30),
                    ),
                    onTap: () => {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SubscriptionPage()))
                    },
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  // ListTile(
                  //     // leading: const Icon(Icons.input),
                  //     title: Text(
                  //       'Refer a Friend',
                  //       style: TextStyle(
                  //           fontFamily: "Poppins",
                  //           fontWeight: FontWeight.w400,
                  //           fontSize: MediaQuery.of(context).size.height / 30),
                  //     ),
                  //     onTap: () => {}),
                  // SizedBox(
                  //   height: 14,
                  // ),
                  ListTile(
                    // leading:const  Icon(Icons.settings),
                    title: Text(
                      'Add Child',
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w400,
                          fontSize: MediaQuery.of(context).size.height / 30),
                    ),
                    onTap: () => {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => AddChild()))
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    color: Colors.black,
                    height: 15,
                    thickness: 1,
                    indent: 12,
                    endIndent: 15,
                  ),
                  ListTile(
                    // leading: const  Icon(Icons.border_color),
                    title: Text(
                      'Contact us',
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w400,
                          fontSize: MediaQuery.of(context).size.height / 30),
                    ),
                    onTap: () => {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ContactUsScreen()))
                    },
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  ListTile(
                    // leading: const  Icon(Icons.border_color),
                    title: Text(
                      'FAQ',
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w400,
                          fontSize: MediaQuery.of(context).size.height / 30),
                    ),
                    onTap: () => {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => FAQScreen())))
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    color: Colors.black,
                    height: 15,
                    thickness: 1,
                    indent: 12,
                    endIndent: 15,
                  ),
                  ListTile(
                    // leading: const  Icon(Icons.exit_to_app),
                    title: Text(
                      'Log Out',
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w400,
                          fontSize: MediaQuery.of(context).size.height / 30),
                    ),
                    onTap: () async {
                      SharedPreferences preferences =
                          await SharedPreferences.getInstance();
                      preferences.clear();
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => SignUpScreen()),
                          (route) => false);
                    },
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  ListTile(
                    // leading: const  Icon(Icons.exit_to_app),
                    title: Text(
                      'Delete Account',
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w400,
                          fontSize: MediaQuery.of(context).size.height / 30),
                    ),
                    onTap: () async {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                              'Delete Account',
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 23),
                            ),
                            content: Text(
                              'Are you sure you want to delete your account?',
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 23),
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: Text(
                                  'Cancel',
                                  style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w400,
                                      fontSize: 23),
                                ),
                                onPressed: () {
                                  Navigator.of(context)
                                      .pop(); // Close the dialog
                                },
                              ),
                              TextButton(
                                child: Text(
                                  'Delete',
                                  style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w400,
                                      fontSize: 23),
                                ),
                                onPressed: () async {
                                  _deleteUser();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
