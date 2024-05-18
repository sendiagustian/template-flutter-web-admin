import 'box_shadows_theme.dart';
import 'colors_theme.dart';
import 'double_theme.dart';
import 'geometry_theme.dart';
import 'radius_theme.dart';
import 'spacing_theme.dart';
import 'typography_theme.dart';

abstract class AppTheme {
  static const TypographyTheme typography = TypographyTheme();
  static const ColorsTheme colors = ColorsTheme();
  static const DoubleTheme double = DoubleTheme();
  static const SpacingTheme spacing = SpacingTheme();
  static const GeometryTheme geometry = GeometryTheme();
  static const RadiusTheme radius = RadiusTheme();
  static const BoxShadowsTheme boxShadows = BoxShadowsTheme();
}
