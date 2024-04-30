import 'package:go_router/go_router.dart';

import '../screens/auth/providers/auth_provider.dart';
import '../screens/config_app/config_app_screen.dart';
import '../screens/dashboard/dashboard_screen.dart';
import '../screens/mamage_cms_mission/mamage_cms_mission_screen.dart';
import '../screens/mamage_cms_tps/mamage_cms_tps_screen.dart';
import '../screens/manage_achievement/manage_achievement_screen.dart';
import '../screens/manage_avatar/manage_avatar.dart';
import '../screens/manage_users/manage_users_screen.dart';
import '../screens/verification_article/verification_article_screen.dart';
import '../screens/verification_complaint/verification_complaint_screen.dart';
import 'components/app_route_builder.dart';
import 'components/route_item.dart';

class SideMenuRoute {
  static List<RouteItem> routes = [
    RouteItem(
      path: DashboardScreen.route,
      name: DashboardScreen.name,
      icon: DashboardScreen.icon,
      category: "Menu",
      page: const DashboardScreen(),
    ),
    RouteItem(
      path: VerificationComplaintScreen.route,
      name: VerificationComplaintScreen.name,
      icon: VerificationComplaintScreen.icon,
      category: VerificationComplaintScreen.category,
      page: const VerificationComplaintScreen(),
    ),
    RouteItem(
      path: VerificationArticleScreen.route,
      name: VerificationArticleScreen.name,
      icon: VerificationArticleScreen.icon,
      category: VerificationArticleScreen.category,
      page: const VerificationArticleScreen(),
    ),
    RouteItem(
      path: ManageUsersScreen.route,
      name: ManageUsersScreen.name,
      icon: ManageUsersScreen.icon,
      category: ManageUsersScreen.category,
      page: const ManageUsersScreen(),
    ),
    RouteItem(
      path: ManageAvatarScreen.route,
      name: ManageAvatarScreen.name,
      icon: ManageAvatarScreen.icon,
      category: ManageAvatarScreen.category,
      page: const ManageAvatarScreen(),
    ),
    RouteItem(
      path: ManageAchievementScreen.route,
      name: ManageAchievementScreen.name,
      icon: ManageAchievementScreen.icon,
      category: ManageAchievementScreen.category,
      page: const ManageAchievementScreen(),
    ),
    RouteItem(
      path: ManageCMSMissionScreen.route,
      name: ManageCMSMissionScreen.name,
      icon: ManageCMSMissionScreen.icon,
      category: ManageCMSMissionScreen.category,
      page: const ManageCMSMissionScreen(),
    ),
    RouteItem(
      path: ManageCMSTPSScreen.route,
      name: ManageCMSTPSScreen.name,
      icon: ManageCMSTPSScreen.icon,
      category: ManageCMSTPSScreen.category,
      page: const ManageCMSTPSScreen(),
    ),
    RouteItem(
      path: ConfigAppScreen.route,
      name: ConfigAppScreen.name,
      icon: ConfigAppScreen.icon,
      category: ConfigAppScreen.category,
      page: const ConfigAppScreen(),
    ),
  ];

  static List<GoRoute> get(AuthProvider authProvider) {
    return List.generate(routes.length, (index) {
      RouteItem route = routes[index];
      return GoRoute(
        path: route.path,
        redirect: AppRouteBuilder.redirectLogin(authProvider),
        pageBuilder: (context, state) {
          return AppRouteBuilder.call(
            context: context,
            authProvider: authProvider,
            state: state,
            child: route.page,
          );
        },
        routes: List.generate(route.subRoutes.length, (index) {
          RouteItem subRoute = route.subRoutes[index];
          return GoRoute(
            path: subRoute.path.split("/").last,
            redirect: AppRouteBuilder.redirectLogin(authProvider),
            pageBuilder: (context, state) {
              return AppRouteBuilder.call(
                context: context,
                authProvider: authProvider,
                state: state,
                child: subRoute.page,
              );
            },
          );
        }),
      );
    });
  }
}
