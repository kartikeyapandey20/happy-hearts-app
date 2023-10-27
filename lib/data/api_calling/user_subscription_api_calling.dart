import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/config.dart';
import '../model/user_subscription_model.dart';

class UserSubscriptionUserApiCalling {
  Future<UserSubscriptionModel> userSubscriptionUserApiCalling() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var userId = preferences.getString("userId");
    print("this is userId : $userId");
    try {
      var url = Config.baseUserUrl + Config.getUserSubscription;
      var body = jsonEncode({
        "userId": "$userId",
      });
      var response = await http.post(Uri.parse(url),body : body, headers: {
        'Content-Type': 'application/json',
      });

      if (response.statusCode == 200) {
        print('API response: ${response.body}');
        var json = jsonDecode(response.body);
        print(json);
        return UserSubscriptionModel.fromJson(json);
      } else {
        print('API request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      print('API request failed with error: $e');
    }

    // Handle the case where no subscription model is available
    return UserSubscriptionModel(); // Return a default or empty SubscriptionModel object
  }
}
