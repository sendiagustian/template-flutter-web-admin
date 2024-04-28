import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../screens/apps/loading_screen.dart';
import '../../screens/auth/providers/auth_provider.dart';

class AppRouteBuilder {
  static FutureOr<String?> Function(BuildContext, GoRouterState)? redirectLogin(
    AuthProvider authProvider,
  ) {
    return (context, state) {
      if (authProvider.isLogin) {
        return null;
      } else {
        return "/login";
      }
    };
  }

  static CustomTransitionPage call({
    required BuildContext context,
    required GoRouterState state,
    required Widget child,
  }) {
    return CustomTransitionPage(
      key: state.pageKey,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
      child: FutureBuilder(
        future: Future.delayed(const Duration(milliseconds: 500)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingScreen();
          } else {
            return child;
          }
        },
      ),
    );
  }
}
