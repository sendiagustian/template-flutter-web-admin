import 'package:flutter/material.dart';

extension ColorExtension on Color {
  Color getTextColor() {
    Color backgroundColor = this;
    double brightness = (backgroundColor.red * 0.299 + backgroundColor.green * 0.587 + backgroundColor.blue * 0.114) / 255;
    return brightness > 0.5 ? Colors.black : Colors.white;
  }
}
