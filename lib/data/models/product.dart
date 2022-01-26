class Product {
  int id;
  String name;
  String category;
  String description;
  String image;
  String unit;
  int price;
  Product(
      {required this.category,
      required this.description,
      required this.id,
      required this.image,
      required this.name,
      required this.unit,
      required this.price});
}
