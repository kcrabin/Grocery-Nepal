import 'package:flutter/material.dart';

import '../constants.dart';

class InputField extends StatelessWidget {
  final String label;
  final TextInputType inputType;
  final TextInputAction textInputAction;

  const InputField(this.label,
      {this.inputType = TextInputType.text,
      this.textInputAction = TextInputAction.done});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: inputType,
      textInputAction: textInputAction,
      style: const TextStyle(fontWeight: FontWeight.bold),
      cursorColor: Colors.black,
      decoration: InputDecoration(
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: greenColor, width: 2),
        ),
        labelText: label,
        labelStyle:
            const TextStyle(color: greenColor, fontWeight: FontWeight.bold),
      ),
    );
  }
}
