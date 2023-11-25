import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:happyheart/Constant/CustomText.dart';
import 'package:happyheart/Constant/background.dart';
import 'package:happyheart/Constant/customMusicDetector.dart';
import 'package:happyheart/Constant/loader.dart';
import 'package:happyheart/data/api_calling/categoy_api_calling/category_api_calling.dart';
import 'package:happyheart/data/api_calling/user_api_calling/audio_status_api_calling.dart';
import 'package:happyheart/data/model/audio_status_model.dart';
import 'package:happyheart/data/model/category_model.dart';
import 'package:happyheart/utils/colors.dart';
import 'package:happyheart/utils/image_path.dart';

import '../../data/model/audio_category_model.dart';
import '../../../utils/config.dart';

class OurMagicalZap extends StatefulWidget {
  const OurMagicalZap({Key? key}) : super(key: key);

  @override
  _OurMagicalZapState createState() => _OurMagicalZapState();
}

class _OurMagicalZapState extends State<OurMagicalZap> {
  List<bool> colorIndex = [true, false, false, false, false];
  int currentIndex = 0;
  String? currentCategoryId = "64e96720ea803bf859c57bdc";
  Future<CategoryModel>? _futureCategoryModel;
  Future<AudioCategoryModel>? _futureAudioByCategory;

  @override
  void initState() {
    super.initState();
    // ShowLoader.showLoader(context);
    _futureCategoryModel = CategoryApiCalling().getCategoryApiCalling();
    // Navigator.of(context).pop();
    _futureAudioByCategory =
        CategoryApiCalling().getAudioByCategoryApiCalling(currentCategoryId!);
    categoryUpdated();
  }

  categoryUpdated() {
    // ShowLoader.showLoader(context);
    _futureCategoryModel = CategoryApiCalling().getCategoryApiCalling();

    // Assign the value of currentCategoryId when the future completes
    _futureCategoryModel!.then((categoryModel) {
      if (categoryModel.data != null && categoryModel.data!.isNotEmpty) {
        // Navigator.of(context).pop();
        setState(() {
          currentCategoryId = categoryModel.data![0].sId;
          // Also, you can initiate the audio list here if needed
          _futureAudioByCategory = CategoryApiCalling()
              .getAudioByCategoryApiCalling(currentCategoryId!);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: YellowBacground(
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
                  Column(
                    children: [
                      CustomText(
                          text: "Our Magical Zaps",
                          fontSize: MediaQuery.of(context).size.height / 24,
                          textColor: AppColors.appPrimaryColor),
                      CustomText(
                          text: " What brings you to Happy Hearts?",
                          fontSize: MediaQuery.of(context).size.height / 40,
                          textColor: AppColors.primarytextColor),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            FutureBuilder<CategoryModel>(
                future: _futureCategoryModel,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text("loading...");
                  } else if (snapshot.hasError) {
                    return Text("loading...");
                  } else if (snapshot.data!.data!.isEmpty) {
                    return Text("loading...");
                  } else {
                    var data = snapshot.data!.data;

                    currentCategoryId = data![0].sId;

                    return Wrap(
                        // alignment: WrapAlignment.end,
                        //   direction: Axis.horizontal,
                        children: List.generate(
                            data.length,
                            (index) => FittedBox(
                                  child: Padding(
                                    padding: EdgeInsets.all(4),
                                    child: InkWell(
                                      onTap: () {
                                        for (int i = 0; i < data.length; i++) {
                                          colorIndex[i] = false;
                                        }
                                        colorIndex[index] = true;
                                        currentIndex = index;
                                        currentCategoryId = data[index].sId;
                                        _futureAudioByCategory =
                                            CategoryApiCalling()
                                                .getAudioByCategoryApiCalling(
                                                    currentCategoryId!);
                                        setState(() {});
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: colorIndex[index] == true
                                              ? AppColors.hhorange
                                              : AppColors.transhparent,
                                          border: Border.all(
                                              color: colorIndex[index]
                                                  ? AppColors.transhparent
                                                  : AppColors.black,
                                              width: 1),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 16,
                                              right: 17,
                                              bottom: 6,
                                              top: 5),
                                          child: Center(
                                              child: CustomText(
                                            text:
                                                '${data[index].categoryName!.toUpperCase()}',
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                60,
                                            textColor: colorIndex[index]
                                                ? AppColors.borderColor
                                                : AppColors.black,
                                          )),
                                        ),
                                      ),
                                    ),
                                  ),
                                )));
                  }
                }),
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
                              audioDuration: data[0].audios![index].audioDuration!,
                                audioPrice : data[0].audios![index].audioPrice!
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
