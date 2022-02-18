import 'package:flutter/material.dart';
import 'package:grocery_nepal/data/models/product/product.dart';
import 'product_counter.dart';
import 'image_container.dart';
import 'product_detail.dart';

class DetailBody extends StatelessWidget {
  const DetailBody({required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageContainer(image: product.image),
          Text(
            product.name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Text(
            '1 ${product.unit}',
            style: const TextStyle(color: Colors.grey, fontSize: 16),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ProductCounter(),
              Text(
                'Rs ${product.price}',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )
            ],
          ),
          ProductDetailContainer(description: product.description)
        ],
      ),
    ));
  }
}
