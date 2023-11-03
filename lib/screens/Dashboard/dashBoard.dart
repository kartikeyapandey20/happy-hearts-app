import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:happyheart/Constant/background.dart';
import 'package:happyheart/screens/Notification/Notification.dart';
import 'package:happyheart/screens/OutMagicalZap/OurMagicalZap.dart';
import 'package:happyheart/screens/PaymentGateway/insta_mojo_demo.dart';
import 'package:happyheart/screens/PaymentGateway/updated_payment_getway.dart';
import 'package:happyheart/screens/Recently%20added/recentlyadded.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:string_capitalize_extension/string_capitalize_extension.dart';

import '../../../Constant/CustomText.dart';
import '../../../utils/colors.dart';
import '../../../utils/image_path.dart';
// import '../Activethistory/activity_history.dart';
import '../Activethistory/activity_history.dart';
import 'Drawer/drawer.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  String name = "";
  int currentQuoteIndex = 0;
  String? userID;
  int carouselIndex = 0;
  CarouselController carouselController = CarouselController();
  loadDataFromSession() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    name = preferences.getString("firstName")!;
    userID = preferences.getString("userId");
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    loadDataFromSession();
    int currentDay = DateTime.now().day;
    currentQuoteIndex = currentDay - 1;
    print(name);

    Timer.periodic(Duration(days: 1), (Timer timer) {
      setState(() {
        // Increment the current quote index
        currentQuoteIndex = (currentQuoteIndex + 1) % dailyQuotes.length;
      });
    });
  }

  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];
  List<String> dailyQuotes = [
    "There is a wisdom in children, a kind of knowing, a kind of believing, that we, as adults, do not have. There is a time when a kingdom needs its children.",
    "A child’s life is like a piece of paper on which every passerby leaves a mark.",
    "If we nurture the dreams of children, the world will be blessed. If we destroy them, the world is doomed!",
    "A child is an uncut diamond.",
    "Keep your children wild - don't make them grow up too fast.",
    "Every child has a different learning style and pace. Each child is unique, not only capable of learning but also capable of succeeding.",
    "If we want our children to move mountains, we first have to let them get out of their chairs.",
    "Fairy tales in childhood are stepping stones throughout life, leading the way through trouble and trial.",
    "The way we talk to our children becomes their inner voice.",
    "The mother's heart is the child's schoolroom.",
    "Children are born innocent.",
    "If you want your children to turn out well, spend twice as much time with them, and half as much money.",
    "There's nothing more contagious than the laughter of young children; it doesn't even have to matter what they're laughing about.",
    "We carry our childhood with us.",
    "While we try to teach our children all about life, our children teach us what life is all about.",
    "Grown-up people do not know that a child can give exceedingly good advice even in the most difficult case.",
    "Children need room to imagine and learn.",
    "Children are living beings - more living than grown-up people who have built shells of habit around themselves.",
    "Today our children are our reflection. Tomorrow they will be our shadows.",
    "Children see magic because they look for it.",
    "Just think of the tragedy of teaching children not to doubt.",
    "To me there is no picture so beautiful as smiling, bright-eyed, happy children; no music so sweet as their clear and ringing laughter.",
    "Listen to the desires of your children. Encourage them and then give them the autonomy to make their own decision.",
    "Too much love never spoils children. Children become spoiled when we substitute 'presents' for 'presence'.",
    "Do not keep children to their studies by compulsion but by play.",
    "Children, no matter how gifted, can't see far into the future, you know. To them, a year is almost a lifetime, and telling them that things will be fine when they grow up does no good at all.",
    "Teaching children about the natural world should be seen as one of the most important events in their lives.",
    "Nothing matters more to a child than a place to call home.",
    "Like stars are to the sky, so are the children to our world. They deserve to shine!",
    "Children need the freedom and time to play. Play is not a luxury; Play is a necessity.",
    "Teach your children they’re unique. That way, they won’t feel pressured to be like everybody else."
  ];

  List<String> authors = [
    "Adam Gidwitz",
    "Chinese Proverb",
    "Wess Stafford",
    "Austin O'Malley",
    "Brooke Hampton",
    "Robert John Meehan",
    "Nicolette Sowder",
    "L.R. Knost",
    "Peggy O'Mara",
    "Henry Ward Beecher",
    "Nikki Sixx",
    "Abigail Van Buren",
    "Criss Jami",
    "Gary D. Schmidt",
    "Angela Schwindt",
    "Fyodor Dostoyevsky",
    "Unknown",
    "Rabindranath Tagore",
    "Maralee McKee",
    "Christopher Moore",
    "Clarence Darrow",
    "P. T. Barnum",
    "Denis Waitley",
    "Anthony Witham",
    "Plato",
    "John Saul",
    "Thomas Berry",
    "Brenda Donald",
    "Chinonye J. Chidolue",
    "Kay Redfield Jamison",
    "Cindy Cashman"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        drawer: NavDrawer(
          name: name,
          onProfileImageSelected: null,
        ),
        body: YellowBacground(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 20),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            if (!scaffoldKey.currentState!.isDrawerOpen) {
                              //check if drawer is closed
                              scaffoldKey.currentState!
                                  .openDrawer(); //open drawer
                            }
                          },
                          icon: Icon(Icons.menu)),
                      Image.asset(ImagePath.smallhhlogo),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: "Hi, " + name.onlyFirstCase,
                              fontSize: MediaQuery.of(context).size.height / 24,
                              textColor: AppColors.appPrimaryColor,
                            ),
                            IconButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          NotificationScreen()));
                                },
                                icon: Icon(
                                  Icons.notifications_none,
                                  size: 30,
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 100,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // SizedBox(
                      //   height: ,
                      // ),
                      // Column(
                      //   children: [
                      //     Row(
                      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //       children: [
                      //         Text(
                      //           "Trending Offers & Services",
                      //         ),
                      //       ],
                      //     ),
                      //     Padding(
                      //       padding: const EdgeInsets.only(top: 18.0),
                      //       child: CarouselSlider(
                      //           items: imgList
                      //               .map((item) => Container(
                      //                     width:
                      //                         MediaQuery.of(context).size.width,
                      //                     decoration: BoxDecoration(
                      //                         color: Colors.white,
                      //                         borderRadius:
                      //                             BorderRadius.circular(10)),
                      //                     child: Center(
                      //                         child: ClipRRect(
                      //                             borderRadius:
                      //                                 BorderRadius.circular(10),
                      //                             child: Image.network(
                      //                               item,
                      //                               height:
                      //                                   MediaQuery.of(context)
                      //                                           .size
                      //                                           .height *
                      //                                       0.16,
                      //                               width:
                      //                                   MediaQuery.of(context)
                      //                                       .size
                      //                                       .width,
                      //                               fit: BoxFit.fill,
                      //                             ))),
                      //                   ))
                      //               .toList(),
                      //           carouselController: carouselController,
                      //           options: CarouselOptions(
                      //             height:
                      //                 MediaQuery.of(context).size.height * 0.16,
                      //             aspectRatio: 16 / 9,
                      //             viewportFraction: 1,
                      //             initialPage: 0,
                      //             enableInfiniteScroll: true,
                      //             reverse: false,
                      //             autoPlay: true,
                      //             autoPlayInterval: const Duration(seconds: 3),
                      //             autoPlayAnimationDuration:
                      //                 const Duration(milliseconds: 800),
                      //             autoPlayCurve: Curves.fastOutSlowIn,
                      //             enlargeCenterPage: true,
                      //             onPageChanged: (val, frf) {
                      //               carouselIndex = val;
                      //               setState(() {});
                      //             },
                      //             scrollDirection: Axis.horizontal,
                      //           )),
                      //     ),
                      //     Row(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: imgList.asMap().entries.map((entry) {
                      //         return GestureDetector(
                      //           onTap: () =>
                      //               carouselController.animateToPage(entry.key),
                      //           child: Container(
                      //             width: carouselIndex == entry.key
                      //                 ? MediaQuery.of(context).size.width *
                      //                     0.025
                      //                 : MediaQuery.of(context).size.width *
                      //                     0.015,
                      //             height:
                      //                 MediaQuery.of(context).size.height * 0.02,
                      //             margin: const EdgeInsets.symmetric(
                      //                 vertical: 8.0, horizontal: 4.0),
                      //             decoration: BoxDecoration(
                      //                 shape: BoxShape.circle,
                      //                 color: carouselIndex == entry.key
                      //                     ? AppColors.primarytextColor
                      //                     : Colors.grey.shade400),
                      //           ),
                      //         );
                      //       }).toList(),
                      //     ),
                      //   ],
                      // ),
                      CustomText(
                          text: "We wish you a great day !",
                          fontSize: MediaQuery.of(context).size.height / 28,
                          textColor: AppColors.primarytextColor2),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => OurMagicalZap()));
                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (context) => InstaMojoDemo()));
                          },
                          child: Container(
                              height: MediaQuery.of(context).size.height / 9,
                              width: MediaQuery.of(context).size.width / 2.3,
                              decoration: BoxDecoration(
                                  color: AppColors.hhgrey2,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Padding(
                                  padding: EdgeInsets.only(
                                    left: 10.0,
                                    top:
                                        MediaQuery.of(context).size.height / 34,
                                  ),
                                  // child: Align(
                                  //     // alignment: Alignment.bottomCenter,
                                  child: Column(children: [
                                    // SizedBox(
                                    // child:
                                    Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                15,
                                            top: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                80),
                                        child: CustomText(
                                            text: "Start",
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                28,
                                            align: TextAlign.left,
                                            textColor:
                                                AppColors.primarytextColor),
                                      ),
                                    ),
                                    // SizedBox(
                                    //   height: 20,
                                    // )
                                  ])))),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              print("this is userId : $userID");
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height / 9,
                              width: MediaQuery.of(context).size.width / 1.2,
                              decoration: BoxDecoration(
                                  color: AppColors.hhpink,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: 10.0,
                                  top: MediaQuery.of(context).size.height / 35,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ActivityHistory()));
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                15,
                                            top: 12),
                                        child: CustomText(
                                          text: "Activity History",
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              28,
                                          textColor: AppColors.borderColor,
                                          align: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          height: MediaQuery.of(context).size.height / 9,
                          width: MediaQuery.of(context).size.width / 1.2,
                          decoration: BoxDecoration(
                              color: AppColors.hhgreen,
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                              padding: EdgeInsets.only(
                                left: 10.0,
                                top: MediaQuery.of(context).size.width / 17,
                              ),
                              // child: Align(
                              //     // alignment: Alignment.bottomCenter,
                              child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  // crossAxisAlignment: CrossAxisAlignment.end,
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // SizedBox(
                                    // child:
                                    Align(
                                      alignment: Alignment.bottomLeft,
                                      child: InkWell(
                                        onTap: () => {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      RecentlyAdded()))
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  15,
                                              top: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  80),
                                          child: CustomText(
                                              text: "Recently Added",
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  28,
                                              align: TextAlign.start,
                                              textColor:
                                                  AppColors.primarytextColor),
                                        ),
                                      ),
                                    ),
                                    // SizedBox(
                                    //   height: 20,
                                    // )
                                  ]))),
                      // CustomText(
                      //   text: "Recommend For You",
                      //   fontSize: 24,
                      //   textColor: AppColors.primarytextColor2,
                      //   align: TextAlign.left,
                      // ),
                      // SizedBox(height: 10,),
                      // Container(
                      //   height: MediaQuery.of(context).size.height / 5,
                      //   width: MediaQuery.of(context).size.height / 4,
                      //   decoration: BoxDecoration(
                      //       color: AppColors.hhgreen,
                      //       borderRadius: BorderRadius.circular(12)),
                      //   child: Padding(
                      //     padding: const EdgeInsets.only(
                      //       left: 10.0,
                      //       top: 30,
                      //     ),
                      //     child: Align(
                      //       alignment: Alignment.bottomCenter,
                      //       child: Column(
                      //         mainAxisAlignment: MainAxisAlignment.end,
                      //         crossAxisAlignment: CrossAxisAlignment.end,
                      //         // crossAxisAlignment: CrossAxisAlignment.start,
                      //         children: [
                      //           CustomText(
                      //               text: "Recently Added",
                      //               fontSize: 18,
                      //               textColor: AppColors.primarytextColor),
                      //           SizedBox(
                      //             height: 20,
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: CustomText(
                          text: "Daily quote",
                          fontSize: 30,
                          textColor: AppColors.hhred,
                          align: TextAlign.left,
                        ),
                      ),

                      SizedBox(
                        height: 10,
                      ),

                      Padding(
                        padding: EdgeInsets.fromLTRB(3, 0, 20, 0),
                        child: Column(
                          children: [
                            // CustomText(
                            //   text:
                            //       "“Children are like flowers, tender shoots. They already have within them an inherent predisposition towards good. Bring this to fruition. They are God's gifts. Comprehend their worth. Do not belittle them. Nurture them so that they become firmly rooted in your Faith. Truly appreciate your children's worth.\"",
                            //   fontSize: MediaQuery.of(context).size.height / 30,
                            //   textColor: AppColors.primarytextColor2,
                            //   align: TextAlign.justify,
                            // ),
                            // CustomText(
                            //   text:
                            //       "      -H.H. Dr.  Syedna Mohammed\nBurhanuddin",
                            //   fontSize: MediaQuery.of(context).size.height / 30,
                            //   textColor: AppColors.primarytextColor2,
                            //   align: TextAlign.right,
                            // ),

                            CustomText(
                              text: "“${dailyQuotes[currentQuoteIndex]}“",
                              fontSize: MediaQuery.of(context).size.height / 30,
                              textColor: AppColors.primarytextColor2,
                              align: TextAlign.justify,
                            ),
                            CustomText(
                              text: "-${authors[currentQuoteIndex]}",
                              fontSize: MediaQuery.of(context).size.height / 30,
                              textColor: AppColors.primarytextColor2,
                              align: TextAlign.right,
                            ),
                          ],
                        ),
                      ),
                      // CustomeTextButton(
                      //   borderColor: AppColors.transhparent,
                      //   bacgroundColor: AppColors.hhblue,
                      //   text:
                      //
                      //   "“Children are like flowers, tender shoots. They already have within them an inherent predisposition towards good. Bring this to fruition. They are God's gifts. Comprehend their worth. Do not belittle them. Nurture them so that they become firmly rooted in your Faith. Truly appreciate your children's worth.",
                      //   textColor: AppColors.black,
                      //   fontSize: 22,
                      //   borderWidth: 0,
                      //   textAlign: TextAlign.justify,
                      //   width: MediaQuery.of(context).size.width / 1.2,
                      //   height: MediaQuery.of(context).size.height/3.1,
                      // ),
                    ],
                  ),
                ),
                // showDialog(context: context, builder: builder)
                // HeartLoader()
                // Center(
                //   child: ElevatedButton(onPressed: (){
                //     showDialog(
                //       context: context,
                //       barrierDismissible: false,
                //       builder: (BuildContext context) {
                //         return Dialog(
                //           backgroundColor: Colors.transparent, // Make the dialog background transparent
                //           elevation: 0, // Remove the shadow
                //           child: Container(
                //             color: Colors.transparent, // Make the container color transparent
                //             child: HeartLoader(),
                //           ),
                //         );
                //       },
                //     );
                //   }, child: Text("tap me")),
                // )
              ],
            ),
          ),
        ));
  }
}
