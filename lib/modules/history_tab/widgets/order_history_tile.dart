import 'package:flutter/material.dart';
import 'package:grocery_nepal/constants.dart';
import 'package:grocery_nepal/data/models/product/order.dart';
import 'package:grocery_nepal/modules/order_detail/order_detail_screen.dart';

class OrderHistoryTile extends StatelessWidget {
  const OrderHistoryTile(this.order);

  final Order order;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => OrderDetailScreen()));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              offset: const Offset(1, 1),
              blurRadius: 1,
              spreadRadius: 2,
            )
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '#${order.id}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  order.date,
                  style: TextStyle(
                    color: greyColor,
                  ),
                ),
                Text(
                  'Rs. ${order.total}',
                  style: TextStyle(color: greenColor),
                ),
                Text(
                  order.status,
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
