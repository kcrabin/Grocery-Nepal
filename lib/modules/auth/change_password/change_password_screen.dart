import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_nepal/modules/auth/change_password/change_password_controller.dart';
import 'package:grocery_nepal/modules/profile_tab/widgets/password_field.dart';
import 'package:grocery_nepal/widgets/custom_button.dart';
import 'package:grocery_nepal/widgets/widgets.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChangePasswordController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Password'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
          child: Column(children: [
            PasswordField('Old Password',
                controller: controller.oldPasswordController),
            const SizedBox(
              height: 10,
            ),
            PasswordField('New Password',
                controller: controller.newPasswordController),
            const SizedBox(
              height: 10,
            ),
            PasswordField('Confirm Password',
                controller: controller.confirmPasswordController),
            const SizedBox(
              height: 50,
            ),
            Obx(
              () => controller.isLoading.isTrue
                  ? const Loading(
                      size: 100,
                    )
                  : Center(
                      child: CustomButton(
                        'Change',
                        controller.changePassword,
                      ),
                    ),
            ),
            const SizedBox(
              height: 20,
            ),
          ]),
        ),
      ),
    );
  }
}
