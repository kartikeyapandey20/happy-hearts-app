import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:happyheart/data/model/delete_user_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../utils/config.dart';

class DeleteUserApiCalling {
  Future<DeleteModel?> deleteUserApiCalling() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var userId = preferences.getString("userId");
    print("this is userId : $userId");
    try {
      var url = Config.baseUserUrl + Config.delete;

      // Create the JSON request body
      var body = jsonEncode({
        "userId": "$userId",
      });

      // Make the POST request
      var response = await http.delete(Uri.parse(url), body: body, headers: {
        'Content-Type': 'application/json',
      });

      if (response.statusCode == 200) {
        // Request successful, do something with the response
        print('API response: ${response.body}');
        var json = jsonDecode(response.body);
        Fluttertoast.showToast(msg: "User Deleted Successfully");
        return DeleteModel.fromJson(json);
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
