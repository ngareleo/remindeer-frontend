import 'package:flutter/material.dart';
import 'package:remindeer/src/screens/auth.dart';
import 'package:remindeer/src/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  var isLoggedIn = true;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Remindeer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: const Color(0xFF5E5ADB),
          colorScheme: const ColorScheme.light(
              primary: Color(0xFF5E5ADB),
              secondary: Color(0xFFDB5A98),
              tertiary: Color(0xFF2F2E41),
              background: Color(0xFFF0F0F0)),
          useMaterial3: true,
          navigationBarTheme: const NavigationBarThemeData(
            backgroundColor: Color(0xFFFCFCFC),
            indicatorColor: Color(0xFF5E5ADB),
          ),
          textTheme: const TextTheme(
              bodyMedium: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.black),
              bodySmall: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: Colors.black))),
      home: isLoggedIn ? const HomePageWidget() : const AuthScreen(),
    );
  }
}
