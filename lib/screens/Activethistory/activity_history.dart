import 'package:flutter/material.dart';

import '../../Constant/CustomText.dart';
import '../../Constant/background.dart';
import '../../utils/colors.dart';
import '../../utils/image_path.dart';

class ActivityHistory extends StatefulWidget {
  const ActivityHistory({Key? key}) : super(key: key);

  @override
  State<ActivityHistory> createState() => _ActivityHistoryState();
}

class _ActivityHistoryState extends State<ActivityHistory> {
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
            SizedBox(
              height: MediaQuery.of(context).size.height / 25,
            ),
            Container(
              height: MediaQuery.of(context).size.height / 1.3,
              width: MediaQuery.of(context).size.width / 1.1,
              color: AppColors.hhpink,
            )
          ],
        ),
      )),
    );
  }
}
