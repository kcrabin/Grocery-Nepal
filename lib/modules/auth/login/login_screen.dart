import 'package:flutter/material.dart';
import 'package:grocery_nepal/constants.dart';
import 'package:grocery_nepal/modules/auth/login/login_controller.dart';
import 'package:grocery_nepal/modules/profile_tab/widgets/password_field.dart';
import 'package:grocery_nepal/widgets/custom_button.dart';
import 'package:grocery_nepal/widgets/input_field.dart';
import 'package:get/get.dart';
import 'package:grocery_nepal/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Login',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Text('Enter your credentials.'),
                const SizedBox(
                  height: 40,
                ),
                const SizedBox(
                  height: 30,
                ),
                InputField('Email',
                    controller: controller.emailController,
                    inputType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next),
                const SizedBox(height: 20),
                const SizedBox(
                  height: 20,
                ),
                PasswordField(
                  'password',
                  controller: controller.passwordController,
                ),
                const SizedBox(
                  height: 50,
                ),
                Obx(() => controller.isLoading.isTrue
                    ? Loading(
                        size: 100,
                      )
                    : Center(
                        child: CustomButton('Log in', () {
                          controller.login();
                        }),
                      )),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Text(
                      'Not Registered?',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      child: const Text(
                        'Register now',
                        style: TextStyle(color: greenColor),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}






// Center(
//         child: TextButton(
//           child: Text('to register'),
//           onPressed: () {
//             Navigator.pushNamed(context, '/register');
//           },
//         ),
//       ),