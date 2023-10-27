import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/config.dart';
import '../model/subscribtion_model.dart';

class SubscriptionUserApiCalling {
  Future<SubscriptionModel> subscriptionUserApiCalling() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var userId = preferences.getString("userId");
    print("this is userId : $userId");
    try {
      var url = Config.baseAdminUrl + Config.getSubscription;

      var response = await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
      });

      if (response.statusCode == 200) {
        print('API response: ${response.body}');
        var json = jsonDecode(response.body);
        return SubscriptionModel.fromJson(json);
      } else {
        print('API request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      print('API request failed with error: $e');
    }

    // Handle the case where no subscription model is available
    return SubscriptionModel(); // Return a default or empty SubscriptionModel object
  }
}
