import 'package:flutter/material.dart';

import '../screens/apps/style_typography_screen.dart';
import '../screens/apps/widget_badge_screen.dart';
import '../screens/apps/widget_button_screen.dart';
import '../screens/apps/widget_carausel_screen.dart';
import '../screens/apps/widget_card_screen.dart';
import '../screens/apps/widget_dialog_screen.dart';
import '../screens/apps/widget_drop_down_screen.dart';
import '../screens/apps/widget_form_screen.dart';
import '../screens/apps/widget_list_tile_screen.dart';
import '../screens/apps/widget_popover_screen.dart';
import '../screens/apps/widget_table_screen.dart';
import '../screens/apps/widget_tabs_screen.dart';
import '../screens/dashboard/dashboard_screen.dart';
// import '../screens/config_app/config_app_screen.dart';
// import '../screens/mamage_cms_mission/mamage_cms_mission_screen.dart';
// import '../screens/mamage_cms_tps/mamage_cms_tps_screen.dart';
// import '../screens/manage_achievement/manage_achievement_screen.dart';
// import '../screens/manage_avatar/manage_avatar.dart';
// import '../screens/manage_users/manage_users_screen.dart';
// import '../screens/verification_article/verification_article_screen.dart';
// import '../screens/verification_complaint/verification_complaint_screen.dart';
import 'route_item.dart';

class SideMenuRoute {
  static List<RouteItem> routes = [
    RouteItem(
      path: DashboardScreen.route,
      name: DashboardScreen.name,
      icon: DashboardScreen.icon,
      category: "Menu",
      page: const DashboardScreen(),
    ),
    // RouteItem(
    //   path: VerificationComplaintScreen.route,
    //   name: VerificationComplaintScreen.name,
    //   icon: VerificationComplaintScreen.icon,
    //   category: VerificationComplaintScreen.category,
    //   page: const VerificationComplaintScreen(),
    // ),
    // RouteItem(
    //   path: VerificationArticleScreen.route,
    //   name: VerificationArticleScreen.name,
    //   icon: VerificationArticleScreen.icon,
    //   category: VerificationArticleScreen.category,
    //   page: const VerificationArticleScreen(),
    // ),
    // RouteItem(
    //   path: ManageUsersScreen.route,
    //   name: ManageUsersScreen.name,
    //   icon: ManageUsersScreen.icon,
    //   category: ManageUsersScreen.category,
    //   page: const ManageUsersScreen(),
    // ),
    // RouteItem(
    //   path: ManageAvatarScreen.route,
    //   name: ManageAvatarScreen.name,
    //   icon: ManageAvatarScreen.icon,
    //   category: ManageAvatarScreen.category,
    //   page: const ManageAvatarScreen(),
    // ),
    // RouteItem(
    //   path: ManageAchievementScreen.route,
    //   name: ManageAchievementScreen.name,
    //   icon: ManageAchievementScreen.icon,
    //   category: ManageAchievementScreen.category,
    //   page: const ManageAchievementScreen(),
    // ),
    // RouteItem(
    //   path: ManageCMSMissionScreen.route,
    //   name: ManageCMSMissionScreen.name,
    //   icon: ManageCMSMissionScreen.icon,
    //   category: ManageCMSMissionScreen.category,
    //   page: const ManageCMSMissionScreen(),
    // ),
    // RouteItem(
    //   path: ManageCMSTPSScreen.route,
    //   name: ManageCMSTPSScreen.name,
    //   icon: ManageCMSTPSScreen.icon,
    //   category: ManageCMSTPSScreen.category,
    //   page: const ManageCMSTPSScreen(),
    // ),
    // RouteItem(
    //   path: ConfigAppScreen.route,
    //   name: ConfigAppScreen.name,
    //   icon: ConfigAppScreen.icon,
    //   category: ConfigAppScreen.category,
    //   page: const ConfigAppScreen(),
    // ),
    RouteItem(
      path: "/styles",
      name: "Styles",
      category: "Styles",
      icon: Icons.style,
      page: Container(),
      subRoutes: [
        RouteItem(
          path: StyleTypograpgyScreen.route,
          name: StyleTypograpgyScreen.name,
          category: StyleTypograpgyScreen.category,
          page: const StyleTypograpgyScreen(),
        ),
      ],
    ),
    RouteItem(
      path: "/widgets",
      name: "Widgets",
      icon: Icons.widgets,
      category: "Widgets",
      page: Container(),
      subRoutes: [
        RouteItem(
          path: WidgetFormScreen.route,
          name: WidgetFormScreen.name,
          icon: WidgetFormScreen.icon,
          category: WidgetFormScreen.category,
          page: const WidgetFormScreen(),
        ),
        RouteItem(
          path: WidgetCardScreen.route,
          name: WidgetCardScreen.name,
          icon: WidgetCardScreen.icon,
          page: const WidgetCardScreen(),
        ),
        RouteItem(
          path: WidgetTableScreen.route,
          name: WidgetTableScreen.name,
          category: WidgetTableScreen.category,
          icon: WidgetTableScreen.icon,
          page: const WidgetTableScreen(),
        ),
        RouteItem(
          path: WidgetButtonScreen.route,
          name: WidgetButtonScreen.name,
          icon: WidgetButtonScreen.icon,
          page: const WidgetButtonScreen(),
        ),
        RouteItem(
          path: WidgetCarauselScreen.route,
          name: WidgetCarauselScreen.name,
          icon: WidgetCarauselScreen.icon,
          page: const WidgetCarauselScreen(),
        ),
        RouteItem(
          path: WidgetBadgeScreen.route,
          name: WidgetBadgeScreen.name,
          icon: WidgetBadgeScreen.icon,
          page: const WidgetBadgeScreen(),
        ),
        RouteItem(
          path: WidgetDialogScreen.route,
          name: WidgetDialogScreen.name,
          icon: WidgetDialogScreen.icon,
          page: const WidgetDialogScreen(),
        ),
        RouteItem(
          path: WidgetDropDownScreen.route,
          name: WidgetDropDownScreen.name,
          icon: WidgetDropDownScreen.icon,
          page: const WidgetDropDownScreen(),
        ),
        RouteItem(
          path: WidgetListTileScreen.route,
          name: WidgetListTileScreen.name,
          icon: WidgetListTileScreen.icon,
          page: const WidgetListTileScreen(),
        ),
        RouteItem(
          path: WidgetPopoverScreen.route,
          name: WidgetPopoverScreen.name,
          icon: WidgetPopoverScreen.icon,
          page: const WidgetPopoverScreen(),
        ),
        RouteItem(
          path: WidgetTabsScreen.route,
          name: WidgetTabsScreen.name,
          icon: WidgetTabsScreen.icon,
          page: const WidgetTabsScreen(),
        ),
      ],
    ),
  ];
}
