import 'package:flutter/material.dart';
import 'package:happyheart/Constant/CustomText.dart';
import 'package:happyheart/screens/Subscription/subscription_page.dart';
// import 'package:happyheart/Constant/customTextButtton';
import 'package:happyheart/utils/colors.dart';

import '../../Constant/background.dart';
import '../../Constant/customTextButtton.dart';
import '../../utils/image_path.dart';
import '../SignUpScreen/signUpScreen.dart';
import 'package:video_player/video_player.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  _GetStartedState createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  late VideoPlayerController controller;
  int currentIndex = 0;
  PageController? _controller;

  //from raj gpt
  // Future<void> _launchUrl(String urltoload) async {
  //   if (!await launchUrl(Uri.parse(urltoload))) {
  //     throw Exception('Could not launch $urltoload');
  //   }
  // }

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
    // controller = VideoPlayerController.asset("assets/videohh.mp4");
    // controller?.setLooping(true);
    // controller?.setVolume(1);
    // controller?.play();
    controller = VideoPlayerController.asset("assets/videohh.mp4")
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pageViewList = [
      Container(
        child: Column(
          children: [
            // SizedBox(
            //   height: MediaQuery.of(context).size.height/180,
            //
            // ),
            Image.asset(
              ImagePath.girlLogo,
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width / 2,
            ),
            //  SizedBox(
            //   height: MediaQuery.of(context).size.height/180,
            // ),
            // const Text(
            //   "Children Are The Future!",
            //   style: TextStyle(
            //     fontFamily: "Poppins",
            //     color: AppColors.hhred,
            //     fontWeight: FontWeight.w600,
            //     fontSize: 40,
            //   ),
            // ),
            CustomText(
              text: "Children Are The Future!",
              textColor: AppColors.hhred,
              fontSize: MediaQuery.of(context).size.height / 24,
              // fontWeight: FontWeight.w600,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 90,
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
              child: RichText(
                text: TextSpan(
                    text:
                        "You have made an incredible choice to create peace in your home by helping your child ",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height / 38,
                      color: AppColors.primarytextColor,
                      fontFamily: 'Poppins',
                      // fontWeight: FontWeight.w600,
                    ),
                    children: [
                      TextSpan(
                          text: "TODAY ",
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height / 38,
                            color: AppColors.hhred,
                            fontFamily: 'Poppins',
                            // fontWeight: FontWeight.w600,
                          )),
                      TextSpan(
                          text:
                              ".Support and help them overcome prolonged and every-   day problems by embarking on this transformational journey of deep cellular healing.",
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height / 38,
                            color: AppColors.primarytextColor,
                            fontFamily: 'Poppins',
                            // fontWeight: FontWeight.w600,
                          ))
                    ]),
                textAlign: TextAlign.justify,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 15,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width / 10,
                  0,
                  MediaQuery.of(context).size.width / 10,
                  0),
              child:
                  // AutoSizeText(
                  //     'Are you Ready to Change your Child’s Life?',
                  //     maxFontSize: 40,
                  //     minFontSize: 39)
                  CustomText(
                text: "Are you Ready to Change your Child's Life?",
                fontSize: MediaQuery.of(context).size.height / 24,
                textColor: AppColors.hhred,
              ),
            )
          ],
        ),
      ),
      GestureDetector(
        onTap: () {
          setState(() {
            if (controller?.value.isPlaying == true) {
              controller?.pause();
            } else {
              controller?.play();
            }
          });
        },
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width / 40,
                  right: MediaQuery.of(context).size.width / 40),
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height *
                    0.8, // Adjust the desired height
                child: AspectRatio(
                  aspectRatio: controller?.value.aspectRatio ?? 16 / 9,
                  child: Container(child: VideoPlayer(controller!)),
                ),
              ),
            ),
            Positioned.fill(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  if (controller?.value.isPlaying != true)
                    Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 50,
                    ),
                ],
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.fast_rewind,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          final currentPosition = controller?.value.position;
                          final duration = controller?.value.duration;
                          if (currentPosition != null &&
                              duration != null &&
                              currentPosition > Duration(seconds: 10)) {
                            controller?.seekTo(
                                currentPosition - Duration(seconds: 10));
                          }
                        });
                      },
                    ),
                    SizedBox(width: 16),
                    IconButton(
                      icon: Icon(
                        controller?.value.isPlaying == true
                            ? Icons.pause
                            : Icons.play_arrow,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          if (controller?.value.isPlaying == true) {
                            controller?.pause();
                          } else {
                            controller?.play();
                          }
                        });
                      },
                    ),
                    SizedBox(width: 16),
                    IconButton(
                      icon: Icon(
                        Icons.fast_forward,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          final currentPosition = controller?.value.position;
                          final duration = controller?.value.duration;
                          if (currentPosition != null &&
                              duration != null &&
                              currentPosition <
                                  duration - Duration(seconds: 10)) {
                            controller?.seekTo(
                                currentPosition + Duration(seconds: 10));
                          }
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // Center(
      //   child: controller.value.isInitialized
      //       ? AspectRatio(
      //           aspectRatio: controller.value.aspectRatio,
      //           child: VideoPlayer(controller),
      //         )
      //       : Container(),
      // ),
      Container(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height/10,),
            Image.asset(
              ImagePath.boyLogo,
              height: MediaQuery.of(context).size.height / 3.9,
              width: MediaQuery.of(context).size.width / 1,
            ),
            // SizedBox(height: 0,

            Padding(
              padding: const EdgeInsets.all(5),
              child: CustomText(
                text: " Stop waiting",
                fontSize: MediaQuery.of(context).size.height / 24,
                textColor: AppColors.hhred,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 50,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.height / 20,
                  0,
                  MediaQuery.of(context).size.height / 20,
                  0),
              child: RichText(
                text: TextSpan(
                    text:
                        "The time will never be just right. Get the most out of this wallet-friendly sale TODAY!",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height / 38,
                      color: AppColors.primarytextColor,
                      fontFamily: 'Poppins',
                      // fontWeight: FontWeight.w600,
                    ),
                    children: [
                      TextSpan(
                          text: " 10% off on your first subscription ",
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height / 38,
                            color: AppColors.hhred,
                            fontFamily: 'Fresca',
                            // fontWeight: FontWeight.w600,
                          )),
                      TextSpan(
                          text:
                              "to The Happy Hearts. Club-An offer full of Happiness and Hearts !",
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height / 38,
                            color: AppColors.primarytextColor,
                            fontFamily: 'Poppins',
                            // fontWeight: FontWeight.w600,
                          ))
                    ]),
                textAlign: TextAlign.justify,
              ),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height / 9,
            ),
            // CustomeTextButton(
            //   onTap: InkWell(
            //     onTap: () {
            //       Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //             builder: (context) => SubscriptionPage(),
            //           ));
            //     },
            //   ),
            //   width: MediaQuery.of(context).size.width / 3,
            //   borderColor: Color(0xFFFFFFFF),
            //   bacgroundColor: Color(0xFFFA4A71),
            //   text: "Avail Now",
            //   borderWidth: 2,
            // ),
          ],
        ),
      )
    ];
    return Scaffold(
        body: BackgroundSetup(
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Container(
          child: Column(
            children: [
              Flexible(
                child: PageView.builder(
                    physics: PageScrollPhysics(),
                    controller: _controller,
                    itemCount: pageViewList.length,
                    onPageChanged: (int index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return pageViewList[index];
                    }),
              ),
              currentIndex == 0
                  ? Padding(
                      padding: EdgeInsets.fromLTRB(36, 0, 35, 0),
                      child:
                          // AutoSizeText(
                          //     'Are you Ready to Change your Child’s Life?',
                          //     maxFontSize: 40,
                          //     minFontSize: 39)
                          Text(
                        "",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height / 24,
                            color: AppColors.hhred,
                            fontFamily: "Poppins"),
                      ),
                    )
                  : Text(
                      "\n\n\n\n",
                    ),
              TextButton(
                  onPressed: () {
                    if (currentIndex == pageViewList.length - 1) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpScreen()));
                    }
                    _controller?.nextPage(
                        duration: Duration(milliseconds: 100),
                        curve: Curves.bounceIn);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 40, top: 0),
                    child: CustomeTextButton(
                      width: MediaQuery.of(context).size.width / 1.2,
                      borderColor: Color(0xFFFFFFFF),
                      bacgroundColor: Color(0xFFFA4A71),
                      text: currentIndex == pageViewList.length - 1
                          ? "Explore"
                          : "Next",
                      borderWidth: 2,
                    ),
                  )),
            ],
          ),
        ),
      ),
    ));
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
    controller?.dispose();
  }
}
