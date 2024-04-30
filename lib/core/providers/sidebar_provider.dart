import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../routes/components/route_item.dart';
import '../../routes/side_menu_route.dart';

class SidebarProvider with ChangeNotifier {
  final GoRouterState state;
  SidebarProvider(this.state) {
    _init();
  }

  Future<void> _init() async {
    List<String>? pathSegments = state.fullPath!
        .split('/')
        .where((segment) => segment.isNotEmpty)
        .toList();

    if (pathSegments.isNotEmpty) {
      selectedMainMenu = SideMenuRoute.routes.where((element) {
        return element.path == "/${pathSegments[0]}";
      }).first;
    }
    if (pathSegments.length > 1) {
      expandSubMenu = selectedMainMenu;
      selectedSubMenu = selectedMainMenu?.subRoutes.where((element) {
        return element.path == "/${pathSegments[1]}";
      }).first;
    }
  }

  RouteItem? _selectedMainMenu;
  RouteItem? get selectedMainMenu => _selectedMainMenu;
  set selectedMainMenu(RouteItem? value) {
    _selectedMainMenu = value;
    notifyListeners();
  }

  RouteItem? _selectedSubMenu;
  RouteItem? get selectedSubMenu => _selectedSubMenu;
  set selectedSubMenu(RouteItem? value) {
    _selectedSubMenu = value;
    notifyListeners();
  }

  RouteItem? _expandSubMenu;
  RouteItem? get expandSubMenu => _expandSubMenu;
  set expandSubMenu(RouteItem? value) {
    _expandSubMenu = value;
    notifyListeners();
  }

  bool _isDrawerOpen = false;
  bool get isDrawerOpen => _isDrawerOpen;

  void openDrawer() {
    _isDrawerOpen = true;
    notifyListeners();
  }

  void closeDrawer() {
    _isDrawerOpen = false;
    notifyListeners();
  }
}
