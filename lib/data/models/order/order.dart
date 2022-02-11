class Order {
  int? id;
  String? total;
  String? dateOrdered;
  String? status;

  Order({this.id, this.total, this.dateOrdered, this.status});

  Order.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) this.id = json["id"];
    if (json["total"] is String) this.total = json["total"];
    if (json["date_ordered"] is String) this.dateOrdered = json["date_ordered"];
    if (json["status"] is String) this.status = json["status"];
  }
}
