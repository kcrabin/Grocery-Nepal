import 'package:flutter/material.dart';

import '../../../constants.dart';

class StatusTile extends StatelessWidget {
  const StatusTile({
    Key? key,
    required this.title,
    required this.isSelected,
  }) : super(key: key);
  final String title;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: 80),
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
          color: isSelected ? greenColor : Colors.transparent,
          borderRadius: BorderRadius.circular(8)),
      child: Text(
        title,
        style: TextStyle(color: isSelected ? Colors.white : greyColor),
      ),
    );
  }
}
