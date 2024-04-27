import 'package:dashboard/core/themes/colors_theme.dart';
import 'package:dashboard/core/themes/spacing_theme.dart';
import 'package:dashboard/core/themes/typography_theme.dart';

class AppTheme {
  final bool isDesktop;
  AppTheme(this.isDesktop);

  TypographyTheme get typography {
    return TypographyTheme(isDesktop);
  }

  static const ColorsTheme colors = ColorsTheme();
  static const SpacingTheme spacing = SpacingTheme();
}
