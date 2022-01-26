import 'package:flutter/material.dart';
import 'package:grocery_nepal/constants.dart';

class StatusTile extends StatelessWidget {
  final String title;
  final bool isSelected;

  const StatusTile({
    Key? key,
    required this.title,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      constraints: BoxConstraints(minWidth: 80),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isSelected ? greenColor : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: isSelected ? Colors.white : greyColor,
        ),
      ),
    );
  }
}
