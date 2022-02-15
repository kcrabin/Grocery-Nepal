import 'cart_items.dart';

class OrderDetail {
  int? id;
  late List<CartItem> items;
  String? total;
  String? shippingAddress;
  String? phoneNumber;
  String? dateOrdered;
  bool? paymentStatus;
  String? paymentMethod;
  String? status;
  int? user;

  OrderDetail(
      {this.id,
      required this.items,
      this.total,
      this.shippingAddress,
      this.phoneNumber,
      this.dateOrdered,
      this.paymentStatus,
      this.paymentMethod,
      this.status,
      this.user});

  OrderDetail.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) this.id = json["id"];
    if (json["items"] is List)
      this.items = json["items"] == null
          ? []
          : (json["items"] as List).map((e) => CartItem.fromJson(e)).toList();
    if (json["total"] is String) this.total = json["total"];
    if (json["shipping_address"] is String)
      this.shippingAddress = json["shipping_address"];
    if (json["phone_number"] is String) this.phoneNumber = json["phone_number"];
    if (json["date_ordered"] is String) this.dateOrdered = json["date_ordered"];
    if (json["payment_status"] is bool)
      this.paymentStatus = json["payment_status"];
    if (json["payment_method"] is String)
      this.paymentMethod = json["payment_method"];
    if (json["status"] is String) this.status = json["status"];
    if (json["user"] is int) this.user = json["user"];
  }
}
