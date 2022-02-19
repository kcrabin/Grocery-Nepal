import 'package:esewa_pnp/esewa.dart';
import 'package:esewa_pnp/esewa_pnp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_nepal/app_controller.dart';
import 'package:grocery_nepal/data/api/order_api.dart';
import 'package:grocery_nepal/data/models/order/cart_items.dart';
import 'package:grocery_nepal/data/models/order/order_request.dart';
import 'package:grocery_nepal/modules/cart_tab/cart_controller.dart';

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

  late final ESewaConfiguration _configuration;
  late final ESewaPnp _eSewaPnp;
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

    _configuration = ESewaConfiguration(
        clientID: "JB0BBQ4aD0UqIThFJwAKBgAXEUkEGQUBBAwdOgABHD4DChwUAB0R",
        secretKey: "BhwIWQQADhIYSxILExMcAgFXFhcOBwAKBgAXEQ==",
        environment: ESewaConfiguration.ENVIRONMENT_TEST);
    _eSewaPnp = ESewaPnp(configuration: _configuration);
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
        paymentMethod: isCod.isTrue ? 'COD' : 'eSewa',
        paymentStatus: isCod.isFalse,
        orderItems: orderItems,
      );
      if (isCod.isFalse) {
        await esewaPayment();
      }
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
        errorMessage = e.toString();
      }
      showSnackbar('Error', errorMessage);
    }
  }

  Future<void> esewaPayment() async {
    ESewaPayment _payment = ESewaPayment(
        amount: 500,
        productName: "Grocery Nepal",
        productID: "<123",
        callBackURL: "");
    try {
      final _res = await _eSewaPnp.initPayment(payment: _payment);
      Get.snackbar(
        'Success',
        _res.message ?? 'Payment Successful',
      );
    } on ESewaPaymentException catch (e) {
      throw Exception(e.message);
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
