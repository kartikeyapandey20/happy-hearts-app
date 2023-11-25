import 'package:flutter/material.dart';
import 'package:happyheart/Constant/background.dart';
import 'package:happyheart/Constant/custom_purchase_audio.dart';
import 'package:happyheart/data/model/subscribtion_model.dart';
// import 'package:happyheart/data/api_calling/subscription_api_calling.dart';
import 'package:happyheart/Constant/CustomText.dart';
import 'package:happyheart/utils/colors.dart';
import 'package:happyheart/utils/image_path.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Constant/customMusicDetector.dart';
import '../../Constant/subscription_page_container.dart';
import '../../data/api_calling/categoy_api_calling/category_api_calling.dart';
import '../../data/model/audio_category_model.dart';
import '../../data/model/category_model.dart';
import '../../utils/config.dart';

class SubscriptionPage extends StatefulWidget {
  @override
  _SubscriptionPageState createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  Future<SubscriptionModel>? _subscriptionModelFuture;

  String currentCategoryId = "64fac6775f71a268ac96db68";
  Future<AudioCategoryModel>? _futureAudioByCategory;

  String?  userId;
  String? childId;
  getUserId() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    userId = preferences.getString("userId");
    childId = preferences.getString("childId");
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserId();
    _futureAudioByCategory =
        CategoryApiCalling().getAudioByCategoryApiCalling(currentCategoryId!);
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
            FutureBuilder<AudioCategoryModel>(
                future: _futureAudioByCategory,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Expanded(
                      child: Center(
                        child: CircularProgressIndicator(
                          color: AppColors.appPrimaryColor,
                        ),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(child: Text("Error Occurred"));
                  } else if (snapshot.data!.data!.isEmpty) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: AppColors.appPrimaryColor,
                      ),
                    );
                  } else {
                    var data = snapshot.data!.data;
                    return Expanded(
                      child: ListView.builder(
                          itemCount: data![0].audios!.length,
                          itemBuilder: (context, index) {
                            return SubscriptionPageContainer(
                              Image:
                              "${Config.imageUserUrl}${data[0].audios![index].imageUrl}",
                              text: "${data[0].audios![index].audioName}",
                              imageCirucularColor: index % 3 == 0
                                  ? AppColors.hhgreen
                                  : index % 3 == 1
                                  ? AppColors.hhblue
                                  : AppColors.hhpink,
                              ContainerColor: index % 3 == 0
                                  ? AppColors.hhgreen
                                  : index % 3 == 1
                                  ? AppColors.hhblue
                                  : AppColors.hhpink,
                              audioName: "${data[0].audios![index].musicName}",
                              audioId: data[0].audios![index].sId!,
                              userId: userId!,
                              childId: childId!,
                              audioDuration: data[0].audios![index].audioDuration!,
                              audioPrice: data[0].audios![index].audioPrice!,

                            );
                          }),
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }
}
