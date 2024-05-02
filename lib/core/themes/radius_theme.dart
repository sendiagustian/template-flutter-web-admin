import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RadiusTheme {
  const RadiusTheme();

  BorderRadius custom({double? topLeft, double? topRight, double? bottomRight, double? bottomLeft}) {
    return BorderRadius.only(
      topLeft: Radius.circular(topLeft?.r ?? 0),
      topRight: Radius.circular(topRight?.r ?? 0),
      bottomRight: Radius.circular(bottomRight?.r ?? 0),
      bottomLeft: Radius.circular(bottomLeft?.r ?? 0),
    );
  }

  BorderRadius get exSmall => BorderRadius.circular(4.r);
  BorderRadius get small => BorderRadius.circular(8.r);
  BorderRadius get medium => BorderRadius.circular(16.r);
  BorderRadius get large => BorderRadius.circular(24.r);
  BorderRadius get exLarge => BorderRadius.circular(32.r);
}
