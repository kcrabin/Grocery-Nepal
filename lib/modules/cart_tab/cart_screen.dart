import 'package:flutter/material.dart';
import 'package:grocery_nepal/data/models/cart_items.dart';
import 'package:grocery_nepal/data/models/product.dart';
import 'package:grocery_nepal/modules/cart_tab/widgets/cart_item_tile.dart';
import 'package:grocery_nepal/modules/checkout/checkout_screen.dart';
import 'package:grocery_nepal/widgets/custom_button.dart';

final List<CartItem> cartItems = [
  CartItem(
      Product(
          category: 'Vegetables',
          description: 'this is healthy',
          id: 1,
          image: 'assets/images/dummy_image.png',
          name: 'BroColi',
          unit: '1 kg',
          price: 300),
      3),
  CartItem(
      Product(
          category: 'Fruits',
          description: 'this is healthy',
          id: 2,
          image: 'assets/images/dummy_image.png',
          name: 'Apple',
          unit: '2 kg',
          price: 400),
      2),
  CartItem(
      Product(
          category: 'Meat',
          description: 'this is healthy',
          id: 3,
          image: 'assets/images/dummy_image.png',
          name: 'Fish',
          unit: '2 kg',
          price: 800),
      2),
  CartItem(
      Product(
          category: 'Fruits',
          description: 'this is healthy',
          id: 2,
          image: 'assets/images/dummy_image.png',
          name: 'Orange',
          unit: '2 kg',
          price: 300),
      2),
];

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  return CartItemTile(cartItems[index]);
                }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: CustomButton('Checkout(Rs. 1200)', () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return CheckoutScreen();
                }),
              );
            }),
          ),
        ],
      ),
    );
  }
}
