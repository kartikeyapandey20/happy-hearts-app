import 'package:flutter/material.dart';
import 'package:happyheart/Constant/background.dart';
import 'package:happyheart/Constant/customTextFormField.dart';

import '../../../Constant/CustomText.dart';
import '../../../Constant/customTextButtton.dart';
import '../../../utils/colors.dart';
import '../../../utils/image_path.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  _ContactUsScreenState createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: YellowBacground(
        child: SingleChildScrollView(
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
                    Padding(
                      padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width/12),
                      child: CustomText(
                        text: "Contact Us",
                        fontSize: 33,
                        textColor: AppColors.appPrimaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height/22,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 19),
                child: CustomText(text: "We look forward to hearing from you. Let’s undertake this healing journey together.", fontSize: 23, textColor: AppColors.primarytextColor,align: TextAlign.justify),
              ),
              SizedBox(height: MediaQuery.of(context).size.height/22,),
              CustomTextFormFieldWithLabel(lablelText: "Name", IsValidate: true),
              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
              CustomTextFormFieldWithLabel(lablelText: "Phone", IsValidate: true,inputType: TextInputType.number,),
              SizedBox(
                height: MediaQuery.of(context).size.height /  50,
              ),
              CustomTextFormFieldWithLabel(maxline: 5,lablelText: "Message", IsValidate: true),
              SizedBox(
                height: MediaQuery.of(context).size.height / 6,
              ),
              CustomeTextButton(
                  width: MediaQuery.of(context).size.width / 1.1,
                  height: MediaQuery.of(context).size.height / 20,
                  borderColor: AppColors.borderColor,
                  bacgroundColor: AppColors.appPrimaryColor,
                  text: "Send",
                  borderWidth: 2),
            ],
          ),
        ),
      ),
    );
  }
}
