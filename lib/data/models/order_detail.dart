class OrderDetail {
  int? id;
  late List<Items> items;
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

    this.items = json["items"] == null
        ? []
        : (json["items"] as List).map((e) => Items.fromJson(e)).toList();
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    if (this.items != null)
      data["items"] = this.items.map((e) => e.toJson()).toList();
    data["total"] = this.total;
    data["shipping_address"] = this.shippingAddress;
    data["phone_number"] = this.phoneNumber;
    data["date_ordered"] = this.dateOrdered;
    data["payment_status"] = this.paymentStatus;
    data["payment_method"] = this.paymentMethod;
    data["status"] = this.status;
    data["user"] = this.user;
    return data;
  }
}

class Items {
  Product? product;
  int? quantity;

  Items({this.product, this.quantity});

  Items.fromJson(Map<String, dynamic> json) {
    if (json["product"] is Map)
      this.product =
          json["product"] == null ? null : Product.fromJson(json["product"]);
    if (json["quantity"] is int) this.quantity = json["quantity"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.product != null) data["product"] = this.product!.toJson();
    data["quantity"] = this.quantity;
    return data;
  }
}

class Product {
  int? id;
  String? name;
  String? description;
  String? price;
  String? image;
  String? unit;
  String? category;

  Product(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.image,
      this.unit,
      this.category});

  Product.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) this.id = json["id"];
    if (json["name"] is String) this.name = json["name"];
    if (json["description"] is String) this.description = json["description"];
    if (json["price"] is String) this.price = json["price"];
    if (json["image"] is String) this.image = json["image"];
    if (json["unit"] is String) this.unit = json["unit"];
    if (json["category"] is String) this.category = json["category"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["name"] = this.name;
    data["description"] = this.description;
    data["price"] = this.price;
    data["image"] = this.image;
    data["unit"] = this.unit;
    data["category"] = this.category;
    return data;
  }
}
