import 'dart:convert';

import 'package:get/get.dart';
import 'package:grocery_nepal/app_controller.dart';
import 'package:grocery_nepal/data/models/product/product.dart';

class FavouriteLocal {
  static String key = 'favouriteLocal';

  static Future<List<Product>> get() async {
    var prefs = Get.find<AppController>().sharedPreferences;
    var valueString = prefs.getString(key);
    try {
      if (valueString == null || valueString == '') {
        return [];
      }
      var data = json.decode(valueString);
      final products = data as List;
      return products.map((product) => Product.fromJson(product)).toList();
    } catch (e) {
      print(e);
      return [];
    }
  }

  static Future<bool> set(List<Product> favourites) async {
    var data = favourites.map((product) => product.toJson()).toList();
    var valueString = json.encode(data);
    try {
      var prefs = Get.find<AppController>().sharedPreferences;
      return await prefs.setString(key, valueString);
    } catch (e) {
      print(e);
      return false;
    }
  }
}
