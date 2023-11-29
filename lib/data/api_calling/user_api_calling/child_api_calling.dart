
import 'dart:convert';

import 'package:happyheart/data/model/add_user_child_model.dart';
import 'package:happyheart/data/model/user_children_model.dart';

import '../../../utils/config.dart';
import 'package:http/http.dart'as http;
class ChildApiCalling {
  Future<UserChildrenModel?> getUserChildrenApiCalling({String? userId}) async {
    try {
      var url = Config.baseUserUrl + Config.getUserChildren;

      // Create the JSON request body
      var body = jsonEncode({
        "userId" : userId
      });
    print(body);
      // Make the POST request
      var response = await http.post(Uri.parse(url), body: body, headers: {
        'Content-Type': 'application/json',
      });

      if (response.statusCode == 200) {
        // Request successful, do something with the response
        print('API response: ${response.body}');
        var json = jsonDecode(response.body);
        return UserChildrenModel.fromJson(json);
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
  Future<AddUserChildrenModel?> addChildrenApiCalling({required String userId,required int status,required String childName}) async {
    try {
      var url = Config.baseUserUrl + Config.addChildToUser;

      // Create the JSON request body
      var body = jsonEncode({
        "childName" : childName,
        "status" : status,
        "userId" : userId
      });
      print(body);
      // Make the POST request
      var response = await http.put(Uri.parse(url), body: body, headers: {
        'Content-Type': 'application/json',
      });

      if (response.statusCode == 200) {
        // Request successful, do something with the response
        print('API response: ${response.body}');
        var json = jsonDecode(response.body);
        return AddUserChildrenModel.fromJson(json);
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
  Future<AddUserChildrenModel?> updateChildIdApiCalling({required String userId,required String childId}) async {
    try {
      var url = Config.baseUserUrl + Config.updateChildId;

      // Create the JSON request body
      var body = jsonEncode({
        "childId" : childId,
        "userId" : userId
      });
      print(body);
      // Make the POST request
      var response = await http.put(Uri.parse(url), body: body, headers: {
        'Content-Type': 'application/json',
      });

      if (response.statusCode == 200) {
        // Request successful, do something with the response
        print('API response: ${response.body}');
        var json = jsonDecode(response.body);
        return AddUserChildrenModel.fromJson(json);
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