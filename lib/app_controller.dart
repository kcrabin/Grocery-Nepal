import 'package:get/get.dart';
import 'package:grocery_nepal/data/models/login_response.dart';
import 'package:grocery_nepal/data/models/user_profile.dart';

class AppController extends GetxController {
  final isLoggedIn = false.obs;
  UserProfile? userProfile;

  void login(LoginResponse loginResponse) {
    isLoggedIn(true);
    userProfile = UserProfile(
      id: loginResponse.id,
      name: loginResponse.name,
      email: loginResponse.email,
    );
  }

  void logout() {
    isLoggedIn(false);
  }
}
