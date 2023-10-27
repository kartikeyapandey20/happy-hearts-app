import 'package:flutter/material.dart';
import 'package:happyheart/Constant/background.dart';

import '../../Constant/CustomText.dart';
import '../../utils/colors.dart';
import '../../utils/image_path.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {

  List<String> notification = [
    "Topic names- (whichever the user was listening to last)",
    "Your Subscription is Coming to an End - Pay Now for an Uninterrupted Service",
    "“Free Subscription will be over in 3-5 days” buy now to continue.",
    "Thank you for your feedback - Always Listening to You"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: YellowBacground(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 20),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.arrow_back)),
                Image.asset(ImagePath.smallhhlogo),
                CustomText(
                  text: "   Notification",
                  fontSize: 33,
                  textColor: AppColors.appPrimaryColor,
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 50,
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: CustomText(text: "No new Notificatioon", fontSize: 18, textColor: AppColors.black),)
                ],
                // children: [
                //   CustomText(
                //       text: "Welcome Back, start where you left off!",
                //       fontSize: 20,
                //       textColor: AppColors.primarytextColor),
                //   SizedBox(
                //     height: MediaQuery.of(context).size.height / 50,
                //   ),
                //   Container(
                //     decoration: BoxDecoration(
                //         color: AppColors.hhyellow,
                //         borderRadius: BorderRadius.circular(12)),
                //     child: Padding(
                //       padding: const EdgeInsets.all(5.0),
                //       child: Column(
                //         mainAxisAlignment: MainAxisAlignment.start,
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           CustomText(
                //             text: "Quotes of the Day ...",
                //             fontSize: 24,
                //             textColor: AppColors.borderColor,
                //             align: TextAlign.left,
                //           ),
                //           CustomText(
                //             text:
                //                 '"A child’s life is like a piece of paper on which every passerby leaves a mark." ― Chinese Proverb',
                //             fontSize: 20,
                //             textColor: AppColors.borderColor,
                //             align: TextAlign.right,
                //           )
                //         ],
                //       ),
                //     ),
                //   ),
                // ],
              )),
          // Expanded(
          //   child: ListView.builder(
          //       itemCount: 4,
          //       itemBuilder: (context, index) {
          //     return Padding(
          //       padding: const EdgeInsets.all(10.0),
          //       child: CustomeTextButton(borderColor: AppColors.transhparent, bacgroundColor: AppColors.borderColor,textColor: AppColors.black, text: notification[index], borderWidth: 1),
          //     );
          //   }),
          // )
        ],
      )),
    );
  }
}
