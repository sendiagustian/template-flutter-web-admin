import 'package:flutter/widgets.dart';

import '../route_item.dart';
import '../side_menu_route.dart';
// import '../../core/utils/session_util.dart';

class SidebarProvider with ChangeNotifier {
  SidebarProvider() {
    _init();
  }

  // static final SessionUtil _sessionUtil = SessionUtil();

  Future<void> _init() async {
    // await _sessionUtil.readSession("SIDE_POSITION").then((sidebarPosition) {
    //   if (sidebarPosition != null) {
    //     _scrollSideControl.jumpTo(double.parse(sidebarPosition));
    //   }
    // });

    // scrollSideControl.addListener(() async {
    //   await _sessionUtil.writeSession("SIDE_POSITION", "${scrollSideControl.offset}");
    // });

    List<String>? pathSegments = Uri.base.path.split('/').where((segment) => segment.isNotEmpty).toList();
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
}
