import 'package:go_router/go_router.dart';

import '../screens/apps/error_screen.dart';
import '../screens/auth/login_screen.dart';
import '../screens/auth/providers/auth_provider.dart';
import '../screens/auth/register_screen.dart';
import 'components/app_route_builder.dart';
import 'side_menu_route.dart';

class AppRoute {
  final AuthProvider authProvider;

  late GoRouter router;

  AppRoute(this.authProvider) {
    router = GoRouter(
      initialLocation: "/",
      refreshListenable: authProvider,
      // observers: [AppObserverBuilder()],
      debugLogDiagnostics: true,
      errorPageBuilder: (context, state) {
        return AppRouteBuilder.call(
          context: context,
          state: state,
          child: const ErrorScreen(),
        );
      },
      routes: [
        ...SideMenuRoute.get(authProvider),
        GoRoute(
          path: '/login',
          pageBuilder: (context, state) {
            return AppRouteBuilder.call(
              context: context,
              authProvider: authProvider,
              state: state,
              child: const LoginScreen(),
            );
          },
        ),
        GoRoute(
          path: '/register',
          pageBuilder: (context, state) {
            return AppRouteBuilder.call(
              context: context,
              authProvider: authProvider,
              state: state,
              child: const RegisterScreen(),
            );
          },
        ),
      ],
    );
  }
}
