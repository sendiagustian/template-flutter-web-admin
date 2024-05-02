import 'package:flutter/material.dart';

import 'app_theme.dart';

class TypographyTheme {
  const TypographyTheme();

  String get fontPrimary => 'Inter';
  String get fontSecondary => 'Gothic';

  TextStyle get displayLarge {
    return const TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.w300,
      color: Colors.black,
    );
  }

  TextStyle get displayMedium {
    return const TextStyle(
      fontSize: 23,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    );
  }

  TextStyle get displaySmall {
    return const TextStyle(
      fontSize: 21,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    );
  }

  TextStyle get headlineMedium {
    return const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    );
  }

  TextStyle get headlineSmall {
    return const TextStyle(
      fontSize: 19,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    );
  }

  TextStyle get titleLarge {
    return const TextStyle(
      fontSize: 19,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    );
  }

  TextStyle get titleMedium {
    return const TextStyle(
      fontSize: 18.5,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    );
  }

  TextStyle get titleSmall {
    return const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    );
  }

  TextStyle get bodyLarge {
    return TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: AppTheme.colors.primaryText,
    );
  }

  TextStyle get bodyLargeHint {
    return TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: AppTheme.colors.secondaryText,
    );
  }

  TextStyle get bodyMedium {
    return TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w400,
      color: AppTheme.colors.primaryText,
    );
  }

  TextStyle get bodyMediumHint {
    return TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w400,
      color: AppTheme.colors.secondaryText,
    );
  }

  TextStyle get bodySmall {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppTheme.colors.primaryText,
    );
  }

  TextStyle get bodySmallHint {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppTheme.colors.secondaryText,
    );
  }

  TextStyle get labelLarge {
    return TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      color: AppTheme.colors.primaryText,
    );
  }

  TextStyle get labelMedium {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppTheme.colors.primaryText,
    );
  }

  TextStyle get labelSmall {
    return TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w400,
      color: AppTheme.colors.primaryText,
    );
  }

  TextTheme get typography {
    return TextTheme(
      displayLarge: displayLarge,
      displayMedium: displayMedium,
      displaySmall: displaySmall,
      headlineMedium: headlineMedium,
      headlineSmall: headlineSmall,
      titleLarge: titleLarge,
      bodyLarge: bodyLarge,
      bodyMedium: bodyMedium,
      bodySmall: bodySmall,
      labelLarge: labelLarge,
      labelMedium: labelMedium,
      labelSmall: labelSmall,
    );
  }
}
