import 'package:flutter/material.dart';
import 'package:grocery_nepal/modules/checkout/widgets/order_summary.dart';
import 'package:grocery_nepal/modules/checkout/widgets/payment_method.dart';
import 'package:grocery_nepal/modules/checkout/widgets/shipping_address.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            OrderSummary(),
            ShippingAddress(),
            PaymentMethodContainer(),
          ],
        ),
      ),
    );
  }
}
