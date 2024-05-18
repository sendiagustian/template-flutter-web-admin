import 'package:flutter/widgets.dart';

import '../items/route_item.dart';
import '../route_side_menu.dart';
// import '../../core/utils/session_util.dart';

class SidebarProvider with ChangeNotifier {
  final BuildContext context;
  SidebarProvider(this.context) {
    _init();
  }

  // static final SessionUtil _sessionUtil = SessionUtil();

  Future<void> _init() async {
    String nowPath = ModalRoute.of(context)?.settings.name ?? "/";
    // await _sessionUtil.readSession("SIDE_POSITION").then((sidebarPosition) {
    //   if (sidebarPosition != null && context.mounted) {
    //     _scrollSideControl.jumpTo(double.parse(sidebarPosition));
    //   }
    // });

    // scrollSideControl.addListener(() async {
    //   await _sessionUtil.writeSession("SIDE_POSITION", "${scrollSideControl.offset}");
    // });

    List<String>? pathSegments = nowPath.split('/').where((segment) => segment.isNotEmpty).toList();
    if (pathSegments.isNotEmpty) {
      selectedMainMenu = routesSideMenu.where((element) {
        return element.path == "/${pathSegments[0]}";
      }).first;
    }
    if (pathSegments.length > 1) {
      expandSubMenu = selectedMainMenu;
      selectedSubMenu = selectedMainMenu?.subRoutes.where((element) {
        return element.path == "/${pathSegments[0]}/${pathSegments[1]}";
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

  bool _showMobileMenu = false;
  bool get showMobileMenu => _showMobileMenu;
  set showMobileMenu(bool value) {
    _showMobileMenu = value;
    notifyListeners();
  }
}
