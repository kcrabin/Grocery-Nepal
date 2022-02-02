import 'package:flutter/material.dart';
import 'package:grocery_nepal/constants.dart';

class StatusTile extends StatelessWidget {
  const StatusTile(this.status, this.isSelected);

  final String status;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: 80),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: isSelected ? greenColor : Colors.white,
      ),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Center(
        child: Text(
          status,
          style: TextStyle(
            color: isSelected ? Colors.white : greenColor,
          ),
        ),
      ),
    );
  }
}
