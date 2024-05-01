import 'package:flutter/material.dart';

import '../../routes/router.dart';

class NavigatorService {
  const NavigatorService();

  static void pop<T extends Object?>(BuildContext context, [T? result]) {
    return Navigator.pop(context, result);
  }

  static void popPushToPage({
    required BuildContext context,
    required String route,
  }) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      push(context: context, route: route);
    });
  }

  static void popPushReplacementToPage({
    required BuildContext context,
    required String route,
  }) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      push(context: context, route: route);
    });
  }

  static void push({
    required BuildContext context,
    required String route,
  }) {
    AppRouter.instance.navigateTo(context, route);
  }
}
