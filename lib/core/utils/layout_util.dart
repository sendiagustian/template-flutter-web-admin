import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

// Booleans
bool isLargeScreen(BuildContext context) {
  return ResponsiveBreakpoints.of(context).isDesktop;
}

bool isMediumScreen(BuildContext context) {
  return ResponsiveBreakpoints.of(context).isTablet;
}

bool isSmallScreen(BuildContext context) {
  return ResponsiveBreakpoints.of(context).isMobile;
}
