import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_nepal/app_controller.dart';
import 'package:grocery_nepal/data/api/order_api.dart';
import 'package:grocery_nepal/data/models/order/cart_items.dart';
import 'package:grocery_nepal/data/models/order/order_request.dart';
import 'package:grocery_nepal/modules/cart_tab/cart_controller.dart';
import 'package:grocery_nepal/modules/checkout/widgets/shipping_address.dart';

import 'order_success/order_success.dart';

class CheckoutController extends GetxController {
  final isLoading = false.obs;
  late final List<CartItem> cartItems;
  final isCod = true.obs;

  late final TextEditingController phoneController;
  late final TextEditingController cityController;
  late final TextEditingController addressController;
  final List<String> proviences = [
    'province 1',
    'Madesh ',
    'Bagmati ',
    'Gandaki',
    'Lumbini',
    'Karnali',
    'Sudurpaschhim',
  ];
  String? selectedProvience;

  Map<String, String>? shippingAddress;
  String? fullAddress;
  //  {
  //   'phone': '',
  //   'province': '',
  //   'city': '',
  //   'address': '',
  // };

  @override
  void onInit() {
    super.onInit();
    cartItems = Get.arguments;
    phoneController = TextEditingController();
    cityController = TextEditingController();
    addressController = TextEditingController();
  }

  void setShippingAddress(Map<String, String> address) {
    shippingAddress = address;
    update();
  }

  Future<void> checkout() async {
    if (shippingAddress == null) {
      Get.snackbar('Empty Shipping Address', 'Please enter shipping address.',
          colorText: Colors.white,
          backgroundColor: Colors.red.withOpacity(0.8));
      return;
    }
    isLoading(true);
    try {
      List<OrderItems> orderItems = List.generate(
          cartItems.length,
          (index) => OrderItems(
                product: cartItems[index].product.id,
                quantity: cartItems[index].quantity,
              ));

      OrderRequest orderRequest = OrderRequest(
        shippingAddress: fullAddress ?? '',
        phoneNumber: shippingAddress!["phone"] ?? '',
        paymentMethod: isCod.isTrue ? 'COD' : 'Khalti',
        paymentStatus: isCod.isFalse,
        orderItems: orderItems,
      );
      var orderResponse = await OrderApi.confirmOrder(orderRequest);
      Get.find<CartController>().clearCart();
      isLoading(false);
      String token = Get.find<AppController>().getToken();
      Get.off(() => OrderSuccess(orderResponse));
    } catch (e) {
      isLoading(false);
      String errorMessage;
      if (e.toString().contains("SocketException")) {
        errorMessage = "No Internet Connection";
      } else {
        errorMessage = 'Unable to process order';
      }
      showSnackbar('Error', errorMessage);
    }
  }

  void showSnackbar(String title, String message) {
    Get.snackbar(
      title,
      message,
      colorText: Colors.white,
      backgroundColor: Colors.red.withOpacity(0.5),
    );
  }

  void updateAddress() {
    String phone = phoneController.text.trim();
    String city = cityController.text.trim();
    String address = addressController.text.trim();

    if (phone.isEmpty) {
      showSnackbar('Invalid Phone Number', 'Please enter valid phone number');
      return;
    }
    if (selectedProvience == null) {
      showSnackbar('Invalid Province', 'Please choose valid province');
      return;
    }
    if (city.isEmpty) {
      showSnackbar('Invalid City', 'Please enter city');
      return;
    }
    if (address.isEmpty) {
      showSnackbar('Invalid Address', 'Please enter address');
      return;
    }
    fullAddress = " $address, $city, $selectedProvience";
    shippingAddress = {
      "phone": phone,
      "city": city,
      "addresss": address,
      "provience": selectedProvience!
    };
    update();
    Get.back();
  }

  Future<void> confirmOrder() async {}
}
