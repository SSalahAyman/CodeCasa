import 'package:calculatorapp/theme/default_colors.dart';
import 'package:flutter/material.dart';

class Themes {
  /**
   * Application Dark Theme
   */
  static final darkTheme = ThemeData.dark().copyWith(
    primaryColor: primaryClrDark,
    brightness: Brightness.dark,
  );

  /**
   * Application Light Theme
   */
  static final lightTheme = ThemeData.light().copyWith(
    primaryColor: primaryClrLight,
    brightness: Brightness.light,
  );
}
