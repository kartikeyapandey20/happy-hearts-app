import 'package:flutter/material.dart';
import 'package:happyheart/Constant/background.dart';

import '../../Constant/CustomText.dart';
import '../../Constant/customMusicDetector.dart';
import '../../utils/colors.dart';
import '../../utils/image_path.dart';

class MyFavourite extends StatefulWidget {
  const MyFavourite({Key? key}) : super(key: key);

  @override
  _MyFavouriteState createState() => _MyFavouriteState();
}

class _MyFavouriteState extends State<MyFavourite> {
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
              CustomText(
                  text: "   My Favourite",
                  fontSize: 33,
                  textColor: AppColors.appPrimaryColor,
              ),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height/16,
        ),
        Center(
          child: CustomText(text: "No Favourite Added", fontSize: 20, textColor: AppColors.black),
        ),
        // CustomMusicIndicator(
        //     Image: ImagePath.homeAnxiety,
        //     text: "Homework Anxiety",
        //     imageCirucularColor: AppColors.hhgreen,
        //     ContainerColor: AppColors.hhgreen,
        // icon: Icons.favorite,
        // logoColor: AppColors.appPrimaryColor, audioName: '', englishUrl: '', hindiUrl: '', gujaratiUrl: '', zapInstruction: [],),
        // CustomMusicIndicator(
        //     Image: ImagePath.fearOfDarkness,
        //     text: "Fear of darkness and loud Noises",
        //     imageCirucularColor: AppColors.hhblue,
        //     ContainerColor: AppColors.hhblue,
        // icon: Icons.favorite,
        // logoColor: AppColors.appPrimaryColor,),
        // CustomMusicIndicator(
        //     Image: ImagePath.bedWetting,
        //     text: "Bedwetting",
        //     imageCirucularColor: AppColors.hhpink,
        //     ContainerColor: AppColors.hhpink,
        // icon: Icons.favorite,
        // logoColor: AppColors.appPrimaryColor,),



      ],
    )));
  }
}
