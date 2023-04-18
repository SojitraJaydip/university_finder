import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: Color(0xff007AFF),
    appBarTheme: const AppBarTheme(
        color: Colors.white,
        titleTextStyle: TextStyle(
          color: Color(0xff333333),
          fontSize: 22.0,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(
          color: Colors.blue,
        )),
    scaffoldBackgroundColor: Colors.white,
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 22.0,
        fontWeight: FontWeight.bold,
        color: Color(0xff333333),
      ),
      bodyMedium: TextStyle(
        fontSize: 16.0,
        color: Color(0xff333333),
      ),
      titleSmall: TextStyle(
        fontSize: 16.0,
        color: Color(0xff333333),
      ),
      titleMedium: TextStyle(
        fontSize: 18.0,
        color: Color(0xff333333),
      ),
    ),
    iconTheme: const IconThemeData(
      color: Color(0xffFF9500),
    ),
    listTileTheme: const ListTileThemeData(
      tileColor: Colors.white,
      selectedColor: Color(0xff007AFF),
      selectedTileColor: Color(0xff007AFF),
    ),
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
        .copyWith(secondary: const Color(0xffFF9500))
        .copyWith(background: const Color(0xffF7F7F7)),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: const Color(0xff007AFF),
    appBarTheme: AppBarTheme(
      color: Colors.grey[900],
      iconTheme: IconThemeData(
        color: Colors.blue[200],
      ),
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 22.0,
        fontWeight: FontWeight.bold,
      ),
    ),
    iconTheme: const IconThemeData(
      color: Color(0xffFF9500),
    ),
    listTileTheme: const ListTileThemeData(
      tileColor: Color(0xff121212),
      selectedColor: Color(0xff007AFF),
      selectedTileColor: Color(0xff007AFF),
    ),
    scaffoldBackgroundColor: Colors.grey[800],
    textTheme: TextTheme(
      titleLarge: const TextStyle(
        fontSize: 22.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        fontSize: 16.0,
        color: Colors.grey[300],
      ),
      titleSmall: TextStyle(
        fontSize: 16.0,
        color: Colors.grey[300],
      ),
      titleMedium: TextStyle(
        fontSize: 18.0,
        color: Colors.grey[300],
      ),
    ),
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
        .copyWith(secondary: const Color(0xffFF9500))
        .copyWith(background: const Color(0xff121212)),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xFF007AFF),
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xFF007AFF),
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      hintStyle: TextStyle(
        color: Color(0xFF333333),
        fontSize: 16.0,
      ),
    ),
  );
}
