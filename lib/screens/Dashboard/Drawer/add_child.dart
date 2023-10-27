import 'package:flutter/material.dart';
import 'package:happyheart/utils/colors.dart';

import '../../../Constant/CustomText.dart';
import '../../../Constant/background.dart';
import '../../../utils/image_path.dart';

class AddChild extends StatefulWidget {
  AddChild({Key? key}) : super(key: key);

  @override
  State<AddChild> createState() => _AddChildState();
}

class _AddChildState extends State<AddChild> {
  TextEditingController textConst = TextEditingController();
  TextEditingController Agecont = TextEditingController();

  String name = "";
  String Age = "";
  bool showtext = false;
  bool showAge = true;

  Widget build(BuildContext context) {
    return Scaffold(
        body: YellowBacground(
            child: Column(
      children: [
        SizedBox(
          height: 40,
        ),
        Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.arrow_back)),
            Image.asset(ImagePath.smallhhlogo),
            Padding(
              padding:
                  EdgeInsets.only(left: MediaQuery.of(context).size.width / 12),
              child: CustomText(
                text: "Add Child",
                fontSize: 33,
                textColor: AppColors.appPrimaryColor,
              ),
            ),
          ],
        ),
        Expanded(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        )
      ],
    )));
  }
}
