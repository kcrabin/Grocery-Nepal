import 'package:flutter/material.dart';
import 'package:grocery_nepal/modules/explore_tab/widgets/product_tile.dart';

import '../../../data/models/category.dart';
import '../../../data/models/product.dart';
import 'category_tile.dart';

final List<Category> categories = [
  Category(name: 'All', icon: 'assets/icons/all.svg'),
  Category(name: 'Vegetables', icon: 'assets/icons/vegetable.svg'),
  Category(name: 'Fruits', icon: 'assets/icons/fruit.svg'),
  Category(name: 'Meat', icon: 'assets/icons/meat.svg'),
  Category(name: 'Others', icon: 'assets/icons/fish.svg'),
];

// final List<Product> products = [
//   Product(
//       id: 1,
//       name: 'Cabbage',
//       image: 'assets/images/dummy_image.png',
//       category: 'Vegetables',
//       price: 100,
//       unit: '1 kg',
//       description: 'This is healthy'),
//   Product(
//       id: 2,
//       name: 'Apple',
//       image: 'assets/images/dummy_image.png',
//       category: 'Fruits',
//       price: 100,
//       unit: '1 kg',
//       description: 'This is healthy'),
//   Product(
//       id: 3,
//       name: 'Chicken',
//       image: 'assets/images/dummy_image.png',
//       category: 'Meat',
//       price: 100,
//       unit: '1 kg',
//       description: 'This is healthy'),
//   Product(
//       id: 4,
//       name: 'Trout',
//       image: 'assets/images/dummy_image.png',
//       category: 'Fish',
//       price: 100,
//       unit: '1 kg',
//       description: 'This is healthy'),
//   Product(
//       id: 5,
//       name: 'Broccoli',
//       image: 'assets/images/dummy_image.png',
//       category: 'Vegetables',
//       price: 100,
//       unit: '1 kg',
//       description: 'This is healthy'),
// ];

class CategoryBar extends StatefulWidget {
  const CategoryBar({
    required this.products,
    Key? key,
  }) : super(key: key);

  final List<Product> products;

  @override
  State<CategoryBar> createState() => _CategoryBarState();
}

class _CategoryBarState extends State<CategoryBar> {
  String selectedCategory = 'All';

  Widget getProducts() {
    List<Product> categoryItem = [];
    if (selectedCategory == 'All') {
      categoryItem = widget.products;
    } else {
      for (Product product in widget.products) {
        if (product.category == selectedCategory) {
          categoryItem.add(product);
        }
      }
    }
    return GridView.builder(
        itemCount: categoryItem.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 150 / 190),
        itemBuilder: (context, index) {
          return Row(
            children: [
              ProductTile(
                product: categoryItem[index],
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: 50,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectedCategory = categories[index].name;
                      });
                    },
                    child: CategoryTile(
                      category: categories[index],
                      isSelected: selectedCategory == categories[index].name,
                    ),
                  );
                })),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: getProducts(),
        ))
      ],
    );
  }
}
