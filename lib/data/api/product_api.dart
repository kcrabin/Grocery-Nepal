import 'dart:convert';

import 'package:grocery_nepal/constants.dart';
import 'package:grocery_nepal/data/models/product.dart';
import 'package:http/http.dart' as http;

class ProductApi {
  static Future<List<Product>> getProducts() async {
    final url = baseUrl + "products/";
    final response = await http.get(Uri.parse(url));
    print(response.statusCode);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print(data);

      final products = data as List;
      return products.map((product) => Product.fromJson(product)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
