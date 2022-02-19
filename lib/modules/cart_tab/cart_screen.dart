import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_nepal/app_controller.dart';
import 'package:grocery_nepal/constants.dart';
import 'package:grocery_nepal/modules/auth/login/login_screen.dart';
import 'package:grocery_nepal/modules/cart_tab/cart_controller.dart';
import 'package:grocery_nepal/modules/checkout/checkout_screen.dart';
import 'package:grocery_nepal/widgets/custom_button.dart';
import 'widgets/cart_item_tile.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My cart'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: GetBuilder<CartController>(builder: (controller) {
            return controller.cartItems.isEmpty
                ? const Center(
                    child: Text('Your cart is empty.'),
                  )
                : Column(
                    children: [
                      Expanded(
                          child: ListView.builder(
                        itemCount: controller.cartItems.length,
                        itemBuilder: (context, index) {
                          return CartItemTile(controller.cartItems[index]);
                        },
                      )),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Obx(
                          () => CustomButton(
                              "Checkout (Rs. ${Get.find<CartController>().total.value})",
                              () {
                            if (Get.find<AppController>().isLoggedIn.isTrue) {
                              Get.to(() => const CheckoutScreen(),
                                  arguments: controller.cartItems);
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title: const Text('Login'),
                                        content: const Text(
                                            'Please login to continue.'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text(
                                              'Cancel',
                                              style:
                                                  TextStyle(color: Colors.red),
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                              Get.to(() => LoginScreen());
                                            },
                                            child: const Text(
                                              'Login',
                                              style:
                                                  TextStyle(color: greenColor),
                                            ),
                                          ),
                                        ],
                                      ));
                            }
                          }),
                        ),
                      ),
                    ],
                  );
          }),
        ));
  }
}
