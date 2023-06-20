import 'package:flutter/material.dart';
import 'package:remindeer/src/models/resource.dart';

class User extends Resource {
  final String username;
  final String email;
  final String name;
  final String? photoUrl;

  User(
      {required String uid,
      required this.name,
      required this.username,
      required this.email,
      this.photoUrl,
      required DateTime created,
      required DateTime lastModified})
      : super(uid: uid, created: created, lastModified: lastModified);

  factory User.fromJson({
    required String uid,
    required Map<String, dynamic> json,
  }) {
    var name = json["name"].toString();
    var created = json["created"].toString();
    var lastModified = json["last_modified"].toString();
    var username = json["username"].toString();
    var email = json["email"].toString();
    var photoUrl = json["photo_url"].toString();

    return User(
        uid: uid,
        name: name,
        username: username,
        email: email,
        photoUrl: photoUrl,
        created: DateTime.parse(created),
        lastModified: DateTime.parse(lastModified));
  }

  dynamic toJson() {
    return {
      uid: {
        "username": username,
        "email": email,
        "photo_url": photoUrl,
        "created": created.toString(),
        "last_modified": lastModified.toString(),
      }
    };
  }

  @override
  String toString() {
    return "[User] ${toJson()}";
  }

  @override
  Widget toResourceItem(BuildContext context) {
    return const CircleAvatar();
  }
}
