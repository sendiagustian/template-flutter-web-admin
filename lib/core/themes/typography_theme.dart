import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TypographyTheme {
  final bool isDesktop;

  const TypographyTheme(this.isDesktop);

  String get fontPrimary => 'Inter';
  String get fontSecondary => 'Gothic';

  TextStyle get displayLarge {
    return TextStyle(
      fontSize: isDesktop ? 10.sp : 20.sp,
      fontWeight: FontWeight.w300,
      color: Colors.black,
    );
  }

  TextStyle get displayMedium {
    return TextStyle(
      fontSize: isDesktop ? 9.sp : 18.sp,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    );
  }

  TextStyle get displaySmall {
    return TextStyle(
      fontSize: isDesktop ? 8.sp : 16.sp,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    );
  }

  TextStyle get headlineMedium {
    return TextStyle(
      fontSize: isDesktop ? 7.5.sp : 15.sp,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    );
  }

  TextStyle get headlineSmall {
    return TextStyle(
      fontSize: isDesktop ? 7.sp : 14.sp,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    );
  }

  TextStyle get titleLarge {
    return TextStyle(
      fontSize: isDesktop ? 6.sp : 14.sp,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    );
  }

  TextStyle get titleMedium {
    return TextStyle(
      fontSize: isDesktop ? 5.5.sp : 13.5.sp,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    );
  }

  TextStyle get titleSmall {
    return TextStyle(
      fontSize: isDesktop ? 5.sp : 13.sp,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    );
  }

  TextStyle get bodyLarge {
    return TextStyle(
      fontSize: isDesktop ? 4.5.sp : 13.sp,
      fontWeight: FontWeight.w400,
      color: const Color(0xFF333333),
    );
  }

  TextStyle get bodyMedium {
    return TextStyle(
      fontSize: isDesktop ? 4.sp : 12.sp,
      fontWeight: FontWeight.w400,
      color: const Color(0xFF333333),
    );
  }

  TextStyle get bodySmall {
    return TextStyle(
      fontSize: isDesktop ? 3.5.sp : 11.sp,
      fontWeight: FontWeight.w400,
      color: const Color(0xFF333333),
    );
  }

  TextStyle get labelLarge {
    return TextStyle(
      fontSize: isDesktop ? 3.2.sp : 10.sp,
      fontWeight: FontWeight.w500,
      color: const Color(0xFF333333),
    );
  }

  TextStyle get labelMedium {
    return TextStyle(
      fontSize: isDesktop ? 3.sp : 9.sp,
      fontWeight: FontWeight.w400,
      color: const Color(0xFF333333),
    );
  }

  TextStyle get labelSmall {
    return TextStyle(
      fontSize: isDesktop ? 2.5.sp : 8.sp,
      fontWeight: FontWeight.w400,
      color: const Color(0xFF333333),
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
