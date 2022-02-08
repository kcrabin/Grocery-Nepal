import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_nepal/modules/profile_tab/widgets/password_field.dart';
import 'register_controller.dart';
import 'package:grocery_nepal/widgets/widgets.dart';

import '../../../constants.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Register",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text('Fill your information to continue.'),
                const SizedBox(
                  height: 40,
                ),
                InputField(
                  "Full Name",
                  inputType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  controller: controller.nameController,
                ),
                const SizedBox(
                  height: 10,
                ),
                InputField(
                  "Email",
                  inputType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  controller: controller.emailController,
                ),
                const SizedBox(
                  height: 10,
                ),
                PasswordField(
                  'Password',
                  controller: controller.passwordController,
                ),
                const SizedBox(
                  height: 10,
                ),
                PasswordField(
                  'Confirm Password',
                  controller: controller.confirmPasswordController,
                ),
                const SizedBox(
                  height: 50,
                ),
                Obx(() => controller.isLoading.isTrue
                    ? const Loading(
                        size: 100,
                      )
                    : Center(
                        child: CustomButton('Register', controller.register))),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already Registered?'),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(color: greenColor),
                        ))
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
