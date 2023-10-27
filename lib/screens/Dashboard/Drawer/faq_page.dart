import 'package:flutter/material.dart';
import 'package:happyheart/Constant/background.dart';
import 'package:happyheart/utils/colors.dart';

import '../../../Constant/CustomText.dart';
import '../../../utils/image_path.dart';

class FAQScreen extends StatefulWidget {
  @override
  _FAQScreenState createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  List<String> technicalQuestions = [
    "1.Can I pause my The Happy hearts Club subscription?",
    "2.How do I unsubscribe from The Happy hearts Club?",
    "3. How do I access my free subscription?",
    "4.How do I update my Profile on the app?",
    "5.How to change my email address/phone number?",
    "6.Whom to contact in case of technical difficulties?"
  ];

  List<String> technicalAnswerss = [
    "When you put a The The The Happy hearts Club subscription on pause, it will only pause after the current billing cycle. Tap the \nprofile icon in the bottom right corner - Subscriptions - You can pause a subscription by choosing it.",
    "Tap on the profile icon in the bottom right corner - Subscriptions – Choose the cycle you no longer want to pay for, scroll to the bottom and hit the ‘Cancel Subscription button’",
    "On your Android phone or iOS tablet, open your app's Settings. Tap 'Manage your  The Happy hearts Account'.At the top, tap Payments & Subscriptions.Tap Manage purchases, Manage subscriptions or Manage reservations.To see more details, select an item.",
    "On your Android phone or tablet, open your app's Settings. Tap 'Manage your The Happy hearts Account' -- Personal info.Under \"Basic info, \" update your profile according to your preferences.Tap 'Accept', once done.",
    "On your Android phone or tablet, go to your app's Settings. Tap 'Manage your  The Happy hearts Account' -- Personal info.Under \"Contact info,\" tap Phone number & update your phone number.Tap Email ID & update your email ID.Tap 'Accept', once done.",
    "If you are coming across any technical difficulties or you want to just reach out to us, please email/call us at: happyhearts123@xyz.com(please update this with the customer care email id/phone number)"
  ];
  List<String> nonTechnicalQuestion = [
    "1.Will the audios completely heal my child?",
    "2.Why should the audio only be listened to two times a week?",
    "3.Can I listen to more than one topic at a time?",
    "4.Why are the audios to be heard only at bedtime?",
    "5.Why do these audios heal?",
    "6.Will the healing be permanent for my child?",
    "7.Can I listen to the audios on a loop?",
    "8.If the audios alter & change the child's cells, then can my child become ill?"
  ];

