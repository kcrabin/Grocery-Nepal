class Product {
  late int id;
  late String name;
  late String description;
  late double price;
  late String image;
  late String unit;
  late String category;

  Product(
      {required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.image,
      required this.unit,
      required this.category});

  Product.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) this.id = json["id"];
    if (json["name"] is String) this.name = json["name"];
    if (json["description"] is String) this.description = json["description"];
    if (json["price"] is String) this.price = double.parse(json["price"]);
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
