import 'package:flutter/material.dart';
import 'package:happyheart/Constant/CustomText.dart';
import 'package:happyheart/Constant/background.dart';
import 'package:happyheart/Constant/loader.dart';
import 'package:happyheart/data/api_calling/user_api_calling/sign_up_api_calling.dart';
import 'package:happyheart/screens/LoginScreen/login_screen.dart';
import 'package:happyheart/utils/colors.dart';
import 'package:happyheart/utils/image_path.dart';

class HowOldIsYourChildScreen extends StatefulWidget {
  final String firstName;
  final String lastName;
  final String childName;
  final String mobileNo;
  final String email;
  const HowOldIsYourChildScreen({
    Key? key,
    required this.firstName,
    required this.lastName,
    required this.childName,
    required this.mobileNo,
    required this.email,
  }) : super(key: key);

  @override
  State<HowOldIsYourChildScreen> createState() =>
      _HowOldIsYourChildScreenState();
}

class _HowOldIsYourChildScreenState extends State<HowOldIsYourChildScreen> {
  List<String> ImageList = [
    ImagePath.zeroTONine,
    ImagePath.nintoThirteen,
    ImagePath.thirteenPlus,
  ];
  List<String> comingSoon = [
    "  ",
    "Coming Soon",
    "Coming Soon",
  ];
  List<String> ageBracket = ["3-9 Years", "9-13 Years", "13+ Years"];
  bool isLoading = false;

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

  Future<void> postDataAndNavigate() async {
    try {
      await SignUpApiCalling().postData(
        widget.firstName,
        widget.lastName,
        widget.mobileNo,
        widget.email,
        widget.childName,
        0,
      );

      Navigator.pop(context); // Dismiss the loader
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    } catch (error) {
      print('API call error: $error');
      // Handle any errors that occur during the API call
      // You can show an error message or perform any necessary actions

      Navigator.pop(context); // Dismiss the loader
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: YellowBacground(
        child: Column(
          children: [
            // IconButton(
            //    onPressed: () {
            //      Navigator.of(context).pop();
            //    },
            //    icon: const Icon(Icons.arrow_back,color: Colors.black)),
            Padding(
              padding:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 20),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.arrow_back, color: Colors.black)),
                  Image.asset(
                    ImagePath.smallhhlogo,
                  ),
                  Flexible(
                    child: CustomText(
                      text: "How old is your child?",
                      fontSize: MediaQuery.of(context).size.height / 24,
                      textColor: AppColors.appPrimaryColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 46,
            ),
            Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // GridView.builder(
                  //   itemCount: 4,
                  //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //     crossAxisCount: 2,
                  //     crossAxisSpacing: 2,
                  //     mainAxisSpacing: 10,
                  //   ),
                  //    itemBuilder: (context, index) {
                  //     return
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          showLoader();
                          postDataAndNavigate();
                        },
                        child: CircleAvatar(
                          radius: 70,
                          backgroundColor: AppColors.hhpink,
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white,
                                  width: 5,
                                ),
                                shape: BoxShape.circle),
                            child: CircleAvatar(
                              backgroundImage: AssetImage(
                                ImagePath.zeroTONine,
                              ),
                              radius: 60,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 12,
                        width: MediaQuery.of(context).size.width / 2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.hhpink,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                                text: "3-8 Years",
                                fontSize:
                                    MediaQuery.of(context).size.height / 30,
                                textColor: AppColors.primarytextColor),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Opacity(
                          opacity: .7,
                          child: CircleAvatar(
                            radius: 70,
                            backgroundColor: AppColors.blue,
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Colors.white, width: 5)),
                              child: CircleAvatar(
                                backgroundImage: AssetImage(
                                  ImagePath.nintoThirteen,
                                ),
                                radius: 60,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 12,
                        width: MediaQuery.of(context).size.width / 2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.blue,
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                  text: "8-12 Years",
                                  fontSize:
                                      MediaQuery.of(context).size.height / 30,
                                  textColor: AppColors.primarytextColor),
                              CustomText(
                                  text: "(Coming soon)",
                                  fontSize: 16,
                                  textColor: AppColors.primarytextColor),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Opacity(
                              opacity: .7,
                              child: CircleAvatar(
                                radius: 75,
                                backgroundColor: AppColors.hhgreen,
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.white, width: 5),
                                      shape: BoxShape.circle),
                                  child: CircleAvatar(
                                    backgroundImage: AssetImage(
                                      ImagePath.thirteenPlus,
                                    ),
                                    radius: 65,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 12,
                        width: MediaQuery.of(context).size.width / 2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.hhgreen,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                                text: "13+ Years",
                                fontSize:
                                    MediaQuery.of(context).size.height / 30,
                                textColor: AppColors.primarytextColor),
                            CustomText(
                                text: "(Coming soon)",
                                fontSize: 16,
                                textColor: AppColors.primarytextColor),
                          ],
                        ),
                      )
                    ],
                  )
                  // SizedBox(
//             height: 20,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Column(
//                 children: [
//                   InkWell(
//                     onTap: () {},
//                     child: Stack(
//                       children: const [
//                         Opacity(
//                           opacity: .7,
//                           child: CircleAvatar(
//                             backgroundImage: AssetImage(
//                               ImagePath.thirteenPlus,
//                             ),
//                             radius: 90,
//                           ),
//                         ),
//                         Positioned(
//                             top: 70,
//                             left: 0,
//                             child: Center(
//                                 child: Text(
//                               "Coming soon",
//                               style: TextStyle(
//                                   fontSize: 35,
//                                   fontWeight: FontWeight.bold,
//                                   fontFamily: "Fresca",
//                                   color: AppColors.black),
//                             )))
//                       ],
//                     ),

                  //     Column(
                  //       children: [
                  //           onTap: () {
                  //             if (ageBracket[index] == ageBracket[0]) {
                  //               showLoader();
                  //               postDataAndNavigate();
                  //             }
                  //           },
                  //           child: Image.asset(
                  //             ImageList[index],
                  //             height: MediaQuery.of(context).size.height / 6,
                  //           ),
                  //         ),
                  //         CustomText(
                  //           text: comingSoon[index],
                  //           fontSize: 18,
                  //           textColor: AppColors.black,
                  //         ),
                  //         CustomText(
                  //           text: ageBracket[index],
                  //           fontSize: 20,
                  //           textColor: AppColors.black,
                  //         ),
                  //       ],
                  //     ),
                ]),
          ],
        ),
      ),
    );
  }
}
