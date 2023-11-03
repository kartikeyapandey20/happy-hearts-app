import 'dart:convert';
import 'package:happyheart/data/model/audio_status_model.dart';
import 'package:happyheart/data/model/login_model.dart';
import 'package:http/http.dart' as http;
import '../../../utils/config.dart';

class AudioApiCalling {
  Future<AudioStatusModel?> audioStatusApiCalling({String? userId,String? childId,String? audioId}) async {
    try {
      var url = Config.baseUserUrl + Config.audioStatus;

      // Create the JSON request body
      var body = jsonEncode({
        "userId" : userId,
        "childId" : childId,
        "audioId":audioId
      });

      // Make the POST request
      var response = await http.post(Uri.parse(url), body: body, headers: {
        'Content-Type': 'application/json',
      });

      if (response.statusCode == 200) {
        // Request successful, do something with the response
        print('API response: ${response.body}');
        var json = jsonDecode(response.body);
        return AudioStatusModel.fromJson(json);
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
