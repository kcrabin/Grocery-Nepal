import 'package:flutter/material.dart';
import 'package:grocery_nepal/modules/order_tab/widgets/status_tile.dart';

final List<String> status = [
  'All',
  'Pending',
  'Processing',
  'Delivered',
  'Cancelled'
];

class StatusBar extends StatelessWidget {
  final int selectedIndex;
  final Function onPressed;

  const StatusBar({
    Key? key,
    required this.onPressed,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: 35,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: status.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: index == 0
                  ? const EdgeInsets.only(left: 15)
                  : index == status.length - 1
                      ? const EdgeInsets.only(right: 15)
                      : EdgeInsets.zero,
              child: InkWell(
                onTap: () {
                  onPressed(index);
                },
                child: StatusTile(
                  title: status[index],
                  isSelected: selectedIndex == index,
                ),
              ),
            );
          }),
    );
  }
}
