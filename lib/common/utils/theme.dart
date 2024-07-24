import 'package:flutter/material.dart';

import './colors.dart';
import 'text_theme.dart';

class AppTheme {
  static var lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      brightness: Brightness.light,
    ),
    textTheme: AppTextTheme.lightTextTheme,
    fontFamily: 'Inter',
  );
  static var darkTheme = ThemeData(
    colorScheme: const ColorScheme.dark(
      primary: darkPrimaryColor,
    ),
    fontFamily: 'Inter',
    textTheme: AppTextTheme.darkTextTheme,
  );
}
