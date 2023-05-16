import 'package:flutter/material.dart';
import 'package:remindeer/pages/home/home.dart';
import 'package:remindeer/pages/login/login.dart';
import 'package:remindeer/pages/signup/personal_details.dart';
import 'package:remindeer/pages/signup/phone_verfication.dart';
import 'package:remindeer/pages/signup/security.dart';
import 'package:remindeer/pages/signup/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
              tertiary: Color(0xFF2F2E41)),
          useMaterial3: true,
          textTheme: const TextTheme(
              bodyMedium: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.black),
              bodySmall: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: Colors.black))),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePageWidget(),
        '/signin': (context) => const LoginPageWidget(),
        '/signup': (context) => const PersonalDetailsPageWidget(),
        '/phone': (context) => const PhoneVerificationPageWidget(),
        '/security': (context) => const SecurityPageWidget(),
        '/welcome': (context) => const WelcomePageWidget()
      },
    );
  }
}
