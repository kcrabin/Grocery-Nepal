import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_nepal/constants.dart';
import 'package:grocery_nepal/data/models/order/order_details.dart';
import 'package:grocery_nepal/modules/order_detail/order_detail_screen.dart';
import 'package:grocery_nepal/widgets/widgets.dart';
import 'package:lottie/lottie.dart';

class OrderSuccess extends StatelessWidget {
  const OrderSuccess(this.orderDetail, {Key? key}) : super(key: key);
  final OrderDetail orderDetail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset('assets/lottie/success.json',
                  repeat: false, width: 200),
              const Text(
                'Order Success',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Your order has been placed successfully.',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 20),
              CustomButton('View Order Detail', () {
                Get.to(() => OrderDetailsScreen(), arguments: orderDetail);
              }),
              const SizedBox(height: 10),
              TextButton(
                child: const Text(
                  'Back to Home',
                  style: TextStyle(color: greenColor),
                ),
                onPressed: () {
                  Get.back();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
