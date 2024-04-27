import 'package:dashboard/core/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BaseTheme {
  final bool isDesktop;
  const BaseTheme(this.isDesktop);

  ThemeData get baseTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      textTheme: AppTheme(isDesktop).typography.typography,
      fontFamily: AppTheme(isDesktop).typography.fontPrimary,
      scaffoldBackgroundColor: AppTheme.colors.scaffoldBackgroundColor,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppTheme.colors.primaryColor,
        primary: AppTheme.colors.primaryColor,
        secondary: AppTheme.colors.secondaryColor,
      ),
      appBarTheme: AppBarTheme(
        toolbarHeight: 40.h,
        elevation: 1.0,
        foregroundColor: Colors.white,
        backgroundColor: AppTheme.colors.primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: const TextStyle(color: Colors.white),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppTheme.colors.primaryColor,
        foregroundColor: Colors.white,
      ),
    );
  }
}
