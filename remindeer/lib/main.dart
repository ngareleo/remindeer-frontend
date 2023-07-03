import 'package:flutter/material.dart';
import 'package:remindeer/src/common/theme/app_theme.dart';
import 'package:remindeer/src/features/auth/auth.dart';
import 'package:remindeer/src/screens/home.dart';
import 'package:remindeer/src/screens/pages/login/login.dart';

// This widget is the root of your application.

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  final _authProvider = AuthProvider.instance();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Remindeer',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home:
          _authProvider.isLoggedIn() ? const AppHomePage() : const LoginPage(),
    );
  }
}
