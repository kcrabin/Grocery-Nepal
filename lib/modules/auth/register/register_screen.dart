import 'package:flutter/material.dart';
import 'package:grocery_nepal/modules/profile_tab/widgets/password_field.dart';
import 'package:grocery_nepal/widgets/custom_button.dart';
import 'package:grocery_nepal/widgets/input_field.dart';

import '../../../constants.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
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
                'Register',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const Text('Fill your information to continue'),
              const SizedBox(
                height: 40,
              ),
              const InputField(
                'Full name',
                inputType: TextInputType.name,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(
                height: 10,
              ),
              const InputField('Email',
                  inputType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next),
              const SizedBox(
                height: 10,
              ),
              PasswordField('Password', controller: _passwordController),
              const SizedBox(
                height: 10,
              ),
              PasswordField('Password', controller: _confirmPasswordController),
              const SizedBox(
                height: 50,
              ),
              Center(
                child: CustomButton('Register', () {
                  if (_passwordController.text.trim().isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('password can\'t be empty'),
                      ),
                    );
                  } else if (_passwordController.text.trim() ==
                      _confirmPasswordController.text.trim()) {
                    Navigator.popUntil(context, ModalRoute.withName('/'));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Password didn\'t match.')));
                  }
                }),
              ),
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
