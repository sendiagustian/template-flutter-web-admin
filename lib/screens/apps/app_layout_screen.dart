import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../core/providers/sidebar_provider.dart';
import '../../core/themes/app_theme.dart';
import '../../core/utils/layout_util.dart';
import '../../core/widgets/navbar_widget.dart';
import '../../core/widgets/sidebar_widget.dart';
import '../../routes/components/route_item.dart';
import '../../routes/side_menu_route.dart';
import '../profile/profile_screen.dart';

class AppLayoutScreen extends StatelessWidget {
  final GoRouterState state;
  final Widget child;

  const AppLayoutScreen({super.key, required this.state, required this.child});

  static final List<RouteItem> itemNavMenus = [];
  static final List<RouteItem> itemProfileMenus = [
    RouteItem(
      path: ProfileScreen.route,
      name: ProfileScreen.name,
      page: const ProfileScreen(),
    )
  ];
  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return ChangeNotifierProvider(
      create: (_) => SidebarProvider(state),
      child: Scaffold(
        key: scaffoldKey,
        drawer: _drawer(context),
        bottomNavigationBar: _buildNavBottom(context),
        body: Row(
          children: [
            Consumer<SidebarProvider>(builder: (_, sidebarProvider, __) {
              RouteItem? selectedItem = sidebarProvider.selectedMainMenu;
              return SidebarWidget(
                initialSelectedItem: selectedItem ?? SideMenuRoute.routes.first,
                sidebarProvider: sidebarProvider,
                items: SideMenuRoute.routes,
              );
            }),
            Expanded(
              child: Column(
                children: [
                  NavbarWidget(
                    state: state,
                    onMobileMenuTap: () {
                      scaffoldKey.currentState?.openDrawer();
                    },
                    navItems: itemNavMenus,
                    profileItems: itemProfileMenus,
                  ),
                  Expanded(
                    child: child,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget? _drawer(BuildContext context) {
    final bool isLargeScreen = LayoutUtil(context).isDesktop;
    if (!isLargeScreen && SideMenuRoute.routes.isNotEmpty) {
      return Drawer(
        child: ListView(
          children: SideMenuRoute.routes.map((item) {
            return ListTile(
              title: Text(
                item.name,
                style: AppTheme.typography.labelLarge,
              ),
            );
          }).toList(),
        ),
      );
    }
    return null;
  }

  Widget? _buildNavBottom(BuildContext context) {
    bool isLargeScreen = LayoutUtil(context).isDesktop;
    if (!isLargeScreen) {
      return BottomNavigationBar(
        items: SideMenuRoute.routes.map((item) {
          return BottomNavigationBarItem(
            icon: Icon(item.icon),
            label: item.name,
          );
        }).toList(),
        currentIndex: 0,
        onTap: (index) {},
      );
    }
    return null;
  }
}
