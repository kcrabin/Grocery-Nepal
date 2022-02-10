import 'package:get/get.dart';

import 'package:grocery_nepal/data/models/user/user_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/api/user_api.dart';
import 'data/models/auth/login_response.dart';

class AppController extends GetxController {
  final SharedPreferences sharedPreferences;
  final isLoggedIn = false.obs;
  AppController(this.sharedPreferences) {
    String? token = sharedPreferences.getString('token');
    if (token == '' || token == null) {
      isLoggedIn(false);
    } else {
      getUserProfile(token);
      isLoggedIn(true);
    }
  }

  UserProfile? userProfile;
  final isProfileLoading = false.obs;
  final isNoInternet = false.obs;

  void getUserProfile(String token) async {
    isProfileLoading(true);
    isNoInternet(false);
    try {
      userProfile = await UserApi.getProfile(token);
    } catch (e) {
      print(e);
      if (e.toString().contains('SocketException')) {
        isNoInternet(true);
      } else {
        logout();
      }
    }
    isProfileLoading(false);
  }

  void login(LoginResponse loginResponse) {
    isLoggedIn(true);
    userProfile = UserProfile(
      id: loginResponse.id,
      name: loginResponse.name,
      email: loginResponse.email,
    );
  }

  void logout() {
    sharedPreferences.setString('token', '');
    isLoggedIn(false);
  }
}
