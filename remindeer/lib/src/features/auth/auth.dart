import 'package:dio/dio.dart';
import 'package:remindeer/src/models/user.dart';

enum AuthStatus {
  unknown,
  authenticated,
  unauthenticated,
}

// prefered a Singleton
class AuthProvider {
  static AuthProvider? _instance;
  static User? _loggedInUser;
  late Dio? _dio;

  AuthProvider._() {
    _dio = Dio(BaseOptions(
      baseUrl: "http://localhost:8080/app",
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        "Accept": "application/json",
      },
    ));
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
    final response = await _dio?.post("http://localhost:8080/app/login",
        data: {
          "username": email,
          "password": password,
        },
        options: Options(contentType: Headers.formUrlEncodedContentType));

    if (response?.statusCode != 200) {
      return AuthStatus.unauthenticated;
    }

    final user = User.fromApi(json: response?.data);
    _loggedInUser = user;
    return AuthStatus.authenticated;
  }

  Future<(bool, bool)?> validateUserDetails(
      {required String username, required String email}) async {
    final response =
        await _dio?.get("http://localhost:8080/app/check/user-details",
            data: {
              "username": username,
              "email": email,
            },
            options: Options(contentType: Headers.formUrlEncodedContentType));

    if (response?.statusCode != 200) return null;

    return (
      response?.data['username'] as bool,
      response?.data['email'] as bool,
    );
  }

  Future<bool?> validatePhonenumber(String phonenumber) async {
    final response = await _dio?.get(
      "http://localhost:8080/app/check/phone-number/$phonenumber",
    );

    if (response?.statusCode != 200) return null;

    return response?.data['exists'] as bool;
  }

  Future<void> logout() async {}

  Future<void> register(String email, String password) async {}
}
