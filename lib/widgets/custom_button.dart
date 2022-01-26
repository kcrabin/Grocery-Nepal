import 'package:flutter/material.dart';
import 'package:grocery_nepal/constants.dart';

class CostomButton extends StatelessWidget {
  final VoidCallback onpress;
  final String text;

  const CostomButton(
    this.text,
    this.onpress,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      onPressed: onpress,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.75,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 17),
          ),
        ),
      ),
      color: greenColor,
      elevation: 0,
    );
  }
}
