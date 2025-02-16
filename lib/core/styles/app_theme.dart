import 'package:flutter/material.dart';
import 'package:shiftly/core/styles/app_colors.dart';
import 'package:shiftly/core/styles/app_text_theme.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData theme = ThemeData(
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.backgroundColor,
      elevation: 0,
      scrolledUnderElevation: 0,
      titleTextStyle: textTheme.labelLarge,
      centerTitle: true,
    ),
    scaffoldBackgroundColor: AppColors.backgroundColor,
    textTheme: textTheme,
  );
}
