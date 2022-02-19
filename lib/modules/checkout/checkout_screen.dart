import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_nepal/modules/checkout/order_success/order_success.dart';
import 'package:grocery_nepal/modules/checkout/widgets/order_summary.dart';
import 'package:grocery_nepal/modules/checkout/widgets/payment_method.dart';
import 'package:grocery_nepal/modules/checkout/widgets/shipping_address.dart';
import 'package:grocery_nepal/widgets/widgets.dart';

import 'checkout_controller.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CheckoutController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
      ),
      body: Obx(
        () => controller.isLoading.isTrue
            ? const Loading()
            : Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          OrderSummary(controller.cartItems),
                          ShippingAddress(),
                          Obx(() => PaymentMethodContainer(
                              isCod: controller.isCod.value)),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Obx(() => controller.isCod.isTrue
                        ? CustomButton('Confirm Order', controller.checkout)
                        : CustomButton('Pay Now', controller.checkout)),
                  )
                ],
              ),
      ),
    );
  }
}
