import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../../../utils/config.dart';
import '../../model/sign_up_model.dart';

class SignUpApiCalling {
  Future<SignUpModel?> postData(
      firstName, lastName, mobileNumber, email, childName, status) async {
    try {
      var url = Config.baseUserUrl + Config.signUp;

      // Create the JSON request body
      var body = jsonEncode({
        "firstName": "$firstName",
        "lastName": "$lastName",
        "mobileNumber": "+91$mobileNumber",
        "email": "$email",
        "childName": "$childName",
        "status": status
      });

      // Make the POST request
      var response = await http.post(Uri.parse(url), body: body, headers: {
        'Content-Type': 'application/json',
      });

      if (response.statusCode == 200) {
        // Request successful, do something with the response
        print('API response: ${response.body}');
        var json = jsonDecode(response.body);
        Fluttertoast.showToast(msg: "User Created Successfully");
        return SignUpModel.fromJson(json);
      } else if (response.statusCode == 400) {
        Fluttertoast.showToast(msg: "User Already Exist");
      } else {
        // Request failed, handle error
        // var json = jsonDecode(response.body);
        // return SignUpModel.fromJson(json);
        print('API request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      // Exception occurred, handle error
      print('API request failed with error: $e');
    }
    return null;
  }
}
