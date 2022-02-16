import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:grocery_nepal/data/models/product/product.dart';
import 'package:get/get.dart';
import 'package:grocery_nepal/modules/favourites/favourites_controller.dart';

import '../../../constants.dart';

class BottomContainer extends StatelessWidget {
  const BottomContainer({required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: greenColor.withOpacity(0.1),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: MaterialButton(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('Added to cart'),
                      duration: Duration(milliseconds: 2000),
                      backgroundColor: greenColor),
                );
              },
              child: const Text(
                'Add to cart',
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
              color: greenColor,
              elevation: 0,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          GetBuilder<FavouitesController>(builder: (favouitesController) {
            return favouitesController.favourites.firstWhereOrNull(
                        (element) => element.id == product.id) ==
                    null
                ? IconButton(
                    onPressed: () {
                      favouitesController.addFavourite(product);
                    },
                    icon: const Icon(
                      Icons.favorite_outline,
                      color: Colors.grey,
                      size: 30,
                    ),
                  )
                : IconButton(
                    onPressed: () {
                      favouitesController.removeFavourite(product);
                    },
                    icon: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 30,
                    ),
                  );
          }),
          const SizedBox(
            width: 15,
          ),
        ],
      ),
    );
  }
}
