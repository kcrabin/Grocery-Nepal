import 'package:flutter/material.dart';
import 'package:grocery_nepal/widgets/custom_button.dart';
import 'package:grocery_nepal/widgets/input_field.dart';

class EditDetails extends StatelessWidget {
  const EditDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("edit details"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            InputField(
              'Full name',
              inputType: TextInputType.name,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(
              height: 10,
            ),
            InputField(
              'Email',
              inputType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomButton('Change', () {
                Navigator.pop(context);
              }),
            )
          ],
        ),
      ),
    );
  }
}
