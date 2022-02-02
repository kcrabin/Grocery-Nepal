import 'package:flutter/material.dart';

import 'status_tile.dart';

final List<String> status = [
  "All",
  "Pending",
  "Processing",
  "Delivered",
  "Cancelled"
];

class StatusBar extends StatelessWidget {
  StatusBar({required this.onPressed, required this.selectedIndex});

  final Function onPressed;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: status.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                onPressed(index);
              },
              child: StatusTile(
                status[index],
                selectedIndex == index,
              ),
            );
          }),
    );
  }
}
