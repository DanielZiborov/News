import 'package:flutter/material.dart';

abstract class AppThemes {
  static ThemeData get light {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: Colors.grey,
      ),
      scaffoldBackgroundColor: Colors.white,
      primaryColor: Colors.black,
      splashColor: Colors.transparent,
      fontFamily: 'IBM',
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black),
      useMaterial3: true,
    );
  }
}
