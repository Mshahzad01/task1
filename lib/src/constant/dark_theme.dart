import 'package:flutter/material.dart';

class DarkTheme {
  static ThemeData get theme {
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      iconTheme: const IconThemeData(color: Colors.white),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.white),
        bodyMedium: TextStyle(color: Colors.white70),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.white12,
        foregroundColor: Colors.white,
      ),
    );
  }
}
