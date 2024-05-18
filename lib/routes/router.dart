import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import '../screens/auth/providers/auth_app_provider.dart';
import 'base/base_layout_screen.dart';
import '../screens/apps/not_found_screen.dart';
import '../screens/auth/login_screen.dart';
import '../screens/dashboard/dashboard_screen.dart';
import 'route_login.dart';
import 'route_public.dart';
import 'route_side_menu.dart';

class AppRouter {
  static FluroRouter instance = FluroRouter();

  final AuthAppProvider auth;
  AppRouter(this.auth);

  void defineRoutes(FluroRouter router) {
    router.printTree();
    // Define Route not found
    router.notFoundHandler = _notFoundHandler();

    // Define Route base
    router.define(
      "/",
      handler: _baseHandler(),
      transitionType: TransitionType.none,
    );

    // Define Route public
    if (!auth.isLogin) {
      for (var publicRoute in routesPublic) {
        router.define(
          publicRoute.path,
          transitionType: TransitionType.none,
          handler: _publicHandler(publicRoute.page),
        );
      }
    }
    // Define Route with Authentication
    else {
      //// No Side Menu
      for (var loginRoute in routesLogin) {
        router.define(
          loginRoute.path,
          transitionType: TransitionType.none,
          handler: _publicHandler(loginRoute.page),
        );
      }

      //// In Side Menu
      for (var mainSideRoutes in routesSideMenu) {
        router.define(
          mainSideRoutes.path,
          transitionType: TransitionType.none,
          handler: _authHandler(BaseLayoutScreen(
            title: mainSideRoutes.name,
            child: mainSideRoutes.page,
          )),
        );

        if (mainSideRoutes.subRoutes.isNotEmpty) {
          for (var subSideRoute in mainSideRoutes.subRoutes) {
            router.define(
              subSideRoute.path,
              transitionType: TransitionType.none,
              handler: _authHandler(BaseLayoutScreen(
                title: subSideRoute.name,
                child: subSideRoute.page,
              )),
            );
          }
        }
      }
    }
  }

  Handler _baseHandler() {
    return Handler(handlerFunc: (context, params) {
      if (auth.isLogin) {
        return const BaseLayoutScreen(title: "Dashboard", child: DashboardScreen());
      }
      return const LoginScreen();
    });
  }

  Handler _publicHandler(Widget page) {
    return Handler(handlerFunc: (context, params) {
      return page;
    });
  }

  Handler _authHandler(Widget page) {
    return Handler(handlerFunc: (context, params) {
      if (auth.isLogin) {
        return page;
      } else {
        return const LoginScreen();
      }
    });
  }

  Handler _notFoundHandler() {
    return Handler(handlerFunc: (context, params) {
      return const NotFoundScreen();
    });
  }
}
