import 'package:flutter/material.dart';

class User {
  final String id;
  final String username;
  final String email;
  final String name;
  final String? photo;
  final String? phonenumber;
  final DateTime createdAt;
  final DateTime updatedAt;

  User(
      {required this.id,
      required this.name,
      required this.username,
      required this.email,
      this.phonenumber,
      this.photo,
      required this.createdAt,
      required this.updatedAt});

  factory User.fromJson({
    required Map<String, dynamic> json,
  }) {
    final id = json["uid"].toString();
    final name = json["name"].toString();
    final created = json["created_at"].toString();
    final lastModified = json["updated_at"].toString();
    final username = json["username"].toString();
    final email = json["email"].toString();
    final photoUrl = json["photo"].toString();
    final phoneNumber = json["phone_number"].toString();

    return User(
        id: id,
        name: name,
        username: username,
        email: email,
        photo: photoUrl,
        phonenumber: phoneNumber,
        createdAt: DateTime.parse(created),
        updatedAt: DateTime.parse(lastModified));
  }

  factory User.fromApi({required Map<String, dynamic> json}) {
    final id = json["id"].toString();
    final name = json["name"].toString();
    final username = json["username"].toString();
    final email = json["email"].toString();
    final createdAt = json["created_at"].toString();
    final phonenumber = json["phone_number"].toString();
    final lastModified = json["updated_at"].toString();

    return User(
        id: id,
        name: name,
        username: username,
        email: email,
        phonenumber: phonenumber,
        createdAt: DateTime.parse(createdAt),
        updatedAt: DateTime.parse(lastModified));
  }

  dynamic toJson() {
    return {
      "id": id,
      "name": name,
      "username": username,
      "email": email,
      "phone_number": phonenumber,
      "photo": photo,
      "created_at": createdAt.toString(),
      "updated_at": updatedAt.toString(),
    };
  }

  @override
  String toString() {
    return "[User] ${toJson()}";
  }

  Widget toResourceItem(BuildContext context) {
    return const CircleAvatar();
  }
}
