import 'package:go_router/go_router.dart';

import '../screens/apps/error_screen.dart';
import '../screens/auth/login_screen.dart';
import '../screens/auth/providers/auth_provider.dart';
import '../screens/auth/register_screen.dart';
import '../screens/dashboard/dashboard_screen.dart';
import '../screens/profile/profile_screen.dart';
import 'builder/app_route_builder.dart';

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
        GoRoute(
          path: '/login',
          pageBuilder: (context, state) {
            return AppRouteBuilder.call(
              context: context,
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
              state: state,
              child: const RegisterScreen(),
            );
          },
        ),
        GoRoute(
          path: '/',
          pageBuilder: (context, state) {
            return AppRouteBuilder.call(
              context: context,
              state: state,
              child: const DashboardScreen(),
            );
          },
        ),
        GoRoute(
          path: '/profile',
          redirect: AppRouteBuilder.redirectLogin(authProvider),
          pageBuilder: (context, state) {
            return AppRouteBuilder.call(
              context: context,
              state: state,
              child: const ProfileScreen(),
            );
          },
        ),
      ],
    );
  }
}
