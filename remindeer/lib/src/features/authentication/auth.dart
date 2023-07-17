import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:remindeer/src/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AuthStatus {
  unknown,
  authenticated,
  unauthenticated,
}

// prefered a Singleton
class AuthProvider extends ChangeNotifier {
  static AuthProvider? _instance;
  static User? _loggedInUser;
  late Dio? _dio;

  AuthProvider._() {
    _getUserDetailsFromPersist();
    _dio = Dio(BaseOptions(
      baseUrl: "http://localhost:3000",
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        "Accept": "application/json",
      },
    ));
    _instance = this;
  }

  factory AuthProvider.instance() => _instance ?? AuthProvider._();

  static User? get loggedInUser {
    return _loggedInUser;
  }

  bool isLoggedIn() {
    return _loggedInUser != null;
  }

  Future<AuthStatus> login(String username, String password) async {
    final response = await _dio?.post(
      "/app/auth/login",
      data: {
        "username": username,
        "password": password,
      },
    );

    if (response?.statusCode != 200) {
      return AuthStatus.unauthenticated;
    }

    final user = User.fromApi(json: response?.data);
    _loggedInUser = user;
    await _writeUserDetailsToPersist(user);
    notifyListeners();
    return AuthStatus.authenticated;
  }

  Future<(bool, bool)?> validateUserDetails(
      {required String username, required String email}) async {
    final response = await _dio?.get(
      "/app/check/user-details",
      data: {
        "username": username,
        "email": email,
      },
    );

    if (response?.statusCode != 200) return null;

    return (
      response?.data['username'] as bool,
      response?.data['email'] as bool,
    );
  }

  Future<bool?> validatePhonenumber(String phonenumber) async {
    final response = await _dio?.get(
      "/app/check/phone-number/$phonenumber",
    );

    if (response?.statusCode != 200) return null;

    return response?.data['exists'] as bool;
  }

  Future<void> logout() async {
    _loggedInUser = null;
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("user");
    notifyListeners();
  }

  Future<User?> createNewUserAccount(
      {required String email,
      required String name,
      required String username,
      required String phonenumber,
      required String password}) async {
    final response = await _dio?.post(
      "/api/user",
      data: {
        "email": email,
        "name": name,
        "username": username,
        "phone_number": phonenumber,
        "password": password,
      },
    );

    if (response?.statusCode != 200) return null;
    var user = User.fromApi(json: response?.data);
    _loggedInUser = user;
    await _writeUserDetailsToPersist(user);
    notifyListeners();
    return user;
  }

  void _getUserDetailsFromPersist() async {
    final prefs = await SharedPreferences.getInstance();
    final claims = prefs.getString("user");
    if (claims != null) {
      _loggedInUser = User.fromJson(json: jsonDecode(claims));
      notifyListeners();
    }
  }

  Future<void> _writeUserDetailsToPersist(User user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("user", jsonEncode(user.toJson()));
  }
}
