import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_nepal/data/models/product/product.dart';
import 'package:grocery_nepal/modules/explore_tab/widgets/explore_tab_controller.dart';

import 'product_tile.dart';

class CustonSearchDelegate extends SearchDelegate {
  List<Product> products = Get.find<ExploreTabController>().products;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        query = '';
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Product> matchedResults = [];
    for (Product item in products) {
      if (item.name.toLowerCase().contains(query.toLowerCase())) {
        matchedResults.add(item);
      }
    }
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(8),
      child: matchedResults.isEmpty
          ? Center(
              child: Text(
                'No matching result',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            )
          : GridView.builder(
              itemCount: matchedResults.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 150 / 190),
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    ProductTile(
                      product: matchedResults[index],
                    ),
                  ],
                );
              }),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Product> matchedResults = [];
    for (Product item in products) {
      if (item.name.toLowerCase().contains(query.toLowerCase())) {
        matchedResults.add(item);
      }
    }
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(8),
      child: GridView.builder(
          itemCount: matchedResults.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 150 / 190),
          itemBuilder: (context, index) {
            return Row(
              children: [
                ProductTile(
                  product: matchedResults[index],
                ),
              ],
            );
          }),
    );
  }
}
