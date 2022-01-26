import 'package:flutter/material.dart';
import 'package:grocery_nepal/constants.dart';
import 'package:grocery_nepal/modules/profile_tab/widgets/password_field.dart';
import 'package:grocery_nepal/widgets/custom_button.dart';
import 'package:grocery_nepal/widgets/input_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
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
                const InputField('Email',
                    inputType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next),
                const SizedBox(height: 20),
                const SizedBox(
                  height: 20,
                ),
                PasswordField(
                  'password',
                  controller: _passwordController,
                ),
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: CostomButton('Log in', () {
                    Navigator.pop(context);
                  }),
                ),
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

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
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