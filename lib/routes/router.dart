import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import '../screens/apps/base_layout_screen.dart';
import '../screens/auth/login_screen.dart';
import '../screens/auth/providers/auth_provider.dart';
import '../screens/auth/register_screen.dart';
import '../screens/profile/profile_screen.dart';
import 'side_menu_route.dart';

class AppRouter {
  static FluroRouter instance = FluroRouter();

  final AuthProvider authProvider;
  AppRouter(this.authProvider);

  void defineRoutes(FluroRouter router) {
    // Define Route public
    router.define("/login", handler: _publicHandler(const LoginScreen()), transitionType: TransitionType.none);
    router.define("/register", handler: _publicHandler(const RegisterScreen()), transitionType: TransitionType.none);

    // Define Route with Authentication
    router.define("/profile", handler: _authHandler(const ProfileScreen()), transitionType: TransitionType.none);
    for (var mainSideRoutes in SideMenuRoute.routes) {
      router.define(
        mainSideRoutes.path,
        handler: _authHandler(BaseLayoutScreen(
          mainSideRoutes.page,
          title: mainSideRoutes.name,
        )),
        transitionType: TransitionType.none,
      );

      if (mainSideRoutes.subRoutes.isNotEmpty) {
        for (var subSideRoute in mainSideRoutes.subRoutes) {
          router.define(
            "${mainSideRoutes.path}${subSideRoute.path}",
            handler: _authHandler(BaseLayoutScreen(
              subSideRoute.page,
              title: subSideRoute.name,
            )),
            transitionType: TransitionType.none,
          );
        }
      }
    }
  }

  Handler _authHandler(Widget page) {
    return Handler(handlerFunc: (context, params) {
      if (authProvider.isLogin) {
        return page;
      } else {
        return const LoginScreen();
      }
    });
  }

  Handler _publicHandler(Widget page) {
    return Handler(handlerFunc: (context, params) {
      return page;
    });
  }
}
