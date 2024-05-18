import 'package:flutter/material.dart';

import 'items/route_item.dart';
import '../templates/styles/style_typography_screen.dart';
import '../templates/widgets/widget_badge_screen.dart';
import '../templates/widgets/widget_button_screen.dart';
import '../templates/widgets/widget_carausel_screen.dart';
import '../templates/widgets/widget_card_screen.dart';
import '../templates/widgets/widget_dialog_screen.dart';
import '../templates/widgets/widget_form_screen.dart';
import '../templates/widgets/widget_list_tile_screen.dart';
import '../templates/widgets/widget_popover_screen.dart';
import '../templates/widgets/widget_table_screen.dart';
import '../templates/widgets/widget_tabs_screen.dart';

List<RouteItem> routesSideMenu = [
  // PART OF TEMPLATE ROUTES
  RouteItem(
    path: "/styles",
    name: "Styles",
    category: "Styles",
    icon: Icons.style,
    page: Container(),
    subRoutes: [
      const RouteItem(
        path: StyleTypograpgyScreen.path,
        name: StyleTypograpgyScreen.name,
        category: StyleTypograpgyScreen.category,
        page: StyleTypograpgyScreen(),
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
      const RouteItem(
        path: WidgetFormScreen.path,
        name: WidgetFormScreen.name,
        icon: WidgetFormScreen.icon,
        category: WidgetFormScreen.category,
        page: WidgetFormScreen(),
      ),
      const RouteItem(
        path: WidgetCardScreen.path,
        name: WidgetCardScreen.name,
        icon: WidgetCardScreen.icon,
        page: WidgetCardScreen(),
      ),
      const RouteItem(
        path: WidgetTableScreen.path,
        name: WidgetTableScreen.name,
        category: WidgetTableScreen.category,
        icon: WidgetTableScreen.icon,
        page: WidgetTableScreen(),
      ),
      const RouteItem(
        path: WidgetButtonScreen.path,
        name: WidgetButtonScreen.name,
        icon: WidgetButtonScreen.icon,
        page: WidgetButtonScreen(),
      ),
      const RouteItem(
        path: WidgetListTileScreen.path,
        name: WidgetListTileScreen.name,
        icon: WidgetListTileScreen.icon,
        page: WidgetListTileScreen(),
      ),
      const RouteItem(
        path: WidgetCarauselScreen.path,
        name: WidgetCarauselScreen.name,
        icon: WidgetCarauselScreen.icon,
        page: WidgetCarauselScreen(),
      ),
      const RouteItem(
        path: WidgetBadgeScreen.path,
        name: WidgetBadgeScreen.name,
        icon: WidgetBadgeScreen.icon,
        page: WidgetBadgeScreen(),
      ),
      const RouteItem(
        path: WidgetDialogScreen.path,
        name: WidgetDialogScreen.name,
        icon: WidgetDialogScreen.icon,
        page: WidgetDialogScreen(),
      ),
      const RouteItem(
        path: WidgetPopoverScreen.path,
        name: WidgetPopoverScreen.name,
        icon: WidgetPopoverScreen.icon,
        page: WidgetPopoverScreen(),
      ),
      const RouteItem(
        path: WidgetTabsScreen.path,
        name: WidgetTabsScreen.name,
        icon: WidgetTabsScreen.icon,
        page: WidgetTabsScreen(),
      ),
    ],
  ),
];
