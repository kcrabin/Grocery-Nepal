import 'package:flutter/material.dart';
import 'package:grocery_nepal/data/models/product.dart';

import 'image_container.dart';

class DetailBody extends StatelessWidget {
  final Product product;

  const DetailBody({required this.product});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ImageContainer(
            image: product.image,
          ),
          Text(product.name),
          Text(product.unit),
        ]),
      ),
    );
  }
}
