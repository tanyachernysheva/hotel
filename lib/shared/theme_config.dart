import 'package:flutter/material.dart';

abstract final class ThemeConfig {
  static final ThemeData themeData = ThemeData(
    scaffoldBackgroundColor: const Color.fromRGBO(246, 246, 249, 1),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
    ),
    colorScheme: const ColorScheme.light(
      primary: Color.fromRGBO(13, 114, 255, 1),
    ),
    textTheme: const TextTheme(
      bodySmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Color.fromRGBO(13, 114, 255, 1),
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      bodyLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w500,
      ),
      displaySmall: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
    ),
  );
}
