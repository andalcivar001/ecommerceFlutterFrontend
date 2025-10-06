import 'package:ecommerce_flutter/src/domain/models/Role.dart';

class User {
  int? id;
  String name;
  String lastName;
  String email;
  String phone;
  String? password;
  String? image;
  String? notificationToken;
  List<Role>? roles;

  User({
    this.id,
    required this.name,
    required this.lastName,
    required this.email,
    required this.phone,
    this.password,
    this.image,
    this.notificationToken,
    this.roles,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"] ?? 0,
    name: json["name"],
    lastName: json["lastName"],
    email: json["email"],
    phone: json["phone"],
    password: json["password"] ?? '',
    image: json["image"] ?? '',
    notificationToken: json["notificationToken"] ?? '',
    roles:
        json["roles"] != null
            ? List<Role>.from(json["roles"].map((x) => Role.fromJson(x)))
            : [],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "lastName": lastName,
    "email": email,
    "phone": phone,
    "password": password,
    "image": image,
    "notificationToken": notificationToken,
    "roles":
        roles != null ? List<dynamic>.from(roles!.map((x) => x.toJson())) : [],
  };
}
