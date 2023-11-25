import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:happyheart/Constant/heart_loader.dart';
import 'package:happyheart/data/api_calling/user_api_calling/child_api_calling.dart';
import 'package:happyheart/data/model/user_children_model.dart';
import 'package:happyheart/utils/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Constant/CustomText.dart';
import '../../../Constant/background.dart';
import '../../../Constant/customTextButtton.dart';
import '../../../data/model/add_user_child_model.dart';
import '../../../utils/image_path.dart';
import '../Dashboard/Drawer/add_child_information_page.dart';
import '../Dashboard/dashBoard.dart';

class SelectChild extends StatefulWidget {

  final String userId;
  SelectChild({Key? key, required this.userId}) : super(key: key);

  @override
  State<SelectChild> createState() => _SelectChildState();
}

class _SelectChildState extends State<SelectChild> {
  TextEditingController textConst = TextEditingController();
  TextEditingController Agecont = TextEditingController();
  Future<UserChildrenModel?>? _futureUserChildren;
  String name = "";
  String Age = "";
  bool showText = false;
  bool showAge = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _futureUserChildren = ChildApiCalling().getUserChildrenApiCalling(userId: widget.userId);
  }
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
                text: "Select Child",
                fontSize: 33,
                textColor: AppColors.appPrimaryColor,
              ),
            ),
          ],
        ),
          SizedBox(
            height: 10,
          ),
        FutureBuilder<UserChildrenModel?>(
            future: _futureUserChildren,
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
                return Container(
                  width: MediaQuery.of(context).size.width/1.2,
                  height: MediaQuery.of(context).size.height/1.2,
                  child: ListView.builder(
                      itemCount: data!.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            CustomeTextButton(
                              width: MediaQuery.of(context).size.width / 1.2,
                              height: MediaQuery.of(context).size.width / 3,
                              borderColor: Color(0xFFFFFFFF),
                              bacgroundColor: Color(0xFFFA4A71),
                              text: "Child Name : ${data[index].childName}",
                              textAlign: TextAlign.start,
                              borderWidth: 2,
                              center: false,
                              onTap: ()async{

                                  CustomLoader().showLoader(context);
                                  AddUserChildrenModel? response = await  ChildApiCalling().updateChildIdApiCalling(userId: widget.userId,childId: data[index].sId!);
                                  if(response==null)
                                  {
                                    Fluttertoast.showToast(msg: "Unable to add child");
                                    Navigator.of(context).pop();
                                  }
                                  else if(response.isSuccess!){
                                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=> DashBoard()), (route) => false);
                                    SharedPreferences preferences = await SharedPreferences.getInstance();
                                    preferences.setString("childId", data[index].sId!);
                                    preferences.setString("childName",data[index].childName!);
                                    Fluttertoast.showToast(msg: "Child Added Successfully");
                                  }
                                  else{
                                    Fluttertoast.showToast(msg: "Unable to add child");
                                    Navigator.of(context).pop();
                                  }


                              },
                            ),
                            SizedBox(height: 10,)
                          ],
                        );
                      }),
                );
              }
            }),

        // CustomeTextButton(
        //   width: MediaQuery.of(context).size.width / 1.2,
        //   // height: MediaQuery.of(context).size.width / 1.2,
        //   borderColor: Color(0xFFFFFFFF),
        //   bacgroundColor: Color(0xFFFA4A71),
        //   text: "+",
        //   textAlign: TextAlign.start,
        //   fontSize: 40,
        //   fontWeight: FontWeight.bold,
        //   borderWidth: 2,
        // )
      ],
    )),
    floatingActionButton: FloatingActionButton(
      onPressed: (){
      Navigator.push(context, MaterialPageRoute(builder: (context) => AddChildInformationPage(userId: widget.userId,)));
      },
      backgroundColor: AppColors.appPrimaryColor,
      child: Icon(Icons.add_box_rounded),
    ),

    );
  }
}
