import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpacingTheme {
  const SpacingTheme();

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

  SizedBox get exSmallX => SizedBox(width: 4.w);
  SizedBox get smallX => SizedBox(width: 8.w);
  SizedBox get mediumX => SizedBox(width: 16.w);
  SizedBox get largeX => SizedBox(width: 24.w);
  SizedBox get exLargeX => SizedBox(width: 32.w);

  SizedBox get exSmallY => SizedBox(height: 4.h);
  SizedBox get smallY => SizedBox(height: 8.h);
  SizedBox get mediumY => SizedBox(height: 16.h);
  SizedBox get largeY => SizedBox(height: 24.h);
  SizedBox get exLargeY => SizedBox(height: 32.h);
}
