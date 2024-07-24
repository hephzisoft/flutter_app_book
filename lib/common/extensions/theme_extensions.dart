import 'package:flutter/material.dart';

extension ThemeContext on BuildContext{

  ThemeData get theme => Theme.of(this);
  Brightness get brightness  => Theme.of(this).colorScheme.brightness;
  Color get primaryColor => Theme.of(this).colorScheme.primary;
}