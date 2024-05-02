import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_theme.dart';

class BaseTheme {
  ThemeData get baseTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      textTheme: AppTheme.typography.typography,
      fontFamily: AppTheme.typography.fontPrimary,
      scaffoldBackgroundColor: AppTheme.colors.bgLight,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppTheme.colors.primary,
        primary: AppTheme.colors.primary,
        secondary: AppTheme.colors.secondary,
      ),
      appBarTheme: AppBarTheme(
        toolbarHeight: 45.h,
        elevation: 5.0,
        scrolledUnderElevation: 5.0,
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        foregroundColor: AppTheme.colors.primaryText,
        titleTextStyle: TextStyle(color: AppTheme.colors.primaryText),
        iconTheme: IconThemeData(color: AppTheme.colors.primaryText),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppTheme.colors.primary,
        foregroundColor: Colors.white,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        hoverColor: Colors.white,
        fillColor: Colors.white,
        hintStyle: AppTheme.typography.bodyMediumHint,
        contentPadding: AppTheme.geometry.smallX,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 0.8,
            color: Colors.grey[600]!,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 0.8,
            color: Colors.grey[400]!,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 0.8,
            color: AppTheme.colors.primary,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
