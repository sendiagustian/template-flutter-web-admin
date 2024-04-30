import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BorderRaduiusTheme {
  const BorderRaduiusTheme();

  BorderRadius get small => BorderRadius.circular(4.r);
  BorderRadius get medium => BorderRadius.circular(8.r);
  BorderRadius get large => BorderRadius.circular(12.r);
  BorderRadius get xLarge => BorderRadius.circular(16.r);

  BorderRadius customAll(double value) => BorderRadius.circular(value.r);
  BorderRadius customOnly({
    double? topLeft,
    double? topRight,
    double? bottomLeft,
    double? bottomRight,
  }) {
    return BorderRadius.only(
      topLeft: topLeft != null
          ? Radius.circular(
              topLeft.r,
            )
          : Radius.zero,
      topRight: topRight != null
          ? Radius.circular(
              topRight.r,
            )
          : Radius.zero,
      bottomLeft: bottomLeft != null
          ? Radius.circular(
              bottomLeft.r,
            )
          : Radius.zero,
      bottomRight: bottomRight != null
          ? Radius.circular(
              bottomRight.r,
            )
          : Radius.zero,
    );
  }
}
