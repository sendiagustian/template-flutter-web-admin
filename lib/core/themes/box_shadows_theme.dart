import 'package:flutter/material.dart';

class BoxShadowsTheme {
  const BoxShadowsTheme();

  List<BoxShadow> get basic {
    return [
      const BoxShadow(
        color: Color(0x111C1B76),
        blurRadius: 26.96,
        offset: Offset(0, 3.68),
        spreadRadius: 0,
      ),
    ];
  }

  List<BoxShadow> get box {
    return [
      BoxShadow(
        color: Colors.grey[400]!,
        offset: const Offset(0.4, 1),
        blurRadius: 2,
      ),
    ];
  }
}
