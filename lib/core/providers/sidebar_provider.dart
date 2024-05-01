import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../routes/components/route_item.dart';
import '../../routes/side_menu_route.dart';
// import '../utils/session_util.dart';

class SidebarProvider with ChangeNotifier {
  final GoRouterState state;
  SidebarProvider(this.state) {
    _init();
  }

  // static final SessionUtil _sessionUtil = SessionUtil();

  Future<void> _init() async {
    // scrollSideControl.addListener(() async {
    //   await _sessionUtil.writeSession("SIDE_POSITION", "${scrollSideControl.offset}");
    // });

    // scrollDrawerControl.addListener(() async {
    //   await _sessionUtil.writeSession("DRAWER_POSITION", "${scrollDrawerControl.offset}");
    // });

    // await _sessionUtil.readSession("SIDE_POSITION").then((sidebarPosition) {
    //   if (sidebarPosition != null) {
    //     _scrollSideControl.jumpTo(double.parse(sidebarPosition));
    //   }
    // });

    // await _sessionUtil.readSession("DRAWER_POSITION").then((sidebarPosition) {
    //   if (sidebarPosition != null) {
    //     _scrollDrawerControl.jumpTo(double.parse(sidebarPosition));
    //   }
    // });

    List<String>? pathSegments = state.fullPath!.split('/').where((segment) => segment.isNotEmpty).toList();
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

  ScrollController _scrollSideControl = ScrollController();
  ScrollController get scrollSideControl => _scrollSideControl;
  set scrollSideControl(ScrollController value) {
    _scrollSideControl = value;
    notifyListeners();
  }

  ScrollController _scrollDrawerControl = ScrollController();
  ScrollController get scrollDrawerControl => _scrollDrawerControl;
  set scrollDrawerControl(ScrollController value) {
    _scrollDrawerControl = value;
    notifyListeners();
  }
}
