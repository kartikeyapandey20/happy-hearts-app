import 'package:flutter/material.dart';
import 'package:happyheart/Constant/background.dart';
import 'package:happyheart/Constant/custom_purchase_audio.dart';
import 'package:happyheart/data/model/subscribtion_model.dart';
import 'package:happyheart/Constant/CustomText.dart';
import 'package:happyheart/utils/colors.dart';
import 'package:happyheart/utils/image_path.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SingAudioSubscriptionPage extends StatefulWidget {

  final String audioPrice;
  final String audioDuration;
  final String sId;
  final String musicName;
  final String imageUrl;
  final Color color;
  SingAudioSubscriptionPage(
      {Key? key, required this.audioPrice, required this.audioDuration, required this.sId, required this.musicName, required this.imageUrl, required this.color,})
      : super(key: key);
  @override
  _SingAudioSubscriptionPageState createState() => _SingAudioSubscriptionPageState();
}

class _SingAudioSubscriptionPageState extends State<SingAudioSubscriptionPage> {
  Future<SubscriptionModel>? _subscriptionModelFuture;

  String?  userId = "";
  String? childId = "";
  getUserId() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    userId = preferences.getString("userId");
    childId = preferences.getString("childId");

    print(widget.color);
    print(widget.imageUrl);
    print(widget.musicName);
    print(widget.sId);
    print(widget.audioDuration);
    print(widget.audioPrice);
    print(userId);
    print(childId);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserId();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: YellowBacground(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 20,
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.arrow_back),
                  ),
                  Image.asset(ImagePath.smallhhlogo),
                  CustomText(
                    text: "   Subscription",
                    fontSize: 33,
                    textColor: AppColors.appPrimaryColor,
                  ),
                ],
              ),
            ),
    CustomPurchaseAudio(
    Image:
    "${widget.imageUrl}",
    text: "${widget.musicName}",
    imageCirucularColor: widget.color ,
    audioName: "${widget.musicName}",
      audioId: widget.sId,
      userId: userId!,
      childId: childId!,
      duration: widget.audioDuration,
      price: widget.audioPrice,
      ContainerColor: widget.color,
    )
          ],
        ),
      ),
    );
  }
}
