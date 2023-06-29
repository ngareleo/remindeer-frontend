import 'package:flutter/material.dart';
import 'pages/login/login.dart';
import 'pages/signup/personal_details.dart';
import 'pages/signup/phone_verfication.dart';
import 'pages/signup/security.dart';
import 'pages/signup/welcome_page.dart';

class AppAuthPage extends StatelessWidget {
  const AppAuthPage({super.key});

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
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const PersonalDetailsPageWidget(),
        '/phone': (context) => const PhoneVerificationPageWidget(),
        '/security': (context) => const SecurityPage(),
        '/welcome': (context) => const WelcomePageWidget()
      },
    );
  }
}
