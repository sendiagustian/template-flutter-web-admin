import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../screens/apps/base_layout_screen.dart';
import '../../screens/apps/loading_screen.dart';
import '../../screens/auth/providers/auth_provider.dart';

class AppRouteBuilder {
  static FutureOr<String?> Function(BuildContext, GoRouterState)? redirectLogin(
    AuthProvider authProvider,
  ) {
    return (context, state) {
      if (!authProvider.isLogin) {
        return "/login";
      }
      return null;
    };
  }

  static FutureOr<String?> Function(BuildContext, GoRouterState)? redirectDashboard(
    AuthProvider authProvider,
  ) {
    return (context, state) {
      if (authProvider.isLogin) {
        return "/";
      }
      return null;
    };
  }

  static CustomTransitionPage call({
    required BuildContext context,
    AuthProvider? authProvider,
    required GoRouterState state,
    required Widget child,
  }) {
    return CustomTransitionPage(
      key: state.pageKey,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return child;
      },
      child: FutureBuilder(
        future: Future.delayed(const Duration(milliseconds: 800)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingScreen();
          } else {
            if (authProvider != null && authProvider.isLogin) {
              return BaseLayoutScreen(state: state, child: child);
            } else {
              return child;
            }
          }
        },
      ),
    );
  }
}
