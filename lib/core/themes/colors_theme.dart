import 'package:flutter/material.dart';

class ColorsTheme {
  const ColorsTheme();

  Color get primary => const Color(0xFF6078EA);
  Color get secondary => const Color(0xFF8C9EFF);
  Color get accent => const Color(0xFF00BCD4);
  Color get tertiary => const Color(0xFF0B8FEF);

  Color get white => const Color(0xFFFEFEFE);
  Color get grey => const Color(0xFFACACAC);
  Color get red => const Color(0xFFEF476F);
  Color get yellow => const Color(0xFFFFD166);

  Color get bgDark => const Color(0xFF1C2434);
  Color get bgLight => const Color(0xFFF2F6FC);

  Color get divider => const Color(0xFFBDBDBD);

  Color get textPrimary => const Color(0xFF212121);
  Color get textSecondary => const Color(0xFF757575);

  LinearGradient get gradientPrimary {
    return LinearGradient(
      stops: const [0.0, 1.0],
      begin: const FractionalOffset(0.0, 0.0),
      end: const FractionalOffset(1, 0.0),
      colors: [accent, primary],
      tileMode: TileMode.clamp,
    );
  }

  LinearGradient get gradientBgScreen {
    return LinearGradient(
      colors: [
        primary.withOpacity(0.45),
        bgLight,
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: const [0, 0.6],
    );
  }

  LinearGradient get gradientBgAvatar {
    return LinearGradient(
      colors: [
        primary.withOpacity(0.45),
        Colors.grey[200]!,
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: const [0, 0.9],
    );
  }

  LinearGradient get gradientGrey {
    return const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Colors.transparent,
        Colors.black12,
      ],
    );
  }
}
