import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_nepal/data/models/order/cart_items.dart';

import 'package:grocery_nepal/modules/cart_tab/cart_controller.dart';
import '../../../constants.dart';
import 'product_counter.dart';

class CartItemTile extends StatelessWidget {
  final CartItem cartItem;
  const CartItemTile(
    this.cartItem, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                CachedNetworkImage(
                  imageUrl: imageUrl + cartItem.product.image,
                  errorWidget: (context, url, error) => Image.asset(
                    'assets/images/dummy_image.png',
                    fit: BoxFit.cover,
                  ),
                  width: 50,
                  height: 50,
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cartItem.product.name,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        cartItem.product.unit,
                        style: const TextStyle(fontSize: 12, color: greyColor),
                      ),
                      ProductCounter(cartItem),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  content:
                                      const Text('Remove the item from cart?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text(
                                        'Cancel',
                                        style: TextStyle(color: greenColor),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Get.find<CartController>()
                                            .removeFromCart(cartItem.product);

                                        Navigator.pop(context);
                                      },
                                      child: const Text(
                                        'Remove',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ),
                                  ],
                                ));
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(5),
                        child: Icon(
                          Icons.delete_outlined,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text('Rs ${cartItem.product.price * cartItem.quantity}')
                  ],
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 2,
          )
        ],
      ),
    );
  }
}
