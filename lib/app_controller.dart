import 'package:get/get.dart';

class AppController extends GetxController {
  final isLoggedIn = false.obs;

  void login() {
    isLoggedIn(true);
  }

  void logout() {
    isLoggedIn(false);
  }
}
