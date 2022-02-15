import 'dart:convert';

import 'package:get/get.dart';
import 'package:grocery_nepal/app_controller.dart';
import 'package:grocery_nepal/constants.dart';
import 'package:grocery_nepal/data/models/order/order.dart';
import 'package:grocery_nepal/data/models/order/order_details.dart';

import 'package:http/http.dart' as http;

class OrderApi {
  static Future<List<Order>> getOrders(String token) async {
    final url = baseUrl + "orders/history/";

    final response = await http
        .get(Uri.parse(url), headers: {"Authorization": "Bearer $token"});
    print(response.statusCode);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print(data);

      final products = data as List;
      return products.map((product) => Order.fromJson(product)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  static Future<OrderDetail> getOrderDetail(int id) async {
    final url = baseUrl + "orders/$id/";
    String? token = Get.find<AppController>().getToken();

    final response = await http
        .get(Uri.parse(url), headers: {"Authorization": "Bearer $token"});
    print(response.statusCode);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print(data);

      return OrderDetail.fromJson(data);
    } else {
      throw Exception('Failed to load products');
    }
  }
}
