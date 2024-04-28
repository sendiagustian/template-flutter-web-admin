import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpacingTheme {
  SpacingTheme();

  double get doubleX4 => 4.w;
  double get doubleX8 => 8.w;
  double get doubleX12 => 12.w;
  double get doubleX16 => 16.w;
  double get doubleX24 => 24.w;

  double get doubleY4 => 4.h;
  double get doubleY8 => 8.h;
  double get doubleY12 => 12.h;
  double get doubleY16 => 16.h;
  double get doubleY24 => 24.h;

  SizedBox customX(double value) => SizedBox(width: value.w);
  SizedBox customY(double value) => SizedBox(height: value.h);

  SizedBox get smallX => SizedBox(width: 4.w);
  SizedBox get mediumX => SizedBox(width: 6.w);
  SizedBox get largeX => SizedBox(width: 8.w);

  SizedBox get smallY => SizedBox(height: 4.h);
  SizedBox get mediumY => SizedBox(height: 6.h);
  SizedBox get largeY => SizedBox(height: 8.h);

  EdgeInsetsGeometry get pm16 => EdgeInsets.all(16.r);
  EdgeInsetsGeometry get pm24 => EdgeInsets.all(24.r);
  EdgeInsetsGeometry get pm32 => EdgeInsets.all(32.r);

  EdgeInsetsGeometry get pmX16 {
    return EdgeInsets.symmetric(horizontal: 16.r);
  }

  EdgeInsetsGeometry get pmX24 {
    return EdgeInsets.symmetric(horizontal: 24.r);
  }

  EdgeInsetsGeometry get pmX32 {
    return EdgeInsets.symmetric(horizontal: 32.r);
  }

  EdgeInsetsGeometry get pmY16 {
    return EdgeInsets.symmetric(vertical: 16.r);
  }

  EdgeInsetsGeometry get pmY24 {
    return EdgeInsets.symmetric(vertical: 24.r);
  }

  EdgeInsetsGeometry get pmY32 {
    return EdgeInsets.symmetric(vertical: 32.r);
  }

  EdgeInsetsGeometry get pmT16 => EdgeInsets.only(top: 16.r);
  EdgeInsetsGeometry get pmT24 => EdgeInsets.only(top: 24.r);
  EdgeInsetsGeometry get pmT32 => EdgeInsets.only(top: 32.r);

  EdgeInsetsGeometry get pmR16 => EdgeInsets.only(right: 16.r);
  EdgeInsetsGeometry get pmR24 => EdgeInsets.only(right: 24.r);
  EdgeInsetsGeometry get pmR32 => EdgeInsets.only(right: 32.r);

  EdgeInsetsGeometry get pmB16 => EdgeInsets.only(bottom: 16.r);
  EdgeInsetsGeometry get pmB24 => EdgeInsets.only(bottom: 24.r);
  EdgeInsetsGeometry get pmB32 => EdgeInsets.only(bottom: 32.r);

  EdgeInsetsGeometry get pmL16 => EdgeInsets.only(left: 16.r);
  EdgeInsetsGeometry get pmL24 => EdgeInsets.only(left: 24.r);
  EdgeInsetsGeometry get pmL32 => EdgeInsets.only(left: 32.r);
}
