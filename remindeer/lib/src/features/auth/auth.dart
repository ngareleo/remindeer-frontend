import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:remindeer/src/models/user.dart';

enum AuthStatus {
  unknown,
  authenticated,
  unauthenticated,
}

class AuthProvider {
  static AuthProvider? _instance;
  static User? _loggedInUser;

  AuthProvider._() {
    _instance = this;
  }

  factory AuthProvider.instance() => _instance ?? AuthProvider._();

  static User get loggedInUser {
    return _loggedInUser!;
  }

  bool isLoggedIn() {
    return _loggedInUser != null;
  }

  Future<AuthStatus> login(String email, String password) async {
    final dio = Dio();
    final response = await dio.post("http://localhost:8080/signin",
        data: {
          "username": email,
          "password": password,
        },
        options: Options(contentType: Headers.formUrlEncodedContentType));

    if (response.statusCode != 200) {
      return AuthStatus.unauthenticated;
    }

    debugPrint(response.data.toString());

    return AuthStatus.authenticated;
  }

  Future<void> logout() async {}

  Future<void> register(String email, String password) async {}

  Future<void> _setUserFromLocal() async {
    var file = await rootBundle.loadString("assets/store/sample_user.json");
    var content = Map.from(jsonDecode(file));
    final user = content.entries.first.value;
    final uid = content.entries.first.key;
    _loggedInUser = User.fromJson(uid: uid, json: user);
  }
}