  List<String> nonTechnicalAnswer = [
    "Yes, the audios have deep healing powers and will heal your child to the core, by uprooting the primary issue",
    "It's crucial to listen to the audios no more than twice a week because they are in-depth and requires some time to sink into your body. It takes time for the body to adjust as cells heal slowly.",
    "Unfortunately, no. Too many topics being heard at once can make your child ill because these audios alter your cells.",
    "The audios will get more deeply ingrained in your child's subconscious thinking as they are about to fall asleep. The healing won't be successful and effective when the child is awake and alert since it won't reach their deeper subconscious layers.",
    "They transform the energy that causes their initial problems into newer, better states.",
    "Typically, yes. If you pause the audios too soon or if your child grows bored, some sediments may still remain. Give it some time, and if the problem reappears, repeat them.",
    "The audios are only to be heard during naps or bedtime, not at any other time. Unless the child requests a repeat, we advise listening to it just twice a week. After that, let the child's energies guide you because they might resonate with what they are hearing and want to hear it again and again.",
    "A mild cold or stomach ache could affect the child. Please don't be concerned. The fact that the repair has actually permeated at the cellular level is encouraging. It could also happen that it may not affect them at all and actually improve some health aspects of the child."
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TestContainer(
        child: Column(
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
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 5),
                    child: CustomText(
                      text: "FAQ",
                      fontSize: 33,
                      textColor: AppColors.appPrimaryColor,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 50,
              child: TabBar(
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                controller: _tabController,
                indicatorColor: AppColors.black,
                labelColor: AppColors.black,
                unselectedLabelColor: AppColors.unseletedTabColor,
                labelStyle: TextStyle(
                  // fontFamily: "spaceGrotesk",
                  fontFamily: "Poppins",
                  fontSize: 18,
                ),
                tabs: const [
                  Tab(
                    text: 'Techinical FAQ',
                  ),
                  Tab(
                    text: 'Non Techinical FAQ',
                  )
                ],
                onTap: (index) {
                  setState(() {});
                },
              ),
            ),
            Divider(
              color: AppColors.dividerColor,
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  CustomScrollView(
                    slivers: [
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            return Align(
                              alignment: Alignment.centerLeft,
                              child: ExpansionTile(
                                title: Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: Text("${technicalQuestions[index]}",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: AppColors.black,
                                        fontFamily: "Poppins",
                                      )),
                                ),
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                      ),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "${technicalAnswerss[index]}",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontFamily: "Poppins",
                                              color: AppColors.black),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                          childCount: technicalQuestions.length,
                        ),
                      ),
                    ],
                  ),
                  CustomScrollView(
                    slivers: [
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            return Align(
                              alignment: Alignment.center,
                              child: ExpansionTile(
                                title: Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: Text("${nonTechnicalQuestion[index]}",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: AppColors.black,
                                        fontFamily: "Poppins",
                                      )),
                                ),
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                      ),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "${nonTechnicalAnswer[index]}",
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: AppColors.black,
                                            fontFamily: "Poppins",
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                          childCount: nonTechnicalQuestion.length,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// // import 'package:flutter/material.dart';
// // import 'package:happyheart/Constant/background.dart';
// // import 'package:happyheart/utils/colors.dart';
// //
// // import '../../../Constant/CustomText.dart';
// // import '../../../utils/image_path.dart';
// //
// //
// // class FAQScreen extends StatefulWidget {
// //   @override
// //   _FAQScreenState createState() => _FAQScreenState();
// // }
// //
// class _FAQScreenState extends State<FAQScreen> with TickerProviderStateMixin{
// //   int _selectedIndex = 0;
// //   TabController? _tabController;
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     _tabController = TabController(vsync: this, length: 4);
// //   }
// //
// //   @override
// //   void dispose() {
// //     _tabController!.dispose();
// //     super.dispose();
// //   }
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: TestContainer(
// //         child: Column(
// //           children: [
// //             Padding(
// //               padding:
// //               EdgeInsets.only(top: MediaQuery.of(context).size.height / 20),
// //               child: Row(
// //                 children: [
// //                   IconButton(
// //                       onPressed: () {
// //                         Navigator.of(context).pop();
// //                       },
// //                       icon: Icon(Icons.arrow_back)),
// //                   Image.asset(ImagePath.smallhhlogo),
// //                   Padding(
// //                     padding: EdgeInsets.only(left: MediaQuery.of(context).size.width/5),
// //                     child: CustomText(
// //                       text: "FAQ",
// //                       fontSize: 33,
// //                       textColor: AppColors.appPrimaryColor,
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //             Container(
// //               height: 50,
// //               child: TabBar(
// //                 isScrollable: true,
// //                 indicatorSize: TabBarIndicatorSize.label,
// //                 controller: _tabController,
// //                 indicatorColor: AppColors.black,
// //                 labelColor: AppColors.black,
// //                 unselectedLabelColor: AppColors.unseletedTabColor,
// //                 labelStyle: TextStyle(
// //                   fontFamily: "spaceGrotesk",
// //                   fontSize: 13,
// //                 ),
// //                 tabs: [
// //                   Tab(text: 'Children Benefits',),
// //                   Tab(text: 'How to use?'),
// //                   Tab(text: 'Payment'),
// //                   Tab(text: 'Parents'),
// //                 ],
// //                 onTap: (index) {
// //                   setState(() {
// //                     _selectedIndex = index;
// //                   });
// //                 },
// //               ),
// //             ),
// //             Divider(
// //               color: AppColors.dividerColor,
// //             ),
// //             Expanded(
// //               child: TabBarView(
// //
// //                 controller: _tabController,
// //                 children: [
// //                   Container(
// //                     margin: EdgeInsets.symmetric(horizontal: 20),
// //                     decoration: BoxDecoration(
// //                       color: AppColors.transhparent,
// //                     ),
// //                     child: ListView.builder(
// //                       itemCount: 5,
// //                         itemBuilder: (context, index) {
// //                       return Column(
// //                         children: [
// //                           Row(
// //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                             children: [
// //                               CustomText(text: "How long does it take to refund ?", fontSize: 14, textColor: AppColors.black),
// //                               Icon(Icons.arrow_forward_ios),
// //                             ],
// //                           ),
// //                           Divider(
// //                             color: AppColors.dividerColor,
// //                           )
// //                         ],
// //                       );
// //                     }),
// //                   ),
// //                   Container(
// //                     margin: EdgeInsets.symmetric(horizontal: 20),
// //                     decoration: BoxDecoration(
// //                       color: AppColors.transhparent,
// //                     ),
// //                     child: ListView.builder(
// //                         itemCount: 5,
// //                         itemBuilder: (context, index) {
// //                           return Column(
// //                             children: [
// //                               Row(
// //                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                                 children: [
// //                                   CustomText(text: "How long does it take to refund ?", fontSize: 14, textColor: AppColors.black),
// //                                   Icon(Icons.arrow_forward_ios),
// //                                 ],
// //                               ),
// //                               Divider(
// //                                 color: AppColors.dividerColor,
// //                               )
// //                             ],
// //                           );
// //                         }),
// //                   ),
// //                   Container(
// //                     margin: EdgeInsets.symmetric(horizontal: 20),
// //                     decoration: BoxDecoration(
// //                       color: AppColors.transhparent,
// //                     ),
// //                     child: ListView.builder(
// //                         itemCount: 5,
// //                         itemBuilder: (context, index) {
// //                           return Column(
// //                             children: [
// //                               Row(
// //                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                                 children: [
// //                                   CustomText(text: "How long does it take to refund ?", fontSize: 14, textColor: AppColors.black),
// //                                   Icon(Icons.arrow_forward_ios),
// //                                 ],
// //                               ),
// //                               Divider(
// //                                 color: AppColors.dividerColor,
// //                               )
// //                             ],
// //                           );
// //                         }),
// //                   ),
// //                   Container(
// //                     margin: EdgeInsets.symmetric(horizontal: 20),
// //                     decoration: BoxDecoration(
// //                       color: AppColors.transhparent,
// //                     ),
// //                     child: ListView.builder(
// //                         itemCount: 5,
// //                         itemBuilder: (context, index) {
// //                           return Column(
// //                             children: [
// //                               Row(
// //                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                                 children: [
// //                                   CustomText(text: "How long does it take to refund ?", fontSize: 14, textColor: AppColors.black),
// //                                   Icon(Icons.arrow_forward_ios),
// //                                 ],
// //                               ),
// //                               Divider(
// //                                 color: AppColors.dividerColor,
// //                               )
// //                             ],
// //                           );
// //                         }),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
