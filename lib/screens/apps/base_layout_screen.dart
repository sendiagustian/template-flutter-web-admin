import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../core/providers/sidebar_provider.dart';
import '../../core/utils/layout_util.dart';
import '../../core/widgets/navbar_widget.dart';
import '../../core/widgets/sidebar_widget.dart';
import '../../routes/components/route_item.dart';
import '../../routes/side_menu_route.dart';
import '../profile/profile_screen.dart';

class BaseLayoutScreen extends StatelessWidget {
  final GoRouterState state;
  final Widget child;

  const BaseLayoutScreen({super.key, required this.state, required this.child});

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
    final initialSelectedItem = SideMenuRoute.routes.first;
    final bool isLargeScreen = LayoutUtil(context).isDesktop;

    return ChangeNotifierProvider(
      create: (_) => SidebarProvider(state),
      child: Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
        drawer: Consumer<SidebarProvider>(builder: (_, sidebarProvider, __) {
          RouteItem? selectedItem = sidebarProvider.selectedMainMenu;
          return SidebarWidget(
            initialSelectedItem: selectedItem ?? initialSelectedItem,
            scrollController: sidebarProvider.scrollDrawerControl,
            sidebarProvider: sidebarProvider,
            items: SideMenuRoute.routes,
          );
        }),
        body: Row(
          children: [
            Consumer<SidebarProvider>(builder: (_, sidebarProvider, __) {
              RouteItem? selectedItem = sidebarProvider.selectedMainMenu;
              if (isLargeScreen) {
                return SidebarWidget(
                  initialSelectedItem: selectedItem ?? initialSelectedItem,
                  scrollController: sidebarProvider.scrollSideControl,
                  sidebarProvider: sidebarProvider,
                  items: SideMenuRoute.routes,
                );
              }
              return const SizedBox();
            }),
            Expanded(
              child: Column(
                children: [
                  NavbarWidget(
                    state: state,
                    navItems: itemNavMenus,
                    profileItems: itemProfileMenus,
                    onMobileMenuTap: () {
                      scaffoldKey.currentState?.openDrawer();
                    },
                  ),
                  Expanded(child: child),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
