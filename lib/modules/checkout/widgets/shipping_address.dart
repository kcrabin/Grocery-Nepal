import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_nepal/constants.dart';
import 'package:grocery_nepal/modules/checkout/shipping_address/shipping_address_edit.dart';

import '../checkout_controller.dart';

class ShippingAddress extends StatelessWidget {
  const ShippingAddress({Key? key}) : super(key: key);

  Widget getAddressRow({required String label, required String data}) {
    return Row(
      children: [
        Expanded(
            child: Text(
          label,
          style: TextStyle(color: Colors.grey.shade600),
        )),
        Expanded(
            child: Text(
          data,
          style: TextStyle(color: Colors.grey.shade600),
        ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutController>(builder: (controller) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Shipping Address",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                controller.shippingAddress == null
                    ? const SizedBox()
                    : TextButton(
                        onPressed: () {
                          Get.to(() => ShippingAddressEdit());
                        },
                        child: const Text(
                          'Edit',
                          style: TextStyle(color: greenColor),
                        ))
              ],
            ),
            controller.shippingAddress == null
                ? MaterialButton(
                    onPressed: () {
                      Get.to(() => ShippingAddressEdit());
                    },
                    color: greenColor,
                    child: const Text(
                      'Add shipping address',
                      style: TextStyle(color: Colors.white),
                    ))
                : Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(top: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: greenColor.withOpacity(0.1),
                    ),
                    child: Column(
                      children: [
                        getAddressRow(
                            label: "PhoneNumber : ",
                            data: controller.shippingAddress!['phone']!),
                        getAddressRow(
                            label: "Province : ",
                            data: controller.shippingAddress!['provience']!),
                        getAddressRow(
                            label: "City : ",
                            data: controller.shippingAddress!['city']!),
                        getAddressRow(
                            label: "Address :",
                            data: controller.shippingAddress!['address']!),
                      ],
                    ),
                  )
          ],
        ),
      );
    });
  }
}
