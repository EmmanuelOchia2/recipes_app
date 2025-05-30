import 'package:flutter/material.dart';

class AppTheme {
  static final appTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xFFFF6F00),
    scaffoldBackgroundColor: const Color(0xFFFAF3E0),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFFDFDFB),
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black87),
      titleTextStyle: TextStyle(
        color: Colors.black87,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    colorScheme: const ColorScheme.light(
      primary: Color(0xFFFF6F00), // Orange
      secondary: Color(0xFFFFA040), // Lighter orange
      background: Color(0xFFFDFDFB),
      surface: Color(0xFFFFFFFF),
      onPrimary: Colors.white,
      onSecondary: Colors.black87,
      onBackground: Colors.black87,
      onSurface: Colors.black87,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black87),
      bodyMedium: TextStyle(color: Colors.black87),
      labelLarge: TextStyle(color: Colors.black87),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Color(0xFFF5F5F5),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFFF6F00),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        textStyle: const TextStyle(fontSize: 16),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xFFFF6F00),
      foregroundColor: Colors.white,
    ),
  );
}
