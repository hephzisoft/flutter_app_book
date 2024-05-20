import 'package:flutter/material.dart';

import './colors.dart';
import 'typography.dart';

class AppTheme {
  static var lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      brightness: Brightness.light,
    ),
    fontFamily: 'Inter',
    textTheme: AppTextTheme.textTheme,
  );
  static var darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      brightness: Brightness.dark,
    ),
    fontFamily: 'Inter',
    textTheme: AppTextTheme.textTheme,
  );
}
