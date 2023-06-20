import 'package:flutter/material.dart';
import 'package:remindeer/src/common/theme/app_theme.dart';
import 'package:remindeer/src/features/auth/auth.dart';
import 'package:remindeer/src/screens/pages/semester/new_semester.dart';

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
  final authProvider = AuthProvider.instance();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Remindeer',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: const NewSemesterPage(),
    );
  }
}
