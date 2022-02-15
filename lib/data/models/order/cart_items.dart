import 'package:grocery_nepal/data/models/product/product.dart';

class CartItem {
  late Product product;
  late int quantity;

  CartItem(this.product, this.quantity);

  CartItem.fromJson(Map<String, dynamic> json) {
    if (json["product"] is Map)
      this.product = json["product"] == null
          ? Product(
              id: 1,
              name: 'NA',
              description: 'asasa',
              price: 100,
              image: '',
              unit: '',
              category: '')
          : Product.fromJson(json["product"]);
    if (json["quantity"] is int) this.quantity = json["quantity"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.product != null) data["product"] = this.product.toJson();
    data["quantity"] = this.quantity;
    return data;
  }
}
