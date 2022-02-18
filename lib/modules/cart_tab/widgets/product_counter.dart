import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_nepal/constants.dart';
import 'package:grocery_nepal/data/models/order/cart_items.dart';

import 'package:grocery_nepal/modules/cart_tab/cart_controller.dart';

class ProductCounter extends StatefulWidget {
  const ProductCounter(this.item, {Key? key}) : super(key: key);
  final CartItem item;
  @override
  State<ProductCounter> createState() => _ProductCounterState();
}

class _ProductCounterState extends State<ProductCounter> {
  int _count = 1;

  @override
  void initState() {
    super.initState();
    _count = widget.item.quantity;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            if (_count > 1) {
              setState(() {
                _count--;
              });
            }
            Get.find<CartController>()
                .changeQuantity(widget.item.product, _count);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: greenColor,
            ),
            padding: const EdgeInsets.all(2),
            child: const Icon(
              Icons.remove,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
          margin: const EdgeInsets.symmetric(horizontal: 5),
          child: Text('$_count'),
        ),
        InkWell(
          onTap: () {
            setState(() {
              _count++;
            });
            Get.find<CartController>()
                .changeQuantity(widget.item.product, _count);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: greenColor,
            ),
            padding: const EdgeInsets.all(2),
            child: const Icon(
              Icons.add,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }
}
