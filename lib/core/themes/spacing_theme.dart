import 'package:flutter/material.dart';

class SpacingTheme {
  const SpacingTheme();

  EdgeInsetsGeometry get space16 => const EdgeInsets.all(16.0);
  EdgeInsetsGeometry get space24 => const EdgeInsets.all(24.0);
  EdgeInsetsGeometry get space32 => const EdgeInsets.all(32.0);

  EdgeInsetsGeometry get spaceX16 {
    return const EdgeInsets.symmetric(
      horizontal: 16.0,
    );
  }

  EdgeInsetsGeometry get spaceX24 {
    return const EdgeInsets.symmetric(
      horizontal: 24.0,
    );
  }

  EdgeInsetsGeometry get spaceX32 {
    return const EdgeInsets.symmetric(
      horizontal: 32.0,
    );
  }

  EdgeInsetsGeometry get spaceY16 {
    return const EdgeInsets.symmetric(
      vertical: 16.0,
    );
  }

  EdgeInsetsGeometry get spaceY24 {
    return const EdgeInsets.symmetric(
      vertical: 24.0,
    );
  }

  EdgeInsetsGeometry get spaceY32 {
    return const EdgeInsets.symmetric(
      vertical: 32.0,
    );
  }

  EdgeInsetsGeometry get spaceT16 => const EdgeInsets.only(top: 16.0);
  EdgeInsetsGeometry get spaceT24 => const EdgeInsets.only(top: 24.0);
  EdgeInsetsGeometry get spaceT32 => const EdgeInsets.only(top: 32.0);

  EdgeInsetsGeometry get spaceR16 => const EdgeInsets.only(right: 16.0);
  EdgeInsetsGeometry get spaceR24 => const EdgeInsets.only(right: 24.0);
  EdgeInsetsGeometry get spaceR32 => const EdgeInsets.only(right: 32.0);

  EdgeInsetsGeometry get spaceB16 => const EdgeInsets.only(bottom: 16.0);
  EdgeInsetsGeometry get spaceB24 => const EdgeInsets.only(bottom: 24.0);
  EdgeInsetsGeometry get spaceB32 => const EdgeInsets.only(bottom: 32.0);

  EdgeInsetsGeometry get spaceL16 => const EdgeInsets.only(left: 16.0);
  EdgeInsetsGeometry get spaceL24 => const EdgeInsets.only(left: 24.0);
  EdgeInsetsGeometry get spaceL32 => const EdgeInsets.only(left: 32.0);
}
