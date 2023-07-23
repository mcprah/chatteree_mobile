// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  final int? id;
  final String? profileImageUrl;
  final String? username;
  final String? email;
  final String? name;
  final bool? onlineStatus;

  User({
    this.id,
    this.profileImageUrl,
    this.username,
    this.email,
    this.name,
    this.onlineStatus,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        profileImageUrl: json["profile_image"],
        username: json["username"],
        email: json["email"],
        name: json["name"],
        onlineStatus: json["online_status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "profile_image": profileImageUrl,
        "username": username,
        "email": email,
        "name": name,
        "online_status": onlineStatus,
      };
}
