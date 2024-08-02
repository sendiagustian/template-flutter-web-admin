import 'package:flutter/material.dart';

import 'app_theme.dart';

class BaseTheme {
  ThemeData get baseTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      textTheme: AppTheme.typography.typography,
      fontFamily: AppTheme.typography.fontPrimary,
      scaffoldBackgroundColor: AppTheme.colors.bgLight,
      iconTheme: const IconThemeData(color: Colors.white),
      buttonTheme: const ButtonThemeData(alignedDropdown: true),
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppTheme.colors.primary,
        primary: AppTheme.colors.primary,
        secondary: AppTheme.colors.secondary,
      ),
      appBarTheme: AppBarTheme(
        toolbarHeight: 70,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
        titleTextStyle: TextStyle(color: AppTheme.colors.textPrimary),
        iconTheme: const IconThemeData(color: Colors.white, grade: 2),
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
          borderRadius: AppTheme.radius.exSmall,
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 0.8,
            color: Colors.grey[400]!,
          ),
          borderRadius: AppTheme.radius.exSmall,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 0.8,
            color: AppTheme.colors.primary,
          ),
          borderRadius: AppTheme.radius.exSmall,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 0.8,
            color: AppTheme.colors.red,
          ),
          borderRadius: AppTheme.radius.exSmall,
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 0.8,
            color: AppTheme.colors.red,
          ),
          borderRadius: AppTheme.radius.exSmall,
        ),
      ),
    );
  }
}
