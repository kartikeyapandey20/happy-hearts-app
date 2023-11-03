import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:happyheart/screens/PaymentGateway/insta_mojo_demo.dart';
import '../utils/colors.dart';
import 'CustomText.dart';

class CustomPurchaseAudio extends StatefulWidget {
  final String Image;
  final String text;
  final Color imageCirucularColor;
  final Color ContainerColor;
  Color? logoColor;
  final String audioName;
  final String audioId;
  final String userId;
  final String childId;
  final String duration;
  final String price;
  CustomPurchaseAudio({
    Key? key,
    this.logoColor,
    required this.Image,
    required this.text,
    required this.imageCirucularColor,
    required this.ContainerColor,
    required this.audioName,
    required this.audioId,
    required this.userId,
    required this.childId,
    required this.duration,
    required this.price,
  }) : super(key: key);

  @override
  _CustomPurchaseAudioState createState() => _CustomPurchaseAudioState();
}

class _CustomPurchaseAudioState extends State<CustomPurchaseAudio> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => InstaMojoDemo(
                  userId: widget.userId,
                  childId: widget.childId,
                  audioId: widget.audioId,
                  duration: widget.duration,
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
                              return Column(
                                children: [
                                  Text("${widget.duration} days"),
                                  Text("${widget.price}/-")
                                ],
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
