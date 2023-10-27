import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:happyheart/screens/Dashboard/dashBoard.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:happyheart/utils/colors.dart';
import 'package:http/http.dart' as http;
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WebViewPayment extends StatefulWidget {
  // final Map<String, dynamic> data;

  WebViewPayment();

  @override
  _WebViewPaymentState createState() => _WebViewPaymentState();
}

class _WebViewPaymentState extends State<WebViewPayment> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  String cancelLbl = "Cancel";
  ProgressDialog? pr;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    pr = ProgressDialog(context,
        type: ProgressDialogType.normal, isDismissible: false);
    pr!.style(
        message: "Please Wait",
        borderRadius: 10.0,
        progressWidget: Container(
          padding: EdgeInsets.all(15),
          child: CircularProgressIndicator(
            valueColor:
                new AlwaysStoppedAnimation<Color>(AppColors.appPrimaryColor),
          ),
        ),
        elevation: 10.0,
        insetAnimCurve: Curves.easeInOut,
        messageTextStyle: TextStyle(
            color: Colors.black, fontSize: 17.0, fontWeight: FontWeight.w600));
    createRequest();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> createRequest() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String FirstName = prefs.getString("firstName")!;
    String Email = prefs.getString("email")!;
    String Mobile = prefs.getString("mobile")!;

    Map<String, String> body = {
      "amount": "499",
      "purpose": "Guest",
      "buyer_name": "${FirstName}",
      "email": "${Email}",
      "phone": "${Mobile}",
      "allow_repeated_payments": "true",
      "send_email": "false",
      "send_sms": "false",
      "redirect_url": "http://www.example.com/redirect/",
      "webhook": "http://www.example.com/webhook/"
    };

    var resp = await http.post(
      Uri.parse("https://www.instamojo.com/api/1.1/payment-requests/"),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded",
        "X-Api-Key": "test_377f6f04fa940336f8448abb7cf",
        "X-Auth-Token": "test_b2f632c60012c57c4d156a9e462",
      },
      body: body,
    );

    if (json.decode(resp.body)['success'] == true) {
      String selectedUrl =
          json.decode(resp.body)["payment_request"]['longurl'].toString() +
              "?embed=form";
      setState(() {
        isLoading = false;
      });

      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => WebView(
          initialUrl: selectedUrl,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
          navigationDelegate: (NavigationRequest request) {
            if (request.url.contains('http://www.example.com/redirect')) {
              Uri uri = Uri.parse(request.url);
              String paymentRequestId = uri.queryParameters['payment_id']!;
              _checkPaymentStatus(paymentRequestId);
            }
            return NavigationDecision.navigate;
          },
        ),
      ));
    } else {
      setState(() {
        isLoading = false;
      });
      showFailedDialog();
      print(
          "GGGGGG = ${json.decode(resp.body)['message']["amount"].toString()}");
    }
  }

  showSucDialog(String PaymentIs) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Container(
            height: 300,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      'Success!',
                      style: TextStyle(
                        color: AppColors.appPrimaryColor,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 7),
                    child: Text(
                      'Your payment is complete.',
                      style: TextStyle(
                        color: AppColors.appPrimaryColor,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 7),
                    child: Text(
                      "Your Transaction ID Is ${PaymentIs}",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    margin: EdgeInsets.only(top: 40),
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(8.0),
                      ),
                      color: Colors.green,
                      minWidth: MediaQuery.of(context).size.width / 2,
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => DashBoard()));
                      },
                      child: Text(
                        "Continue",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  showFailedDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Container(
            height: 300,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: AppColors.appPrimaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.error_outline,
                        color: Colors.white,
                        size: 35,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      'Oh no!',
                      style: TextStyle(
                        color: AppColors.appPrimaryColor,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 7),
                    child: Text(
                      'Something went wrong.\nPlease try again.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.appPrimaryColor,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    margin: EdgeInsets.only(top: 40),
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(8.0),
                      ),
                      color: AppColors.appPrimaryColor,
                      minWidth: MediaQuery.of(context).size.width / 2,
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          '/Dashboard',
                          (Route<dynamic> route) => false,
                        );
                      },
                      child: Text(
                        "OK",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Upgrading"),
          actions: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
                showFailedDialog();
              },
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "${cancelLbl}",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: isLoading == true
              ? Center(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: CircularProgressIndicator(),
                  ),
                )
              : Container(),
        ),
      ),
    );
  }

  Future<void> _checkPaymentStatus(String id) async {
    var response = await http.get(
      Uri.parse("https://www.instamojo.com/api/1.1/payments/$id/"),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded",
        "X-Api-Key": "5eeea98dca59fb1f315874bcefb0a65f",
        "X-Auth-Token": "744c6d69d38c4687c02953e26445764b",
        "X-XSS-Protection": "0; mode=block"
      },
    );
    setState(() {
      cancelLbl = "";
    });
    var realResponse = json.decode(response.body);
    print("Final Response = ${realResponse}");
    if (realResponse['success'] == true) {
      if (realResponse["payment"]['status'] == 'Credit') {
        Navigator.of(context).pop();
        await showSucDialog(realResponse["payment"]['payment_id'].toString());
      } else {
        Navigator.of(context).pop();
        showFailedDialog();
      }
    } else {
      Navigator.of(context).pop();
      showFailedDialog();
      print("PAYMENT STATUS FAILED");
    }
  }
}
