import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:happyheart/screens/playrecording/playrecording.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/api_calling/user_api_calling/audio_status_api_calling.dart';
import '../data/model/audio_status_model.dart';
import '../screens/Subscription/single_audio_subscription_page.dart';
import '../utils/colors.dart';
import 'CustomText.dart';
import 'loader.dart';

class CustomMusicIndicator extends StatefulWidget {
  final String Image;
  final String text;
  final Color imageCirucularColor;
  final Color ContainerColor;
  Color? logoColor;
  IconData? icon;
  final String audioName;
  final String englishUrl;
  final String hindiUrl;
  final String gujaratiUrl;
  final String audioId;
  final List<String> zapInstruction;
  final String audioDuration;
  final String audioPrice;
  CustomMusicIndicator(
      {Key? key,
      this.logoColor,
      this.icon = Icons.favorite_border,
      required this.Image,
      required this.text,
      required this.imageCirucularColor,
      required this.ContainerColor,
      required this.audioName,
      required this.englishUrl,
      required this.hindiUrl,
      required this.gujaratiUrl,
      required this.zapInstruction, required this.audioId, this.audioDuration="15 Days", this.audioPrice = "399"})
      : super(key: key);

  @override
  _CustomMusicIndicatorState createState() => _CustomMusicIndicatorState();
}

class _CustomMusicIndicatorState extends State<CustomMusicIndicator> {
  String? userId;
  String? childId;

  getUserId() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    userId = preferences.getString("userId");
    childId = preferences.getString("childId");
  }
  void checkAudioStatus(String userid ,String childId,String audioId ) async {
    showLoader(); // Show the loader dialog

    try {
      final AudioStatusModel? response =
      await AudioApiCalling().audioStatusApiCalling(userId: userid,childId: childId,audioId: audioId);

      if (response != null && response.isSuccess!) {
        if (response.data!.audioPurchase!) {
          Navigator.of(context).pop();
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => PlayRecording(
                audioName: widget.audioName,
                englishUrl: widget.englishUrl,
                hindiUrl: widget.hindiUrl,
                gujaratiUrl: widget.gujaratiUrl,
                zapInstruction: widget.zapInstruction,
              )));


        } else {
          // User has not purchased the audio
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => SingAudioSubscriptionPage(audioPrice: widget.audioPrice, audioDuration: widget.audioDuration, sId: widget.audioId, musicName: widget.audioName, imageUrl: widget.Image, color: widget.imageCirucularColor,)));
          Fluttertoast.showToast(msg: "Audio Not Purchased");
        }
      } else {
        // Error occurred during API call
        Fluttertoast.showToast(msg: "Failed to login. Please try again.");
      }
    } catch (e) {
      print('API request failed with error: $e');
      Fluttertoast.showToast(msg: "Failed to login. Please try again.");
    }
  }
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserId();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        checkAudioStatus(userId!,childId!, widget.audioId);
      },
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 115,
            width: 115,
            margin: EdgeInsets.only(left: 20, top: 20),
            child: Stack(
              children: <Widget>[
                Container(
                    decoration: BoxDecoration(
                        color: AppColors.borderColor,
                        shape: BoxShape.circle,
                        border:
                            Border.all(color: widget.ContainerColor, width: 5)),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: CircleAvatar(
                        radius: MediaQuery.of(context).size.width * 0.109,
                        backgroundImage: NetworkImage(widget.Image),
                        backgroundColor: AppColors.borderColor,
                      ),
                    ))
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.height / 3.5,
            height: 100,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Container(
                decoration: BoxDecoration(color: widget.ContainerColor),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Padding(
                          padding: EdgeInsets.all(14.0),
                          child: CustomText(
                            text: widget.text,
                            fontSize: MediaQuery.of(context).size.height / 40,
                            textColor: AppColors.black,
                            align: TextAlign.left,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          LayoutBuilder(
                            builder: (BuildContext context,
                                BoxConstraints constraints) {
                              return Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.borderColor,
                                ),
                                child: Icon(
                                  widget.icon,
                                  color: widget.logoColor,
                                  size: 10,
                                ),
                              );
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void onGooglePayResult(paymentResult) {
    print(paymentResult);
    Fluttertoast.showToast(msg: "Payment Successful");
    Navigator.of(context).pop();
  }
}
