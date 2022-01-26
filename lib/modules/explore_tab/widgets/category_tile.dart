import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grocery_nepal/constants.dart';

import 'package:grocery_nepal/data/models/category.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({required this.category, required this.isSelected});

  final Category category;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SvgPicture.asset(
            category.icon,
            width: 25,
            height: 25,
            color: isSelected ? greenColor : greyColor,
          ),
          const SizedBox(
            width: 3,
          ),
          Text(
            category.name,
            style: isSelected
                ? const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)
                : const TextStyle(color: greyColor),
          ),
        ],
      ),
    );
  }
}
