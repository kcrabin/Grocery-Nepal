import 'package:flutter/material.dart';
import 'package:grocery_nepal/constants.dart';
import 'package:get/get.dart';
import 'package:grocery_nepal/modules/auth/login/login_screen.dart';

import '../../../app_controller.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      onPressed: () {
        // Get.find<AppController>().login();
        Navigator.pushNamed(context, '/login');
        // Get.to(() => LoginScreen());
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 100,
        child: Stack(
          children: const [
            Center(
              child: Text(
                'Log In',
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
            ),
            Icon(
              Icons.login,
              color: Colors.white,
            )
          ],
        ),
      ),
      color: greenColor,
      elevation: 3,
    );
  }
}
