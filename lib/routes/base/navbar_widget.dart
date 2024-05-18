import 'package:flutter/material.dart';

import '../items/profile_item.dart';
import 'icon_profile_widget.dart';
import '../items/route_item.dart';
import '../services/navigator_service.dart';
import '../../core/themes/app_theme.dart';
import '../../core/utils/app_util.dart';
import '../../core/widgets/breadcrumb_widget.dart';

class NavbarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<RouteItem> navItems;
  final List<ProfileItem> profileItems;
  final void Function()? onMobileMenuTap;

  const NavbarWidget({
    super.key,
    required this.navItems,
    required this.profileItems,
    this.title,
    this.onMobileMenuTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: _buildLeading(isLargeScreen(context)),
      actions: [
        Padding(
          padding: AppTheme.geometry.mediumR,
          child: CircleAvatar(
            child: IconProfileWidget(
              profileIcon: const Icon(Icons.person),
              heightItemMenu: profileItems.length * 65,
              items: profileItems,
            ),
          ),
        )
      ],
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (navItems.isEmpty)
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: BreadcrumbsWidget(title: title),
              ),
            ),
          if (isLargeScreen(context))
            Expanded(
              child: _navBarItems(context),
            ),
        ],
      ),
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
