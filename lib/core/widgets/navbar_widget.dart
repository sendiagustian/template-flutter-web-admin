import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../routes/components/route_item.dart';
import '../services/navigator_service.dart';
import '../themes/app_theme.dart';
import '../utils/layout_util.dart';
import 'breadcrumb_widget.dart';
import 'icon_profile_widget.dart';

class NavbarWidget extends StatelessWidget implements PreferredSizeWidget {
  final GoRouterState state;
  final List<RouteItem> navItems;
  final List<RouteItem> profileItems;
  final void Function()? onMobileMenuTap;

  const NavbarWidget({
    super.key,
    required this.state,
    required this.navItems,
    required this.profileItems,
    this.onMobileMenuTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isLargeScreen = LayoutUtil(context).isDesktop;

    return AppBar(
      automaticallyImplyLeading: false,
      leading: _buildLeading(isLargeScreen),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          BreadcrumbsWidget(state: state),
          if (isLargeScreen) Expanded(child: _navBarItems(context))
        ],
      ),
      actions: [
        Padding(
          padding: AppTheme.spacing.pmR16,
          child: CircleAvatar(
            child: IconProfileWidget(profileItems),
          ),
        )
      ],
    );
  }

  Widget? _buildLeading(bool isLargeScreen) {
    if (!isLargeScreen && onMobileMenuTap != null) {
      return IconButton(
        icon: const Icon(Icons.menu),
        onPressed: onMobileMenuTap,
      );
    }
    return null;
  }

  Widget _navBarItems(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: navItems
          .map(
            (item) => InkWell(
              borderRadius: AppTheme.radius.small,
              onTap: () {
                NavigatorService.push(context: context, route: item.path);
              },
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  item.name,
                  style: AppTheme.typography.labelMedium,
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
