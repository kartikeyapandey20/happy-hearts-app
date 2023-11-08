import 'package:flutter/material.dart';
import 'package:happyheart/data/api_calling/user_api_calling/activity_history_api_calling.dart';
import 'package:happyheart/data/model/activity_history_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Constant/CustomText.dart';
import '../../Constant/background.dart';
import '../../Constant/customMusicDetector.dart';
import '../../data/api_calling/categoy_api_calling/category_api_calling.dart';
import '../../data/model/audio_category_model.dart';
import '../../data/model/category_model.dart';
import '../../utils/colors.dart';
import '../../utils/config.dart';
import '../../utils/image_path.dart';

class ActivityHistory extends StatefulWidget {
  final String userId;
  final String childId;
  const ActivityHistory({Key? key, required this.userId, required this.childId}) : super(key: key);

  @override
  State<ActivityHistory> createState() => _ActivityHistoryState();
}

class _ActivityHistoryState extends State<ActivityHistory> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: YellowBacground(
          child: Container(
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
                      icon: const Icon(Icons.arrow_back, color: Colors.black)),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 20),
                    child: Image.asset(
                      ImagePath.smallhhlogo,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  CustomText(
                    text: "Activity History",
                    fontSize: MediaQuery.of(context).size.width / 12,
                    textColor: AppColors.appPrimaryColor,
                  ),
                ],
              ),
            ),
            // Container(height: MediaQuery.of(context).size.height/1.3,width: MediaQuery.of(context).size.width/1.1,color: AppColors.hhgreen),
            FutureBuilder<ActivityHistoryModel?>(
                future: ActivityHistoryApi().audioStatusApiCalling(userId: widget.userId,childId:widget.childId ),
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
                      child: Text("No Data Found")
                    );
                  } else {
                    var data = snapshot.data!.data;
                    return Expanded(
                      child: ListView.builder(
                          itemCount: data!.length,
                          itemBuilder: (context, index) {
                            return CustomMusicIndicator(
                              Image:
                              "${Config.imageUserUrl}${data[index].audioId!.imageUrl!}",
                              text: "${data[index].audioId!.audioName}",
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
                              audioName: "${data[index].audioId!.musicName}",
                              englishUrl:
                              '${data[index].audioId!.englishAudioUrl}',
                              hindiUrl:
                              "${data[index].audioId!.hindiAudioUrl}",
                              gujaratiUrl:
                              "${data[index].audioId!.gujaratiAudioUrl}",
                              zapInstruction:
                              data[index].audioId!.audioInstruction!,
                              audioId: data[index].audioId!.sId!,
                            );
                          }),
                    );
                  }
                }),
          ],
        ),
      )),
    );
  }
}
