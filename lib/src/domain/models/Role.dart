class Role {
  String id;
  String name;
  String image;
  String route;
  DateTime createdAt;
  DateTime updateAt;

  Role({
    required this.id,
    required this.name,
    required this.image,
    required this.route,
    required this.createdAt,
    required this.updateAt,
  });

  factory Role.fromJson(Map<String, dynamic> json) => Role(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    route: json["route"],
    createdAt: DateTime.parse(json["created_at"]),
    updateAt: DateTime.parse(json["update_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "route": route,
    "created_at": createdAt.toIso8601String(),
    "update_at": updateAt.toIso8601String(),
  };
}
