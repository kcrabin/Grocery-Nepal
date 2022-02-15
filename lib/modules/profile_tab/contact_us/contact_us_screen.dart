import 'package:flutter/material.dart';
import 'package:grocery_nepal/widgets/custom_button.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatelessWidget {
  final inputDecoration = const InputDecoration(
    hintStyle: TextStyle(color: Colors.grey),
    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    labelStyle: TextStyle(color: Colors.grey),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey, width: 1.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey, width: 1.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black, width: 1.5),
    ),
  );

  @override
  Widget build(BuildContext context) {
    String subject = '';
    String message = '';
    return Scaffold(
      appBar: AppBar(
        title: const Text('COntact us'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: ListView(
          children: [
            const SizedBox(
              height: 15,
            ),
            TextField(
              textInputAction: TextInputAction.next,
              textAlign: TextAlign.left,
              onChanged: (value) {
                subject = value;
              },
              decoration: inputDecoration.copyWith(labelText: 'Subject'),
            ),
            const SizedBox(
              height: 15.0,
            ),
            TextField(
              maxLines: 5,
              textInputAction: TextInputAction.done,
              textAlign: TextAlign.left,
              onChanged: (value) {
                subject = value;
              },
              decoration: inputDecoration.copyWith(labelText: 'Subject'),
            ),
            const SizedBox(
              height: 15.0,
            ),
            TextField(
                maxLines: 5,
                textInputAction: TextInputAction.done,
                textAlign: TextAlign.left,
                onChanged: (value) {
                  message = value;
                },
                decoration: inputDecoration.copyWith(labelText: 'Message')),
            const SizedBox(
              height: 24.0,
            ),
            CustomButton(
              'Send',
              () {
                launch('mailto:kcrabin587@gmail.com? subject=' +
                    subject +
                    '&body=' +
                    message);
              },
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
