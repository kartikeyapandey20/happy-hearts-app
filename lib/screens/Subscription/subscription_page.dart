import 'package:flutter/material.dart';
import 'package:happyheart/Constant/background.dart';
import 'package:happyheart/data/model/subscribtion_model.dart';
import 'package:happyheart/data/api_calling/subscription_api_calling.dart';
import 'package:happyheart/Constant/CustomText.dart';
import 'package:happyheart/Constant/subscriptionContainer.dart';
import 'package:happyheart/utils/colors.dart';
import 'package:happyheart/utils/image_path.dart';

class SubscriptionPage extends StatefulWidget {
  @override
  _SubscriptionPageState createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  Future<SubscriptionModel>? _subscriptionModelFuture;

  @override
  void initState() {
    super.initState();
    _subscriptionModelFuture = SubscriptionUserApiCalling().subscriptionUserApiCalling();
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
            Expanded(
              child: FutureBuilder<SubscriptionModel>(
                future: _subscriptionModelFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: AppColors.appPrimaryColor,
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: CustomText(
                        text: "An error occurred",
                        fontSize: 14,
                        textColor: AppColors.black,
                      ),
                    );
                  } else if (!snapshot.hasData || snapshot.data!.data!.isEmpty) {
                    return Center(
                      child: CustomText(
                        text: "No Subscription Available",
                        fontSize: 14,
                        textColor: AppColors.black,
                      ),
                    );
                  } else {
                    SubscriptionModel subscriptionModel = snapshot.data!;
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: subscriptionModel.data!.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          child: ContainerGlassConst(
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                  child: ContainerGlassConst(
                                    radius: 20,
                                    topPadding: 0,
                                    rightPadding: 0,
                                    leftPadding: 0,
                                    width: MediaQuery.of(context).size.width,
                                    child: Column(
                                      children: [
                                        ContainerConst(
                                          topPadding: 0,
                                          leftPadding: 0,
                                          rightPadding: 0,
                                          color: AppColors.hhpink,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              left: 16.0,
                                              right: 16.0,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    CustomText(
                                                      text:
                                                      "${subscriptionModel.data![index].subscriptionName}",
                                                      fontSize: 20,
                                                      textColor: AppColors.black,
                                                    ),
                                                    CustomText(
                                                      text:
                                                      "${subscriptionModel.data![index].subscriptionDescription}",
                                                      fontSize: 12,
                                                      textColor: AppColors.black,
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    ContainerGradientConst(
                                                      topPadding: 15,
                                                      rightPadding: 0,
                                                      leftPadding: 0,
                                                      radius: 7,
                                                      color: [
                                                        AppColors.appPrimaryColor
                                                            .withOpacity(0.5),
                                                        AppColors.hhyellow
                                                      ],
                                                      border: Border.all(
                                                        width: 2,
                                                        color: AppColors.transhparent,
                                                      ),
                                                      child: CustomText(
                                                        text:
                                                        "${subscriptionModel.data![index].duration} Days",
                                                        fontSize: 20,
                                                        textColor: AppColors.black,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    CustomText(
                                                      text:
                                                      "₹  ${subscriptionModel.data![index].price}/-",
                                                      fontSize: 20,
                                                      textColor: AppColors.black,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
