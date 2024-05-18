import 'package:flutter/material.dart';

class GeometryTheme {
  const GeometryTheme();

  EdgeInsetsGeometry get zero => EdgeInsets.zero;

  EdgeInsetsGeometry customAll(double value) => EdgeInsets.all(value);

  EdgeInsetsGeometry custom({double? top, double? right, double? bottom, double? left}) {
    return EdgeInsets.only(
      top: top ?? 0,
      right: right ?? 0,
      bottom: bottom ?? 0,
      left: left ?? 0,
    );
  }

  EdgeInsetsGeometry get exSmall => const EdgeInsets.all(4);
  EdgeInsetsGeometry get small => const EdgeInsets.all(8);
  EdgeInsetsGeometry get medium => const EdgeInsets.all(16);
  EdgeInsetsGeometry get large => const EdgeInsets.all(24);
  EdgeInsetsGeometry get exLarge => const EdgeInsets.all(32);

  EdgeInsetsGeometry get exSmallX {
    return const EdgeInsets.symmetric(horizontal: 4);
  }

  EdgeInsetsGeometry get smallX {
    return const EdgeInsets.symmetric(horizontal: 8);
  }

  EdgeInsetsGeometry get mediumX {
    return const EdgeInsets.symmetric(horizontal: 16);
  }

  EdgeInsetsGeometry get largeX {
    return const EdgeInsets.symmetric(horizontal: 24);
  }

  EdgeInsetsGeometry get exLargeX {
    return const EdgeInsets.symmetric(horizontal: 32);
  }

  EdgeInsetsGeometry get exSmallY {
    return const EdgeInsets.symmetric(vertical: 4);
  }

  EdgeInsetsGeometry get smallY {
    return const EdgeInsets.symmetric(vertical: 8);
  }

  EdgeInsetsGeometry get mediumY {
    return const EdgeInsets.symmetric(vertical: 16);
  }

  EdgeInsetsGeometry get largeY {
    return const EdgeInsets.symmetric(vertical: 24);
  }

  EdgeInsetsGeometry get exLargeY {
    return const EdgeInsets.symmetric(vertical: 32);
  }

  EdgeInsetsGeometry get exSmallT => const EdgeInsets.only(top: 4);
  EdgeInsetsGeometry get smallT => const EdgeInsets.only(top: 8);
  EdgeInsetsGeometry get mediumT => const EdgeInsets.only(top: 16);
  EdgeInsetsGeometry get largeT => const EdgeInsets.only(top: 24);
  EdgeInsetsGeometry get exLargeT => const EdgeInsets.only(top: 32);

  EdgeInsetsGeometry get exSmallR => const EdgeInsets.only(right: 4);
  EdgeInsetsGeometry get smallR => const EdgeInsets.only(right: 8);
  EdgeInsetsGeometry get mediumR => const EdgeInsets.only(right: 16);
  EdgeInsetsGeometry get largeR => const EdgeInsets.only(right: 24);
  EdgeInsetsGeometry get exLargeR => const EdgeInsets.only(right: 32);

  EdgeInsetsGeometry get exSmallB => const EdgeInsets.only(bottom: 4);
  EdgeInsetsGeometry get smallB => const EdgeInsets.only(bottom: 8);
  EdgeInsetsGeometry get mediumB => const EdgeInsets.only(bottom: 16);
  EdgeInsetsGeometry get largeB => const EdgeInsets.only(bottom: 24);
  EdgeInsetsGeometry get exLargeB => const EdgeInsets.only(bottom: 32);

  EdgeInsetsGeometry get exSmallL => const EdgeInsets.only(left: 4);
  EdgeInsetsGeometry get smallL => const EdgeInsets.only(left: 8);
  EdgeInsetsGeometry get mediumL => const EdgeInsets.only(left: 16);
  EdgeInsetsGeometry get largeL => const EdgeInsets.only(left: 24);
  EdgeInsetsGeometry get exLargeL => const EdgeInsets.only(left: 32);
}
