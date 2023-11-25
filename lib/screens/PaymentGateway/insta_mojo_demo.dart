import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:happyheart/screens/Dashboard/dashBoard.dart';
import 'package:http/http.dart' as http;
import '../../data/api_calling/user_api_calling/purchase_audio_api_calling.dart';

class InstaMojoDemo extends StatefulWidget {
  final String userId;
  final String childId;
  final String audioId;
  final String duration;
  InstaMojoDemo(
      {Key? key,
      required this.userId,
      required this.childId,
      required this.audioId,
      required this.duration})
      : super(key: key);
  @override
  _InstaMojoDemoState createState() => _InstaMojoDemoState();
}

bool isLoading = true; //this can be declared outside the class

class _InstaMojoDemoState extends State<InstaMojoDemo> {
  String? selectedUrl;
  double progress = 0;

  @override
  void initState() {
    super.initState();
    createRequest(); //creating the HTTP request
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("Pay"),
      ),
      body: Container(
        child: Center(
          child: isLoading
              ? //check loadind status
              CircularProgressIndicator() //if true
              : InAppWebView(
                  initialUrlRequest: URLRequest(
                    url: Uri.tryParse(selectedUrl!),
                  ),
                  onWebViewCreated: (InAppWebViewController controller) {},
                  onProgressChanged:
                      (InAppWebViewController controller, int progress) {
                    setState(() {
                      this.progress = progress / 100;
                    });
                  },
                  onUpdateVisitedHistory: (InAppWebViewController controller,
                      Uri? uri, bool? isForward) {
                    // uri containts newly loaded url
                    if (mounted && uri != null && isForward != null) {
                      if (uri.toString().contains('https://www.google.com/')) {
//Take the payment_id parameter of the url.
                        String? paymentRequestId =
                            uri.queryParameters['payment_id'];
                        print("value is: " + paymentRequestId!);
//calling this method to check payment status
                        _checkPaymentStatus(paymentRequestId);
                      }
                    }
                  }),
        ),
      ),
    );
  }

  _checkPaymentStatus(String id) async {
    var response = await http.get(
        Uri.parse("https://test.instamojo.com/api/1.1/payments/$id/"),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded",
          "X-Api-Key": "test_b678a7048c8a9e5f69663c2e4fa",
          "X-Auth-Token": "test_41af76995b230611b2c3b72b8cc"
        });
    var realResponse = json.decode(response.body);
    print(realResponse);
    if (realResponse['success'] == true) {
      if (realResponse["payment"]['status'] == 'Credit') {
        print('sucesssssssssssful');
        // Navigator.of(context).pushReplacement(
        //     MaterialPageRoute(
        //         builder: (context) => ()));
        PurchaseAudioApiCalling().purchaseAudioApiCalling(
            userId: widget.userId,
            childId: widget.childId,
            audioId: widget.audioId,
            duration: widget.duration,
            paymentId: id).then((value) {
              if(value==null)
                {
                  // Fluttertoast.showToast(msg: "Unable to Purchase the audio");
                }
              else{
                if(value.isSuccess!)
                {
                  // Fluttertoast.showToast(msg: value.message!);
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => DashBoard()), (route) => false);
                }
                else{
                  Fluttertoast.showToast(msg: "Audio already purchased or some error occurred");
                }
              }
        });
//payment is successful.
      } else {
        print('failed');
        Fluttertoast.showToast(msg: "Purchase Failed");
//payment failed or pending.
      }
    } else {
      print("PAYMENT STATUS FAILED");
    }
  }

  Future createRequest() async {
    Map<String, String> body = {
      "amount": "9", //amount to be paid
      "purpose": "Advertising",
      "buyer_name": 'mahesh',
      "email": 'abc@gmail.com',
      "phone": '7276544474',
      "allow_repeated_payments": "true",
      "send_email": "true",
      "send_sms": "true",
      "redirect_url": "https://www.google.com/",
      //Where to redirect after a successful payment.
      "webhook": "https://www.google.com/",
    };
//First we have to create a Payment_Request.
//then we'll take the response of our request.
    var resp = await http.post(
        Uri.parse("https://test.instamojo.com/api/1.1/payment-requests/"),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded",
          "X-Api-Key": "test_b678a7048c8a9e5f69663c2e4fa",
          "X-Auth-Token": "test_41af76995b230611b2c3b72b8cc"
        },
        body: body);
    if (json.decode(resp.body)['success'] == true) {
//If request is successful take the longurl.
      setState(() {
        isLoading = false; //setting state to false after data loaded

        selectedUrl =
            json.decode(resp.body)["payment_request"]['longurl'].toString() +
                "?embed=form";
      });
      print(json.decode(resp.body)['message'].toString());
//If something is wrong with the data we provided to
//create the Payment_Request. For Example, the email is in incorrect format, the payment_Request creation will fail.
    }
  }
}
