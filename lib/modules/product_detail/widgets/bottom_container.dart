import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_nepal/data/models/product/product.dart';
import 'package:grocery_nepal/modules/favourites/favourites_controller.dart';

import '../../../constants.dart';
import '../product_detail_controller.dart';

class BottomContainer extends StatelessWidget {
  const BottomContainer({required this.product, Key? key}) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: greenColor.withOpacity(0.1),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: MaterialButton(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              minWidth: 150,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('Added to cart'),
                      duration: Duration(milliseconds: 2000),
                      backgroundColor: greenColor),
                );
                Get.find<ProductDetailController>().addToCart();
              },
              child: const Text(
                'Add to Cart',
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
              color: greenColor,
              elevation: 0,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          GetBuilder<FavouitesController>(builder: (favoriteController) {
            return favoriteController.favourites.firstWhereOrNull(
                        (element) => element.id == product.id) !=
                    null
                ? IconButton(
                    onPressed: () {
                      favoriteController.removeFavourite(product);
                    },
                    icon: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                  )
                : IconButton(
                    onPressed: () {
                      favoriteController.addFavourite(product);
                    },
                    icon: const Icon(
                      Icons.favorite_outline,
                      color: Colors.grey,
                    ),
                  );
          }),
        ],
      ),
    );
  }
}
