import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GeometryTheme {
  const GeometryTheme();

  EdgeInsetsGeometry custom({double? top, double? right, double? bottom, double? left}) {
    return EdgeInsets.only(
      top: top?.r ?? 0,
      right: right?.r ?? 0,
      bottom: bottom?.r ?? 0,
      left: left?.r ?? 0,
    );
  }

  EdgeInsetsGeometry get exSmall => EdgeInsets.all(4.r);
  EdgeInsetsGeometry get small => EdgeInsets.all(8.r);
  EdgeInsetsGeometry get medium => EdgeInsets.all(16.r);
  EdgeInsetsGeometry get large => EdgeInsets.all(24.r);
  EdgeInsetsGeometry get exLarge => EdgeInsets.all(32.r);

  EdgeInsetsGeometry get exSmallX {
    return EdgeInsets.symmetric(horizontal: 4.r);
  }

  EdgeInsetsGeometry get smallX {
    return EdgeInsets.symmetric(horizontal: 8.r);
  }

  EdgeInsetsGeometry get mediumX {
    return EdgeInsets.symmetric(horizontal: 16.r);
  }

  EdgeInsetsGeometry get largeX {
    return EdgeInsets.symmetric(horizontal: 24.r);
  }

  EdgeInsetsGeometry get exLargeX {
    return EdgeInsets.symmetric(horizontal: 32.r);
  }

  EdgeInsetsGeometry get exSmallY {
    return EdgeInsets.symmetric(vertical: 4.r);
  }

  EdgeInsetsGeometry get smallY {
    return EdgeInsets.symmetric(vertical: 8.r);
  }

  EdgeInsetsGeometry get mediumY {
    return EdgeInsets.symmetric(vertical: 16.r);
  }

  EdgeInsetsGeometry get largeY {
    return EdgeInsets.symmetric(vertical: 24.r);
  }

  EdgeInsetsGeometry get exLargeY {
    return EdgeInsets.symmetric(vertical: 32.r);
  }

  EdgeInsetsGeometry get exSmallT => EdgeInsets.only(top: 4.r);
  EdgeInsetsGeometry get smallT => EdgeInsets.only(top: 8.r);
  EdgeInsetsGeometry get mediumT => EdgeInsets.only(top: 16.r);
  EdgeInsetsGeometry get largeT => EdgeInsets.only(top: 24.r);
  EdgeInsetsGeometry get exLargeT => EdgeInsets.only(top: 32.r);

  EdgeInsetsGeometry get exSmallR => EdgeInsets.only(right: 4.r);
  EdgeInsetsGeometry get smallR => EdgeInsets.only(right: 8.r);
  EdgeInsetsGeometry get mediumR => EdgeInsets.only(right: 16.r);
  EdgeInsetsGeometry get largeR => EdgeInsets.only(right: 24.r);
  EdgeInsetsGeometry get exLargeR => EdgeInsets.only(right: 32.r);

  EdgeInsetsGeometry get exSmallB => EdgeInsets.only(bottom: 4.r);
  EdgeInsetsGeometry get smallB => EdgeInsets.only(bottom: 8.r);
  EdgeInsetsGeometry get mediumB => EdgeInsets.only(bottom: 16.r);
  EdgeInsetsGeometry get largeB => EdgeInsets.only(bottom: 24.r);
  EdgeInsetsGeometry get exLargeB => EdgeInsets.only(bottom: 32.r);

  EdgeInsetsGeometry get exSmallL => EdgeInsets.only(left: 4.r);
  EdgeInsetsGeometry get smallL => EdgeInsets.only(left: 8.r);
  EdgeInsetsGeometry get mediumL => EdgeInsets.only(left: 16.r);
  EdgeInsetsGeometry get largeL => EdgeInsets.only(left: 24.r);
  EdgeInsetsGeometry get exLargeL => EdgeInsets.only(left: 32.r);
}
