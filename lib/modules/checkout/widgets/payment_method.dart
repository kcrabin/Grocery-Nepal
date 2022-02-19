import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_nepal/constants.dart';

import '../checkout_controller.dart';

// enum PaymentMethod { cod, khalti }

class PaymentMethodContainer extends StatelessWidget {
  const PaymentMethodContainer({required this.isCod, Key? key})
      : super(key: key);

  final bool isCod;

  Widget getPaymentTile(
      {required String image,
      required bool isSelected,
      required VoidCallback onPress}) {
    return Expanded(
        child: GestureDetector(
      onTap: onPress,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: greenColor.withOpacity(0.1),
            border: Border.all(color: greenColor, width: isSelected ? 2 : 0),
            borderRadius: BorderRadius.circular(10)),
        height: 80,
        child: Image.asset(image),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Payment Method",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              getPaymentTile(
                image: "assets/icons/khalti.png",
                isSelected: !isCod,
                onPress: () {
                  Get.find<CheckoutController>().isCod(false);
                },
              ),
              const SizedBox(
                width: 10,
              ),
              getPaymentTile(
                image: "assets/icons/cod.png",
                isSelected: isCod,
                onPress: () {
                  Get.find<CheckoutController>().isCod(true);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
