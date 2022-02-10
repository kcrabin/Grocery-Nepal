import 'dart:convert';

import 'package:get/get.dart';
import 'package:grocery_nepal/app_controller.dart';
import 'package:grocery_nepal/constants.dart';
import 'package:grocery_nepal/data/models/user/edit_profile_request.dart';
import 'package:grocery_nepal/data/models/user/user_profile.dart';

import 'package:http/http.dart' as http;

class UserApi {
  static Future<UserProfile> getProfile(String token) async {
    final url = baseUrl + "users/profile/";

    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      UserProfile userResponse = UserProfile.fromJson(data);
      return userResponse;
    } else {
      throw Exception('Unable to login');
    }
  }

  static Future<UserProfile> editProfile({
    required String name,
    required String email,
  }) async {
    final url = baseUrl + "users/register/";
    final request = jsonEncode(
      EditProfileRequest(
        name: name,
        email: email,
      ).toJson(),
    );
    String? token =
        Get.find<AppController>().sharedPreferences.getString('token');
    final response = await http.put(
      Uri.parse(url),
      body: request,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      UserProfile userProfile = UserProfile.fromJson(data);

      return userProfile;
    } else {
      print(response.body);
      throw Exception('Unable to login');
    }
  }
}
