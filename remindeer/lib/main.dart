import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remindeer/src/common/theme/app_theme.dart';
import 'package:remindeer/src/features/auth/auth.dart';
import 'package:remindeer/src/screens/home.dart';
import 'package:remindeer/src/screens/pages/login/login.dart';

// This widget is the root of your application.
void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AuthProvider.instance(), child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, AuthProvider authProvider, child) {
      return MaterialApp(
        title: 'Remindeer',
        theme: appTheme,
        debugShowCheckedModeBanner: false,
        home: authProvider.isLoggedIn()
            ? const AppHomePage()
            : const AppHomePage(),
      );
    });
  }
}
