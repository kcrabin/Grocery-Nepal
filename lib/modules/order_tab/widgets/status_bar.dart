import 'package:flutter/material.dart';
import 'package:grocery_nepal/modules/order_tab/widgets/status_tile.dart';

final List<String> status = [
  "All",
  "Pending",
  "Processing",
  "Delivered",
  "Cancelled"
];

class StatusBar extends StatelessWidget {
  final int selectedIndex;
  final Function onPress;
  const StatusBar(
      {Key? key, required this.selectedIndex, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
          itemCount: status.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: index == 0
                  ? const EdgeInsets.only(left: 15)
                  : index == status.length - 1
                      ? const EdgeInsets.only(right: 15)
                      : EdgeInsets.zero,
              child: InkWell(
                onTap: () {
                  onPress(index);
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
