import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import '../product_detail_controller.dart';

class ProductCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProductDetailController>();
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            //border: Border.all(color: Colors.grey)
            color: Colors.grey.shade300),
        child: Row(
          children: [
            InkWell(
              onTap: controller.decrement,
              child: const Icon(
                Icons.remove,
                color: Colors.red,
                size: 18,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.symmetric(horizontal: 7),
              constraints: const BoxConstraints(minWidth: 30),
              decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  border: Border.all(color: Colors.grey.shade300)),
              child:
                  Center(child: Obx(() => Text("${controller.count.value}"))),
            ),
            InkWell(
              onTap: controller.increment,
              child: const Icon(
                Icons.add,
                color: greenColor,
                size: 18,
              ),
            ),
          ],
        ));
  }
}
