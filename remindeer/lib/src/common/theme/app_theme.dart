import 'package:flutter/material.dart';

const _primaryColor = Color(0xFF5E5ADB);

final appTheme = ThemeData(
    primaryColor: _primaryColor,
    colorScheme: const ColorScheme.light(
        primary: _primaryColor,
        secondary: Color(0xFFDB5A98),
        tertiary: Color(0xFF2F2E41),
        background: Color(0xFFF0F0F0)),
    useMaterial3: true,
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: const Color(0xFFFCFCFC),
      indicatorColor: _primaryColor,
      iconTheme: MaterialStateProperty.resolveWith(getBottomNavigationColor),
    ),
    textTheme: const TextTheme(
        bodyLarge: TextStyle(
            fontSize: 18, fontWeight: FontWeight.normal, color: Colors.black),
        bodyMedium: TextStyle(
            fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black),
        bodySmall: TextStyle(
            fontSize: 12, fontWeight: FontWeight.normal, color: Colors.black)));

IconThemeData getBottomNavigationColor(Set<MaterialState> states) {
  const Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.selected,
  };
  if (states.any(interactiveStates.contains)) {
    return const IconThemeData(color: Colors.white);
  }
  return const IconThemeData(color: _primaryColor);
}
