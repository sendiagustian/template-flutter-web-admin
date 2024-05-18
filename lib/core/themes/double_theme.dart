import 'package:flutter/material.dart';

class DoubleTheme {
  const DoubleTheme();

  double screenW(BuildContext context) => MediaQuery.of(context).size.width;
  double screenH(BuildContext context) => MediaQuery.of(context).size.height;

  double get doubleX4 => 4;
  double get doubleX8 => 8;
  double get doubleX12 => 12;
  double get doubleX16 => 16;
  double get doubleX24 => 24;

  double get doubleY4 => 4;
  double get doubleY8 => 8;
  double get doubleY12 => 12;
  double get doubleY16 => 16;
  double get doubleY24 => 24;
}
