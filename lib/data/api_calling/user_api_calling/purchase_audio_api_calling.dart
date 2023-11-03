import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:happyheart/data/model/purchase_model.dart';
import 'package:http/http.dart' as http;

import '../../../utils/config.dart';
import '../../model/sign_up_model.dart';

class PurchaseAudioApiCalling {
  Future<PurchaseModel?> purchaseAudioApiCalling({String? userId , String? childId,String? audioId , String? duration ,String? paymentId }) async {
    try {
      var url = Config.baseUserUrl + Config.purchaseAudio;

      // Create the JSON request body
      var body = jsonEncode({
        "userId" : userId,
        "childId" : childId,
        "audioId":audioId,
        "duration" :  duration,
        "paymentId" : paymentId
      });

      // Make the POST request
      var response = await http.post(Uri.parse(url), body: body, headers: {
        'Content-Type': 'application/json',
      });

      if (response.statusCode == 200) {
        // Request successful, do something with the response
        print('API response: ${response.body}');
        var json = jsonDecode(response.body);
        Fluttertoast.showToast(msg: "Audio purchase Successful");
        return PurchaseModel.fromJson(json);
      }
      else {
        // Request failed, handle error
        // var json = jsonDecode(response.body);
        // return SignUpModel.fromJson(json);
        if(response.statusCode==204)
          {
            Fluttertoast.showToast(msg: "Audio was already purchased");
          }
        else{
          Fluttertoast.showToast(msg: "Unable to purchased the audio");
        }
        print('API request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      // Exception occurred, handle error
      print('API request failed with error: $e');
    }
    return null;
  }
}
