import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SpacingTheme {
  const SpacingTheme();

  SizedBox customX(double value) => SizedBox(width: value);
  SizedBox customY(double value) => SizedBox(height: value);

  SizedBox get exSmallX => const SizedBox(width: 4);
  SizedBox get smallX => const SizedBox(width: 8);
  SizedBox get mediumX => const SizedBox(width: 16);
  SizedBox get largeX => const SizedBox(width: 24);
  SizedBox get exLargeX => const SizedBox(width: 32);

  SizedBox get exSmallY => const SizedBox(height: 4);
  SizedBox get smallY => const SizedBox(height: 8);
  SizedBox get mediumY => const SizedBox(height: 16);
  SizedBox get largeY => const SizedBox(height: 24);
  SizedBox get exLargeY => const SizedBox(height: 32);
}
