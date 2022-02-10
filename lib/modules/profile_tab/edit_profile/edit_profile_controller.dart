import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_nepal/app_controller.dart';
import 'package:grocery_nepal/data/api/user_api.dart';
import 'package:grocery_nepal/data/models/user/user_profile.dart';

class EditProfileController extends GetxController {
  final isLoading = false.obs;
  late final TextEditingController nameController;
  late final TextEditingController emailController;

  @override
  void onInit() {
    UserProfile user = Get.find<AppController>().userProfile!;
    nameController = TextEditingController(text: user.name);
    emailController = TextEditingController(text: user.email);
    super.onInit();
  }

  Future<void> editProfile() async {
    String name = nameController.text.trim();
    String email = emailController.text.trim();

    if (name.isEmpty || email.isEmpty) {
      Get.rawSnackbar(message: 'All fields are required');
      return;
    }

    isLoading(true);
    try {
      var response = await UserApi.editProfile(name: name, email: email);
      isLoading(false);
      Get.back();
      Get.rawSnackbar(message: 'Profile updated successfully');
      Get.find<AppController>().userProfile = response;
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
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    super.onClose();
  }
}
