import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:happyheart/data/api_calling/user_api_calling/child_api_calling.dart';
import 'package:happyheart/data/model/add_user_child_model.dart';
import 'package:happyheart/screens/Dashboard/dashBoard.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Constant/CustomText.dart';
import '../../../Constant/background.dart';
import '../../../Constant/customTextButtton.dart';
import '../../../Constant/customTextFormField.dart';
import '../../../Constant/loader.dart';
import '../../../utils/colors.dart';
import '../../../utils/image_path.dart';

class AddChildInformationPage extends StatefulWidget {
  final String userId;
  const AddChildInformationPage({super.key, required this.userId});

  @override
  State<AddChildInformationPage> createState() => _AddChildInformationPageState();
}

class _AddChildInformationPageState extends State<AddChildInformationPage> {

  TextEditingController childNameController = TextEditingController();
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: YellowBacground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // IconButton(
              //    onPressed: () {
              //      Navigator.of(context).pop();
              //    },
              //    icon: const Icon(Icons.arrow_back,color: Colors.black)),

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
                    Image.asset(
                      ImagePath.smallhhlogo,
                    ),
                    Flexible(
                      child: CustomText(
                        text: "Add Child Information?",
                        fontSize: MediaQuery.of(context).size.height / 24,
                        textColor: AppColors.appPrimaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.03,
                child: CustomTextFormField(
                  hintText: "Child Name",
                  textController: childNameController,
                  inputType: TextInputType.name,
                  IsValidate: true,
                  width: MediaQuery.of(context).size.width / 1.2,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 46,
              ),
              Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // GridView.builder(
                    //   itemCount: 4,
                    //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    //     crossAxisCount: 2,
                    //     crossAxisSpacing: 2,
                    //     mainAxisSpacing: 10,
                    //   ),
                    //    itemBuilder: (context, index) {
                    //     return
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          radius: 70,
                          backgroundColor: AppColors.hhpink,
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white,
                                  width: 5,
                                ),
                                shape: BoxShape.circle),
                            child: CircleAvatar(
                              backgroundImage: AssetImage(
                                ImagePath.zeroTONine,
                              ),
                              radius: 60,
                            ),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height / 12,
                          width: MediaQuery.of(context).size.width / 2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: AppColors.hhpink,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                  text: "3-8 Years",
                                  fontSize:
                                  MediaQuery.of(context).size.height / 30,
                                  textColor: AppColors.primarytextColor),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Opacity(
                            opacity: .7,
                            child: CircleAvatar(
                              radius: 70,
                              backgroundColor: AppColors.blue,
                              child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Colors.white, width: 5)),
                                child: CircleAvatar(
                                  backgroundImage: AssetImage(
                                    ImagePath.nintoThirteen,
                                  ),
                                  radius: 60,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height / 12,
                          width: MediaQuery.of(context).size.width / 2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: AppColors.blue,
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomText(
                                    text: "8-12 Years",
                                    fontSize:
                                    MediaQuery.of(context).size.height / 30,
                                    textColor: AppColors.primarytextColor),
                                CustomText(
                                    text: "(Coming soon)",
                                    fontSize: 16,
                                    textColor: AppColors.primarytextColor),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Opacity(
                                opacity: .7,
                                child: CircleAvatar(
                                  radius: 75,
                                  backgroundColor: AppColors.hhgreen,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.white, width: 5),
                                        shape: BoxShape.circle),
                                    child: CircleAvatar(
                                      backgroundImage: AssetImage(
                                        ImagePath.thirteenPlus,
                                      ),
                                      radius: 65,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height / 12,
                          width: MediaQuery.of(context).size.width / 2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: AppColors.hhgreen,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                  text: "13+ Years",
                                  fontSize:
                                  MediaQuery.of(context).size.height / 30,
                                  textColor: AppColors.primarytextColor),
                              CustomText(
                                  text: "(Coming soon)",
                                  fontSize: 16,
                                  textColor: AppColors.primarytextColor),
                            ],
                          ),
                        )
                      ],
                    )
                  ]),
              SizedBox( height: MediaQuery.of(context).size.height / 20,),
              CustomeTextButton(
                width: MediaQuery.of(context).size.width / 1.15,
                borderColor: AppColors.borderColor,
                bacgroundColor: AppColors.appPrimaryColor,
                text: "Save Child",
                borderWidth: 2,
                onTap: ()async{

                      if(childNameController.text.isNotEmpty){
                        showLoader();
                        AddUserChildrenModel? response = await  ChildApiCalling().addChildrenApiCalling(userId: widget.userId, status: 0, childName: childNameController.text);
                        if(response==null)
                          {
                            Fluttertoast.showToast(msg: "Unable to add child");
                            Navigator.of(context).pop();
                          }
                        else{
                          SharedPreferences preferences = await SharedPreferences.getInstance();
                          preferences.setString("childId", response.data!.child!);
                          preferences.setString("childName",childNameController.text);
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> DashBoard()));
                          Fluttertoast.showToast(msg: "Child Added Successfully");
                        }
                      }
                      else{
                        Fluttertoast.showToast(msg: "Please enter your child Name");
                      }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
