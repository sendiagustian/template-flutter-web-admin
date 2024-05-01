import 'package:flutter/material.dart';

import '../../routes/components/route_item.dart';
import '../providers/sidebar_provider.dart';
import '../services/navigator_service.dart';
import '../themes/app_theme.dart';

class SidebarWidget extends StatelessWidget {
  final RouteItem initialSelectedItem;
  final ScrollController scrollController;
  final SidebarProvider sidebarProvider;
  final List<RouteItem> items;

  const SidebarWidget({
    super.key,
    required this.initialSelectedItem,
    required this.scrollController,
    required this.sidebarProvider,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    List<String> categories = items.map((e) => e.category!).toSet().toList();

    return Material(
      color: AppTheme.colors.bgDark,
      child: SizedBox(
        width: 300,
        child: Column(
          children: [
            _buildLogoTitle(),
            Expanded(
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  children: [
                    AppTheme.spacing.customY(30),
                    ...List.generate(categories.length, (index) {
                      String category = categories[index];
                      List<RouteItem> menus = items.where((e) => e.category == category).toList();

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 16),
                            child: Text(
                              category,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          AppTheme.spacing.smallY,
                          ...List.generate(menus.length, (index) {
                            final item = menus[index];
                            return buildItemMenu(
                              context: context,
                              sidebarProvider: sidebarProvider,
                              initialSelectedItem: initialSelectedItem,
                              item: item,
                              index: index,
                            );
                          }),
                          AppTheme.spacing.customY(18),
                        ],
                      );
                    })
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildItemMenu({
    required BuildContext context,
    required SidebarProvider sidebarProvider,
    required RouteItem initialSelectedItem,
    required RouteItem item,
    required int index,
  }) {
    bool isSelected = initialSelectedItem.path == item.path;
    List<RouteItem> subRoutes = item.subRoutes;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
          decoration: BoxDecoration(
            borderRadius: AppTheme.radius.small,
            color: isSelected ? Colors.white.withOpacity(.1) : null,
          ),
          child: InkWell(
            borderRadius: AppTheme.radius.small,
            onTap: () {
              if (item.subRoutes.isEmpty) {
                sidebarProvider.selectedMainMenu = item;
                NavigatorService.push(context: context, route: item.path);
              } else {
                sidebarProvider.expandSubMenu = item;
              }
            },
            hoverColor: Colors.white.withOpacity(.1),
            overlayColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) {
                  return Colors.white.withOpacity(.1);
                }
                return null;
              },
            ),
            child: Container(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Icon(item.icon, color: Colors.white),
                  AppTheme.spacing.smallX,
                  Expanded(
                    child: Text(
                      item.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Builder(builder: (context) {
                    if (subRoutes.isNotEmpty) {
                      return Builder(builder: (context) {
                        if (isSelected) {
                          return const Icon(
                            Icons.keyboard_arrow_up_rounded,
                            color: Colors.white,
                          );
                        } else {
                          return const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: Colors.white,
                          );
                        }
                      });
                    }
                    return const SizedBox();
                  }),
                ],
              ),
            ),
          ),
        ),
        Builder(builder: (context) {
          bool expandSubMenu = sidebarProvider.expandSubMenu?.subRoutes == subRoutes;
          if (expandSubMenu) {
            return _buildSubItemMenu(context, sidebarProvider, item, subRoutes);
          }
          return const SizedBox();
        }),
      ],
    );
  }

  Widget _buildSubItemMenu(
    BuildContext context,
    SidebarProvider sidebarProvider,
    RouteItem mainRoute,
    List<RouteItem> subRoutes,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(subRoutes.length, (index) {
        final item = subRoutes[index];
        bool isSelected = sidebarProvider.selectedSubMenu?.path == item.path;
        return Container(
          margin: const EdgeInsets.only(left: 62),
          padding: const EdgeInsets.all(12),
          child: SubItemText(
            text: item.name,
            hoverColor: Colors.white,
            defaultColor: isSelected ? Colors.white : Colors.white60,
            onTap: () {
              sidebarProvider.expandSubMenu = mainRoute;
              sidebarProvider.selectedSubMenu = item;
              NavigatorService.push(
                context: context,
                route: "${mainRoute.path}${item.path}",
              );
            },
          ),
        );
      }),
    );
  }

  Widget _buildLogoTitle() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
      height: 60,
      child: Center(
        child: Row(
          children: [
            Image.asset(
              'assets/icons/icon_app.png',
              height: 35,
            ),
            const Expanded(
              child: Text(
                "Tong Nyampah",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SubItemText extends StatefulWidget {
  final String text;
  final Color defaultColor;
  final Color hoverColor;
  final void Function()? onTap;

  const SubItemText({
    super.key,
    required this.text,
    required this.defaultColor,
    required this.hoverColor,
    this.onTap,
  });

  @override
  State<SubItemText> createState() => SubItemTextState();
}

class SubItemTextState extends State<SubItemText> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: _isHovered ? SystemMouseCursors.click : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Text(
          widget.text,
          style: TextStyle(
            color: _isHovered ? widget.hoverColor : widget.defaultColor,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
