import 'dart:convert';

import 'package:happyheart/data/model/audio_category_model.dart';
import 'package:happyheart/data/model/category_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../utils/config.dart';

class CategoryApiCalling {
  Future<CategoryModel>? getCategoryApiCalling() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var userId = preferences.getString("userId");
    print("this is userId : $userId");
    var url = Config.baseAdminUrl + Config.getCategory;
    var response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
    });
    try {
      if (response.statusCode == 200) {
        // Request successful, do something with the response
        print('API response: ${response.body}');
        var json = jsonDecode(response.body);
        return CategoryModel.fromJson(json);
      } else {
        var json = jsonDecode(response.body);
        print('API request failed with status code: ${response.statusCode}');
        return CategoryModel.fromJson(json);
      }
    } catch (e) {
      // Exception occurred, handle error
      print('API request failed with error: $e');
      var json = jsonDecode(response.body);
      return CategoryModel.fromJson(json);
    }
  }

  Future<AudioCategoryModel>? getAudioByCategoryApiCalling(
      String categoryId) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var userId = preferences.getString("userId");
    print("this is userId : $userId");

    var body = jsonEncode({"categoryId": categoryId});
    var url = Config.baseAdminUrl + Config.getAudioByCategory;
    var response = await http.post(Uri.parse(url), body: body, headers: {
      'Content-Type': 'application/json',
    });
    try {
      if (response.statusCode == 200) {
        // Request successful, do something with the response
        print('API response: ${response.body}');
        var json = jsonDecode(response.body);
        return AudioCategoryModel.fromJson(json);
      } else {
        var json = jsonDecode(response.body);
        print('API request failed with status code: ${response.statusCode}');
        return AudioCategoryModel.fromJson(json);
      }
    } catch (e) {
      // Exception occurred, handle error
      print('API request failed with error: $e');
      var json = jsonDecode(response.body);
      return AudioCategoryModel.fromJson(json);
    }
  }
}
