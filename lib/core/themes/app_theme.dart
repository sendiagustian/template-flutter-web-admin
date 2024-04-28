import 'colors_theme.dart';
import 'spacing_theme.dart';
import 'typography_theme.dart';

class AppTheme {
  final bool isDesktop;
  final bool isTablet;

  const AppTheme({this.isDesktop = true, this.isTablet = false});

  TypographyTheme get typography {
    return TypographyTheme(isDesktop: isDesktop, isTablet: isTablet);
  }

  static const ColorsTheme colors = ColorsTheme();
  static SpacingTheme spacing = SpacingTheme();
}
