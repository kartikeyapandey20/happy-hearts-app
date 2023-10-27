import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:happyheart/screens/playrecording/playrecording.dart';
import '../utils/colors.dart';
import 'CustomText.dart';

class CustomMusicIndicator extends StatefulWidget {
  final String Image;
  final String text;
  final Color imageCirucularColor;
  final Color ContainerColor;
  Color? logoColor;
  IconData? icon;
  final String audioName;
  final String englishUrl;
  final String hindiUrl;
  final String gujaratiUrl;
  final List<String> zapInstruction;
  CustomMusicIndicator(
      {Key? key,
      this.logoColor,
      this.icon = Icons.favorite_border,
      required this.Image,
      required this.text,
      required this.imageCirucularColor,
      required this.ContainerColor,
      required this.audioName,
      required this.englishUrl,
      required this.hindiUrl,
      required this.gujaratiUrl,
      required this.zapInstruction})
      : super(key: key);

  @override
  _CustomMusicIndicatorState createState() => _CustomMusicIndicatorState();
}

class _CustomMusicIndicatorState extends State<CustomMusicIndicator> {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => PlayRecording(
                  audioName: widget.audioName,
                  englishUrl: widget.englishUrl,
                  hindiUrl: widget.hindiUrl,
                  gujaratiUrl: widget.gujaratiUrl,
                  zapInstruction: widget.zapInstruction,
                )));
      },
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 115,
            width: 115,
            margin: EdgeInsets.only(left: 20, top: 20),
            child: Stack(
              children: <Widget>[
                Container(
                    decoration: BoxDecoration(
                        color: AppColors.borderColor,
                        shape: BoxShape.circle,
                        border:
                            Border.all(color: widget.ContainerColor, width: 5)),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: CircleAvatar(
                        radius: MediaQuery.of(context).size.width * 0.109,
                        backgroundImage: NetworkImage(widget.Image),
                        backgroundColor: AppColors.borderColor,
                      ),
                    ))
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.height / 3.5,
            height: 100,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Container(
                decoration: BoxDecoration(color: widget.ContainerColor),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Padding(
                          padding: EdgeInsets.all(14.0),
                          child: CustomText(
                            text: widget.text,
                            fontSize: MediaQuery.of(context).size.height / 40,
                            textColor: AppColors.black,
                            align: TextAlign.left,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          LayoutBuilder(
                            builder: (BuildContext context,
                                BoxConstraints constraints) {
                              return Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.borderColor,
                                ),
                                child: Icon(
                                  widget.icon,
                                  color: widget.logoColor,
                                  size: 10,
                                ),
                              );
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void onGooglePayResult(paymentResult) {
    print(paymentResult);
    Fluttertoast.showToast(msg: "Payment Successful");
    Navigator.of(context).pop();
  }
}
