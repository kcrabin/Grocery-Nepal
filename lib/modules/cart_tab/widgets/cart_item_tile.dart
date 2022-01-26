import 'package:flutter/material.dart';
import 'package:grocery_nepal/data/models/cart_items.dart';

import '../../../constants.dart';
import 'product_counter.dart';

class CartItemTile extends StatelessWidget {
  final CartItem cartItem;

  const CartItemTile(this.cartItem, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                Image.asset(
                  cartItem.product.image,
                  height: 50,
                  width: 50,
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
                      ProductCounter(cartItem.quantity),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.delete_outline,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text('Rs ${cartItem.product.price * cartItem.quantity}'),
                  ],
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 2,
          ),
        ],
      ),
    );
  }
}
