import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_theme.dart';
import 'typography_theme.dart';

class BaseTheme {
  TypographyTheme typography = const TypographyTheme(isDesktop: true);

  ThemeData get baseTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      textTheme: typography.typography,
      fontFamily: typography.fontPrimary,
      scaffoldBackgroundColor: AppTheme.colors.scaffoldBackground,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppTheme.colors.primary,
        primary: AppTheme.colors.primary,
        secondary: AppTheme.colors.secondary,
      ),
      appBarTheme: AppBarTheme(
        toolbarHeight: 40.h,
        elevation: 1.0,
        foregroundColor: Colors.white,
        backgroundColor: AppTheme.colors.primary,
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: const TextStyle(color: Colors.white),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppTheme.colors.primary,
        foregroundColor: Colors.white,
      ),
    );
  }
}
