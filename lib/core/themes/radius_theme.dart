import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RadiusTheme {
  const RadiusTheme();

  BorderRadius get circle => BorderRadius.circular(100);

  BorderRadius customAll(double value) => BorderRadius.circular(value);
  BorderRadius custom({double? topLeft, double? topRight, double? bottomRight, double? bottomLeft}) {
    return BorderRadius.only(
      topLeft: Radius.circular(topLeft ?? 0),
      topRight: Radius.circular(topRight ?? 0),
      bottomRight: Radius.circular(bottomRight ?? 0),
      bottomLeft: Radius.circular(bottomLeft ?? 0),
    );
  }

  BorderRadius get exSmall => BorderRadius.circular(4);
  BorderRadius get small => BorderRadius.circular(8);
  BorderRadius get medium => BorderRadius.circular(16);
  BorderRadius get large => BorderRadius.circular(24);
  BorderRadius get exLarge => BorderRadius.circular(32);
}
