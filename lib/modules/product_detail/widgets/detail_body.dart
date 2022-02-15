import 'package:flutter/material.dart';
import 'package:grocery_nepal/data/models/product/product.dart';
import 'package:grocery_nepal/modules/product_detail/widgets/product_detail.dart';
import 'product_counter.dart';

import 'image_container.dart';

class DetailBody extends StatelessWidget {
  final Product product;

  const DetailBody({required this.product});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ImageContainer(
          image: product.image,
        ),
        Text(
          product.name,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
        ),
        Text(product.description),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const ProductCounter(1),
            Text(
              '1 ${product.unit}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        ProductDetail(
          description: product.description,
        )
      ]),
    );
  }
}
