import 'package:flutter/material.dart';
import 'package:grocery_nepal/data/models/product.dart';

import 'widgets/bottom_container.dart';
import 'widgets/detail_body.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Column(children: [
        Expanded(child: DetailBody(product: product)),
        BottomContainer(),
      ]),
    );
  }
}
