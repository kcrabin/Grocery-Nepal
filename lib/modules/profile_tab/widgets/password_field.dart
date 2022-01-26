import 'package:flutter/material.dart';

import '../../../constants.dart';

class PasswordField extends StatefulWidget {
  const PasswordField(this.label, {required this.controller});

  final String label;
  final TextEditingController controller;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _isVisible = false;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: !_isVisible,
      style: const TextStyle(fontWeight: FontWeight.bold),
      cursorColor: Colors.black,
      decoration: InputDecoration(
        suffixIcon: InkWell(
          onTap: () {
            setState(() {
              _isVisible = !_isVisible;
            });
          },
          child: Icon(
            _isVisible ? Icons.visibility : Icons.visibility_off,
            color: greyColor,
          ),
        ),
        labelText: widget.label,
        labelStyle:
            const TextStyle(color: greenColor, fontWeight: FontWeight.normal),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: greenColor, width: 2),
        ),
      ),
    );
  }
}
