import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:selectable/selectable.dart';

import '../../core/themes/app_theme.dart';
import '../../screens/auth/providers/auth_app_provider.dart';
import '../../screens/auth/services/auth_service.dart';
import '../../screens/dashboard/dashboard_screen.dart';
import '../items/profile_item.dart';
import '../services/navigator_service.dart';
import 'navbar_widget.dart';
import 'sidebar_widget.dart';
import '../providers/sidebar_provider.dart';
import '../items/route_item.dart';
import '../route_side_menu.dart';
import '../../core/utils/app_util.dart';

class BaseLayoutScreen extends StatelessWidget {
  final String? title;
  final Widget child;

  const BaseLayoutScreen({super.key, this.title, required this.child});

  static final AuthService _authService = AuthService();
  static final List<RouteItem> itemNavMenus = [];
  static final List<RouteItem> listRouteSideMenu = [
    const RouteItem(
      path: "/",
      name: "Dashboard",
      icon: Icons.dashboard,
      category: "Menu",
      page: DashboardScreen(),
    ),
    ...routesSideMenu
  ];

  @override
  Widget build(BuildContext context) {
    final RouteItem initialSelectedItem = listRouteSideMenu.first;

    return ChangeNotifierProvider(
      create: (_) => SidebarProvider(context),
      child: Consumer2<AuthAppProvider, SidebarProvider>(builder: (_, auth, sidebarProvider, __) {
        RouteItem? selectedItem = sidebarProvider.selectedMainMenu;
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              Row(
                children: [
                  Builder(builder: (context) {
                    if (isLargeScreen(context)) {
                      return SidebarWidget(
                        initialSelectedItem: selectedItem ?? initialSelectedItem,
                        scrollController: sidebarProvider.scrollSideControl,
                        sidebarProvider: sidebarProvider,
                        items: listRouteSideMenu,
                      );
                    }
                    return const SizedBox();
                  }),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        NavbarWidget(
                          title: !isLargeScreen(context) ? title : null,
                          navItems: itemNavMenus,
                          profileItems: [
                            // ProfileItem(
                            //   icon: Icons.person,
                            //   name: 'Profile',
                            //   onTap: () {
                            //     NavigatorService.push(context: context, route: ProfileScreen.path);
                            //   },
                            // ),
                            ProfileItem(
                              icon: Icons.logout,
                              name: 'Logout',
                              onTap: () {
                                _authService.logOut(context, auth).then((value) {
                                  auth.updateState();
                                  NavigatorService.pushAndRemoveUntil(context: context, route: DashboardScreen.path);
                                });
                              },
                            ),
                          ],
                          onMobileMenuTap: () {
                            sidebarProvider.showMobileMenu = true;
                          },
                        ),
                        Expanded(
                          child: Selectable(
                            selectWordOnDoubleTap: true,
                            selectWordOnLongPress: true,
                            selectionColor: AppTheme.colors.primary.withOpacity(.1),
                            popupMenuItems: const [SelectableMenuItem(type: SelectableMenuItemType.copy)],
                            child: child,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              /// Mobile Sidebar Menu if screen is small
              Container(
                color: Colors.black.withOpacity(0.5),
                width: sidebarProvider.showMobileMenu ? double.infinity : 0,
                height: sidebarProvider.showMobileMenu ? double.infinity : 0,
                child: GestureDetector(
                  onTap: () {
                    sidebarProvider.showMobileMenu = false;
                  },
                ),
              ),
              Builder(builder: (context) {
                if (sidebarProvider.showMobileMenu) {
                  return SidebarWidget(
                    initialSelectedItem: selectedItem ?? initialSelectedItem,
                    sidebarProvider: sidebarProvider,
                    items: listRouteSideMenu,
                  );
                }
                return const SizedBox();
              }),
            ],
          ),
        );
      }),
    );
  }
}
