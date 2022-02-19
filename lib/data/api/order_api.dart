import 'dart:convert';

import 'package:get/get.dart';
import 'package:grocery_nepal/app_controller.dart';
import 'package:grocery_nepal/constants.dart';
import 'package:grocery_nepal/data/models/order/order.dart';
import 'package:grocery_nepal/data/models/order/order_details.dart';
import 'package:grocery_nepal/data/models/order/order_request.dart';

import 'package:http/http.dart' as http;

class OrderApi {
  static Future<List<Order>> getOrders(String token) async {
    final url = baseUrl + "orders/history/";
    final response = await http.get(Uri.parse(url), headers: {
      "Authorization": "Bearer $token",
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print(data);
      final orders = data as List;
      return orders.map((order) => Order.fromJson(order)).toList();
    } else {
      throw Exception('Failed to load orders');
    }
  }

  static Future<OrderDetail> getOrderDetail(int id) async {
    final url = baseUrl + "orders/$id/";
    String? token = Get.find<AppController>().getToken();
    final response = await http.get(Uri.parse(url), headers: {
      "Authorization": "Bearer $token",
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print(data);
      return OrderDetail.fromJson(data);
    } else {
      throw Exception('Failed to load orders');
    }
  }

  static Future<OrderDetail> confirmOrder(OrderRequest orderRequest) async {
    final url = baseUrl + "orders/confirm/";
    String token = Get.find<AppController>().getToken();
    final request = jsonEncode(orderRequest.toJson());
    final response = await http.post(
      Uri.parse(url),
      body: request,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        "Authorization": "Bearer $token",
      },
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return OrderDetail.fromJson(data);
    } else {
      print(response.body);
      throw Exception("Something went wrong");
    }
  }
}
