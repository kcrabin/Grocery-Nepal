import 'package:grocery_nepal/data/models/product/cart_items.dart';

class Order {
  int id;
  String date;
  String status;
  int total;

  Order(
      {required this.id,
      required this.date,
      required this.status,
      required this.total});
}
