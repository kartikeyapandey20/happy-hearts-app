import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../Constant/CustomText.dart';
import '../../Constant/background.dart';
import '../../Constant/customTextButtton.dart';
import '../../utils/colors.dart';
import '../../utils/config.dart';
import '../../utils/image_path.dart';

class FreePlayRecording extends StatefulWidget {
  const FreePlayRecording({Key? key}) : super(key: key);

  @override
  _FreePlayRecordingState createState() => _FreePlayRecordingState();
}

class _FreePlayRecordingState extends State<FreePlayRecording> {
  bool isPlay = true;
  AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  bool isPaused = false;
  Duration audioDuration = Duration();
  Duration audioPosition = Duration();
  String selectedLanguage = 'English';
  String url =
      "${Config.imageUserUrl}/uploads/audios/english/1694077440698-388424416.mp3";
  @override
  void initState() {
    super.initState();

    audioPlayer.onDurationChanged.listen((Duration duration) {
      setState(() {
        audioDuration = duration;
      });
    });

    audioPlayer.onPlayerComplete.listen((event) {
      setState(() {
        isPlaying = false;
      });
    });
    audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
      setState(() {
        if (state == PlayerState.playing) {
          isPlaying = true;
          isPaused = false;
        } else if (state == PlayerState.paused) {
          isPlaying = false;
          isPaused = true;
        } else if (state == PlayerState.stopped) {
          isPlaying = false;
          isPaused = false;
        }
      });
    });
  }

  @override
  void dispose() {
    // audioPlayer.release();
    audioPlayer.dispose();
    super.dispose();
  }

  void playAudio() async {
    // String url =
    //     "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3";

    print(url);
    await audioPlayer.play(UrlSource(url));

    setState(() {
      isPlaying = true;
      isPaused = false;
    });
  }

  void pauseAudio() async {
    await audioPlayer.pause();
  }

  void resumeAudio() async {
    await audioPlayer.resume();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TestContainer(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 20),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.borderColor,
                        ),
                        child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(Icons.clear),
                        ),
                      ),
                    ),
                    Image.asset(ImagePath.smallhhlogo),
                    Spacer(),
                    Icon(
                      Icons.favorite,
                      color: AppColors.appPrimaryColor,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 5,
              ),
              // InkWell(
              //   onTap: () {
              //     Fluttertoast.showToast(msg: "No instruction for Free Audio");
              //   },
              //   child: CustomeTextButton(
              //     width: MediaQuery.of(context).size.width / 1.1,
              //     padding: MediaQuery.of(context).size.height / 20,
              //     borderColor: AppColors.borderColor,
              //     text: 'Zap Instruction',
              //     borderWidth: 2,
              //     bacgroundColor: AppColors.appPrimaryColor,
              //   ),
              // ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 5,
              ),
              CustomText(
                text: "Free Audio",
                fontSize: 35,
                textColor: AppColors.black,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 6,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.appPrimaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (!isPlaying) {
                              playAudio();
                            } else if (isPaused) {
                              print("hey");

                              resumeAudio();
                            } else {
                              pauseAudio();
                            }
                          });
                        },
                        child: isPlaying
                            ? Icon(
                                Icons.pause,
                                size: 50,
                                color: Colors.white,
                              )
                            : Icon(
                                Icons.play_arrow,
                                size: 50,
                                color: Colors.white,
                              ),
                      ),
                    ),
                  ],
                ),
              ),

              // Language Options Buttons
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height / 35,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedLanguage = 'English';
                          // Add your logic for English language selection
                          url =
                              "${Config.imageUserUrl}/uploads/audios/english/1694077440698-388424416.mp3";
                          pauseAudio();
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: selectedLanguage == 'English'
                            ? Colors.pink
                            : AppColors.hhpink,
                      ),
                      child: CustomText(
                        text: 'English',
                        fontSize: 24,
                        textColor: Colors.white,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedLanguage = 'Hindi';
                          // Add your logic for Hindi language selection
                          url =
                              "${Config.imageUserUrl}/uploads/audios/hindi/1694077440290-242117370.mp3";
                          pauseAudio();
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: selectedLanguage == 'Hindi'
                            ? Colors.pink
                            : AppColors.hhpink,
                      ),
                      child: CustomText(
                        text: 'Hindi',
                        fontSize: 24,
                        textColor: Colors.white,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedLanguage = 'Gujarati';
                          url =
                              "${Config.imageUserUrl}/uploads/audios/gujarati/1694077440963-773521733.mp3";
                          pauseAudio();
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: selectedLanguage == 'Gujarati'
                            ? Colors.pink
                            : AppColors.hhpink,
                      ),
                      child: CustomText(
                        text: 'Gujarati',
                        fontSize: 24,
                        textColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
