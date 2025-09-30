import 'package:ecommerce_flutter/src/domain/models/Role.dart';

class User {
  int id;
  String name;
  String lastName;
  String email;
  String phone;
  dynamic image;
  dynamic notificationToken;
  DateTime createdAt;
  DateTime updateAt;
  List<Role> roles;

  User({
    required this.id,
    required this.name,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.image,
    required this.notificationToken,
    required this.createdAt,
    required this.updateAt,
    required this.roles,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    lastName: json["lastName"],
    email: json["email"],
    phone: json["phone"],
    image: json["image"],
    notificationToken: json["notificationToken"],
    createdAt: DateTime.parse(json["created_at"]),
    updateAt: DateTime.parse(json["update_at"]),
    roles: List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "lastName": lastName,
    "email": email,
    "phone": phone,
    "image": image,
    "notificationToken": notificationToken,
    "created_at": createdAt.toIso8601String(),
    "update_at": updateAt.toIso8601String(),
    "roles": List<dynamic>.from(roles.map((x) => x.toJson())),
  };
}
