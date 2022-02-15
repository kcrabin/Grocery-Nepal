import 'package:flutter/material.dart';

import '../../../constants.dart';

class ProductCounter extends StatefulWidget {
  const ProductCounter(this.quantity, {Key? key}) : super(key: key);
  final int quantity;
  @override
  State<ProductCounter> createState() => _ProductCounterState();
}

class _ProductCounterState extends State<ProductCounter> {
  int count = 1;
  @override
  void initState() {
    super.initState();
    count = widget.quantity;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.grey)),
        child: Row(
          children: [
            InkWell(
              onTap: () {
                if (count > 1) {
                  setState(() {
                    count--;
                  });
                }
              },
              child: const Icon(
                Icons.remove,
                color: greenColor,
                size: 18,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.symmetric(horizontal: 7),
              constraints: const BoxConstraints(minWidth: 30),
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  border: Border.all(color: Colors.grey.shade300)),
              child: Center(child: Text("${count}")),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  count++;
                });
              },
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
