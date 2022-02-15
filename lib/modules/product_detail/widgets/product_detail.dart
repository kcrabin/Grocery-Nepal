import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({required this.description});

  final String description;

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              isOpen = !isOpen;
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Product Detail',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Icon(isOpen ? Icons.expand_more : Icons.chevron_right)
              ],
            ),
          ),
        ),
        isOpen
            ? Text(widget.description, textAlign: TextAlign.justify)
            : const SizedBox(),
      ],
    );
  }
}
