import 'package:flutter/material.dart';
import 'package:grocery_nepal/modules/profile_tab/widgets/password_field.dart';
import 'package:grocery_nepal/widgets/custom_button.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController oldPasswordController = TextEditingController();
    final TextEditingController newPasswordController = TextEditingController();
    final TextEditingController confirmPasswordController =
        TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Change Password'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
          child: Column(children: [
            PasswordField('Old Password', controller: oldPasswordController),
            const SizedBox(
              height: 10,
            ),
            PasswordField('New Password', controller: newPasswordController),
            const SizedBox(
              height: 10,
            ),
            PasswordField('Confirm Password',
                controller: confirmPasswordController),
            const SizedBox(
              height: 50,
            ),
            Center(
              child: CostomButton('Change', () {
                if (oldPasswordController.text.trim().isEmpty &&
                    newPasswordController.text.trim().isEmpty &&
                    confirmPasswordController.text.trim().isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('input fields can\'t be empty'),
                    ),
                  );
                } else if (newPasswordController.text.trim() ==
                    confirmPasswordController.text.trim()) {
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Password didn\'t match.')));
                }
              }),
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
