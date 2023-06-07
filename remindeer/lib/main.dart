import 'package:flutter/material.dart';
import 'package:remindeer/src/common/theme/app_theme.dart';
import 'package:remindeer/src/screens/auth.dart';
import 'package:remindeer/src/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  var isLoggedIn = true;

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
      home: isLoggedIn ? const HomePageWidget() : const AuthScreen(),
    );
  }
}
