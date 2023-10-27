/* import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:happyheart/Constant/background.dart';
import 'package:happyheart/Constant/customTextButtton.dart';

import '../Constant/CustomText.dart';
import '../utils/colors.dart';
import '../utils/image_path.dart';

class PlayRecording extends StatefulWidget {
  const PlayRecording({Key? key}) : super(key: key);

  @override
  _PlayRecordingState createState() => _PlayRecordingState();
}

class _PlayRecordingState extends State<PlayRecording> {
  bool isPlay = true;
  AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  bool isPaused = false;
  Duration audioDuration = Duration();
  Duration audioPosition = Duration();

  @override
  void initState() {
    super.initState();

    audioPlayer.onDurationChanged.listen((Duration duration) {
      setState(() {
        audioDuration = duration;
      });
    });

    // audioPlayer.onAudioPositionChanged.listen((Duration position) {
    //   setState(() {
    //     audioPosition = position;
    //   });
    // });

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
    audioPlayer.release();
    audioPlayer.dispose();
    super.dispose();
  }

  void playAudio() async {
    String url =
        "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3";
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
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.borderColor),
                            child: IconButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                icon: Icon(Icons.clear)),
                          ),
                        ),
                        Image.asset(ImagePath.smallhhlogo),
                      ],
                    ),
                    SizedBox(width:MediaQuery.of(context).size.width/1.8,),
                    Icon(
                      Icons.favorite,
                      color: AppColors.appPrimaryColor,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 15,
              ),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container(
                        height: 450,
                        decoration: BoxDecoration(image: DecorationImage(image:AssetImage(ImagePath.yellowBackground),fit: BoxFit.fill)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("💗 Audio is to be played just before an afternoon nap or at bedtime.\n\n💗 Listen to the audio before playing it for your child.\n\n💗 Snuggle into bed, put your arms around your child and play the audio.\n\n💗 Make them feel safe, secure, and loved.\n\n💗 Audios can be repeated – at 3 days intervals.\n\n💗 One topic recommended per week, can be heard 2-3 times over.\n\n💗 Go slow and steady as the audio will take time to immerse and avoid physical upheaval as the cells are adjusting in the child's tender body.",
                             style: TextStyle(fontSize: 19, color: AppColors.primarytextColor,fontFamily: 'Fresca',fontWeight: FontWeight.bold),
                               textAlign: TextAlign.justify,),
                        ),
                      );
                    },
                  );
                },
                child: CustomeTextButton(
                    width: MediaQuery.of(context).size.width / 1.1,
                    padding: MediaQuery.of(context).size.height / 20,
                    borderColor: AppColors.borderColor,
                    text: 'Zap Instruction',
                    borderWidth: 2, bacgroundColor: AppColors.appPrimaryColor,),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 5,
              ),
              CustomText(
                  text: "\"Test Audio Name\"",
                  fontSize: 35,
                  textColor: AppColors.black),
              SizedBox(
                height: MediaQuery.of(context).size.height / 6,
              ),
              Container(
                // margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Container(
                    //   decoration: BoxDecoration(
                    //       color: AppColors.appPrimaryColor,
                    //       shape: BoxShape.circle),
                    //   child: Icon(
                    //     Icons.arrow_left_sharp,
                    //     size: 50,
                    //     color: AppColors.borderColor,
                    //   ),
                    // ),
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.appPrimaryColor,
                          shape: BoxShape.circle),
                      child: GestureDetector(
                          onTap: () {
                            // setState(() {
                            //   isPlay = !isPlay;
                            // });
                            print(isPlaying);
                            if (!isPlaying) {
                              print("this is plataudio");
                              playAudio();
                            } else if (isPaused) {
                              resumeAudio();
                              print("this is resumeAudio");
                            } else {
                              pauseAudio();
                              print("this is pause AUdio");
                            }
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
                                )),
                    ),
                    // Container(
                    //   decoration: BoxDecoration(
                    //       color: AppColors.appPrimaryColor,
                    //       shape: BoxShape.circle),
                    //   child: Icon(
                    //     Icons.arrow_right_sharp,
                    //     size: 50,
                    //     color: AppColors.borderColor,
                    //   ),
                    // ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}*/

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import '../../Constant/CustomText.dart';
import '../../Constant/background.dart';
import '../../Constant/customTextButtton.dart';
import '../../utils/colors.dart';
import '../../utils/config.dart';
import '../../utils/image_path.dart';

class PlayRecording extends StatefulWidget {
  final String audioName;
  final String englishUrl;
  final String hindiUrl;
  final String gujaratiUrl;
  final List<String> zapInstruction;
  const PlayRecording(
      {Key? key,
      required this.audioName,
      required this.englishUrl,
      required this.hindiUrl,
      required this.gujaratiUrl,
      required this.zapInstruction})
      : super(key: key);

  @override
  _PlayRecordingState createState() => _PlayRecordingState();
}

class _PlayRecordingState extends State<PlayRecording> {
  bool isPlay = true;
  AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  bool isPaused = false;
  Duration audioDuration = Duration();
  Duration audioPosition = Duration();
  String selectedLanguage = 'English';
  String? url;
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
    url = "${Config.imageUserUrl}${widget.englishUrl}";
  }

  @override
  void dispose() {
    audioPlayer.release();
    audioPlayer.dispose();
    super.dispose();
  }

  void playAudio() async {
    await audioPlayer.play(UrlSource(url!));

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
                height: MediaQuery.of(context).size.height / 15,
              ),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container(
                        height: 450,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(ImagePath.yellowBackground),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView.builder(
                              itemCount: widget.zapInstruction.length,
                              itemBuilder: (context, index) {
                                return Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "💗 ",
                                      style: TextStyle(
                                        fontSize: 19,
                                        color: AppColors.primarytextColor,
                                        fontFamily: 'Fresca',
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                    Flexible(
                                      child: Text(
                                        "${widget.zapInstruction[index]}\n",
                                        style: TextStyle(
                                          fontSize: 19,
                                          color: AppColors.primarytextColor,
                                          fontFamily: 'Fresca',
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.justify,
                                      ),
                                    ),
                                  ],
                                );
                              }),
                        ),
                      );
                    },
                  );
                },
                child: CustomeTextButton(
                  width: MediaQuery.of(context).size.width / 1.1,
                  padding: MediaQuery.of(context).size.height / 20,
                  borderColor: AppColors.borderColor,
                  text: 'Zap Instruction',
                  fontSize: 24,
                  borderWidth: 2,
                  fontWeight: FontWeight.bold,
                  bacgroundColor: AppColors.appPrimaryColor,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 5,
              ),
              CustomText(
                text: "${widget.audioName}",
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
                          url = Config.imageUserUrl +
                              widget.englishUrl.toString();
                          print(url);
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
                          url = "${Config.imageUserUrl}${widget.hindiUrl}";
                          print(url);
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
                          // Add your logic for Gujarati language selection
                          url = "${Config.imageUserUrl}${widget.gujaratiUrl}";
                          print(url);
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
// Audio is to be played just before an afternoon nap or at bedtime.\n\n💗 Listen to the audio before playing it for your child.\n\n💗 Snuggle into bed, put your arms around your child and play the audio.\n\n💗 Make them feel safe, secure, and loved.\n\n💗 Audios can be repeated – at 3 days intervals.\n\n💗 One topic recommended per week, can be heard 2-3 times over.\n\n💗 Go slow and steady as the audio will take time to immerse and avoid physical upheaval as the cells are adjusting in the child's tender body.
