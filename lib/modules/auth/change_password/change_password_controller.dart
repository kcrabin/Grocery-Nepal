import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_nepal/app_controller.dart';
import 'package:grocery_nepal/data/api/auth_api.dart';

class ChangePasswordController extends GetxController {
  final isLoading = false.obs;
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  Future<void> changePassword() async {
    String oldPassword = oldPasswordController.text.trim();
    String newPassword = newPasswordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    if (oldPassword.isEmpty || newPassword.isEmpty || confirmPassword.isEmpty) {
      Get.rawSnackbar(message: 'All fields are required');
      return;
    }
    if (confirmPassword != newPassword) {
      Get.rawSnackbar(message: 'Enter same confirm password does not match.');
      return;
    }
    if (newPassword == oldPassword) {
      Get.rawSnackbar(
          message: 'New password should not be same as old password.');
      return;
    }
    isLoading(true);
    try {
      String email = Get.find<AppController>().userProfile!.email ?? '';
      await AuthApi.login(username: email, password: oldPassword);
    } catch (e) {
      isLoading(false);
      print(e.toString());
      String errorMessage;
      if (e.toString().contains("SocketException")) {
        errorMessage = "No Internet Connection";
      } else if (e.toString().contains("Invalid Credentials")) {
        errorMessage = "Old password does not match";
      } else {
        errorMessage = e.toString();
        // errorMessage = 'Failed to load data.';
      }
      Get.rawSnackbar(message: errorMessage);
      return;
    }
    try {
      await AuthApi.changePassword(password: newPassword);
      Get.back();
      Get.rawSnackbar(message: 'Password changed successfully.');
    } catch (e) {
      isLoading(false);
      print(e.toString());
      String errorMessage;
      if (e.toString().contains("SocketException")) {
        errorMessage = "No Internet Connection";
      } else {
        errorMessage = e.toString();
        // errorMessage = 'Failed to load data.';
      }
      Get.rawSnackbar(message: errorMessage);
    }

    isLoading(false);
  }

  @override
  void onClose() {
    oldPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
