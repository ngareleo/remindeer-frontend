import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:remindeer/src/models/user.dart';

class AuthProvider {
  static AuthProvider? _instance;
  static User? _loggedInUser;

  AuthProvider._() {
    if (_instance != null) {
      throw Exception("AuthProvider is already initialized");
    }
    _setUserFromLocal();
    _instance = this;
  }

  factory AuthProvider.instance() => _instance ?? AuthProvider._();

  static User get loggedInUser {
    if (_loggedInUser == null) {
      throw Exception("User is not logged in");
    }
    return _loggedInUser!;
  }

  bool isLoggedIn() {
    return _loggedInUser != null;
  }

  Future<void> login(String email, String password) async {}

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
