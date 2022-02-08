class UserProfile {
  int? id;
  String? email;
  String? name;

  UserProfile({this.id, this.email, this.name});

  UserProfile.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) this.id = json["id"];
    if (json["email"] is String) this.email = json["email"];
    if (json["name"] is String) this.name = json["name"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["email"] = this.email;
    data["name"] = this.name;
    return data;
  }
}
