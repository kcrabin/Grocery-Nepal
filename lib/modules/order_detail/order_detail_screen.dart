import 'package:flutter/material.dart';
import 'package:grocery_nepal/constants.dart';
import 'package:grocery_nepal/data/models/product/order_detail.dart';

// final OrderDetail orderDetail = OrderDetail(items: [Items(product:)]);

class OrderDetailScreen extends StatelessWidget {
  const OrderDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order detail'),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '#1234',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '1 Feb 2022',
                    ),
                  ],
                ),
                Text('Delivered'),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Delivered to',
            ),
            Text(
              'Pokhara, Nepal',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Payment Method',
            ),
            Text(
              'Khalti',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Divider(thickness: 1),
            Text(
              "Order summary",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [Text('Cabbage x 2'), Text('1 Kg')],
                        ),
                        Text('Rs 200')
                      ]);
                }),
            Divider(
              thickness: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Rs 500',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Payment Status'),
                Text(
                  'PAID',
                  style: TextStyle(color: greenColor),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
