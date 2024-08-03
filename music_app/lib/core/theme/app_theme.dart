import 'package:flutter/material.dart';
import 'package:music_app/core/theme/pallete.dart';

class AppTheme {
  static OutlineInputBorder _border(Color color) => OutlineInputBorder(
        borderSide: BorderSide(
          color: color,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(10),
      );
  static final darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Pallete.backgroundColor,
    bottomAppBarTheme: const BottomAppBarTheme(color: Pallete.backgroundColor),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(27),
      enabledBorder: _border(Pallete.borderColor),
      focusedBorder: _border(Pallete.gradient1),
    ),
  );
}
