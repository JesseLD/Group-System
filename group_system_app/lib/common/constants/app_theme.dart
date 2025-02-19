import 'package:flutter/material.dart';
import 'package:group_system_app/common/constants/app_colors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
    ),
    scaffoldBackgroundColor: Colors.white,
    useMaterial3: true,
  );
}
