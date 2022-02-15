import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_nepal/constants.dart';
import 'package:grocery_nepal/data/models/order/order.dart';
import 'package:grocery_nepal/modules/order_detail/order_detail_screen.dart';

class OrderTile extends StatelessWidget {
  final Order order;
  const OrderTile(this.order, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) => OrderDetailsScreen()));
        Get.to(() => OrderDetailsScreen(), arguments: order.id);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade300,
                  offset: const Offset(1, 1),
                  spreadRadius: 2,
                  blurRadius: 3)
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '#${order.id}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  order.dateOrdered ?? '',
                  style: const TextStyle(color: greyColor),
                ),
                Text(
                  'Rs ${order.total}',
                  style: const TextStyle(color: greenColor, fontSize: 16),
                ),
                Text(
                  order.status ?? '',
                  style: const TextStyle(color: greyColor),
                ),
              ],
            ),
            const Icon(Icons.chevron_right)
          ],
        ),
      ),
    );
  }
}
