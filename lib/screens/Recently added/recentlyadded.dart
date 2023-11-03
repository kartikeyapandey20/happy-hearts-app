import 'package:flutter/material.dart';
import 'package:happyheart/Constant/background.dart';

import '../../Constant/CustomText.dart';
import '../../Constant/customMusicDetector.dart';
import '../../data/api_calling/categoy_api_calling/category_api_calling.dart';
import '../../data/model/audio_category_model.dart';
import '../../data/model/category_model.dart';
import '../../utils/colors.dart';
import '../../utils/config.dart';
import '../../utils/image_path.dart';

class RecentlyAdded extends StatefulWidget {
  const RecentlyAdded({Key? key}) : super(key: key);

  @override
  State<RecentlyAdded> createState() => _RecentlyAddedState();
}

class _RecentlyAddedState extends State<RecentlyAdded> {

  String currentCategoryId = "64fac6775f71a268ac96db68";
  Future<CategoryModel>? _futureCategoryModel;
  Future<AudioCategoryModel>? _futureAudioByCategory;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _futureAudioByCategory =
        CategoryApiCalling().getAudioByCategoryApiCalling(currentCategoryId!);
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
                      icon: const Icon(Icons.arrow_back,color: Colors.black)),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 20),
                    child: Image.asset(
                      ImagePath.smallhhlogo,
                    ),
                  ),
                  SizedBox(width: 5,),
                  CustomText(
                    text: "Recently Added",
                    fontSize: MediaQuery.of(context).size.width/12,
                    textColor: AppColors.appPrimaryColor,
                  ),
                ],
              ),
            ),
             SizedBox(height: MediaQuery.of(context).size.height/25,),
             // Container(height: MediaQuery.of(context).size.height/1.3,width: MediaQuery.of(context).size.width/1.1,color: AppColors.hhgreen),
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
                            return CustomMusicIndicator(
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
                              englishUrl:
                              '${data[0].audios![index].englishAudioUrl}',
                              hindiUrl:
                              "${data[0].audios![index].hindiAudioUrl}",
                              gujaratiUrl:
                              "${data[0].audios![index].gujaratiAudioUrl}",
                              zapInstruction:
                              data[0].audios![index].audioInstruction!,
                              audioId: data[0].audios![index].sId!,
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
