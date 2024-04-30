import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class LayoutUtil {
  final BuildContext context;
  LayoutUtil(this.context);

  // Booleans
  bool get isDesktop {
    return ResponsiveBreakpoints.of(context).isDesktop;
  }

  bool get isTablet {
    return ResponsiveBreakpoints.of(context).isTablet;
  }

  bool get isMobile {
    return ResponsiveBreakpoints.of(context).isMobile;
  }
}
