import 'package:flutter/material.dart';

import '../../core/widgets/hovers/text_hover_widget.dart';
import '../items/route_item.dart';
import '../providers/sidebar_provider.dart';
import '../services/navigator_service.dart';
import '../../core/themes/app_theme.dart';
import '../../core/utils/app_util.dart';

class SidebarWidget extends StatelessWidget {
  final RouteItem initialSelectedItem;
  final ScrollController? scrollController;
  final SidebarProvider sidebarProvider;
  final List<RouteItem> items;

  const SidebarWidget({
    super.key,
    required this.initialSelectedItem,
    this.scrollController,
    required this.sidebarProvider,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    List<String> categories = items.map((e) => e.category!).toSet().toList();

    return SafeArea(
      child: Row(
        children: [
          Material(
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
                                  margin: AppTheme.geometry.mediumL,
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
          ),
          Builder(builder: (context) {
            if (!isLargeScreen(context)) {
              return IconButton(
                onPressed: () {
                  sidebarProvider.showMobileMenu = false;
                },
                icon: const Icon(
                  Icons.close,
                  size: 24,
                  color: Colors.white,
                ),
              );
            }
            return const SizedBox();
          })
        ],
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
    List<RouteItem> subRoutes = item.subRoutes;
    bool isSelected = initialSelectedItem.path == item.path;
    bool expandSubMenu = sidebarProvider.expandSubMenu?.subRoutes == subRoutes;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: AppTheme.geometry.custom(left: 16, right: 16, top: 2, bottom: 2),
          decoration: BoxDecoration(
            borderRadius: AppTheme.radius.exSmall,
            color: isSelected ? Colors.white.withOpacity(.1) : null,
          ),
          child: InkWell(
            borderRadius: AppTheme.radius.exSmall,
            onTap: () {
              if (item.subRoutes.isEmpty) {
                sidebarProvider.selectedMainMenu = item;
                NavigatorService.push(context: context, route: item.path);
              } else {
                sidebarProvider.expandSubMenu = item;
              }
            },
            hoverColor: Colors.white.withOpacity(.1),
            overlayColor: WidgetStateProperty.resolveWith<Color?>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.pressed)) {
                  return Colors.white.withOpacity(.1);
                }
                return null;
              },
            ),
            child: Container(
              padding: AppTheme.geometry.customAll(12),
              child: Row(
                children: [
                  Icon(item.icon, color: Colors.white),
                  AppTheme.spacing.mediumX,
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
                        if (!expandSubMenu) {
                          return const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: Colors.white,
                          );
                        } else {
                          return const Icon(
                            Icons.keyboard_arrow_up_rounded,
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
          margin: AppTheme.geometry.custom(left: 60),
          padding: AppTheme.geometry.customAll(12),
          child: TextHoverWidget(
            text: item.name,
            hoverColor: Colors.white,
            defaultColor: isSelected ? Colors.white : Colors.white60,
            onTap: () {
              sidebarProvider.expandSubMenu = mainRoute;
              sidebarProvider.selectedSubMenu = item;
              NavigatorService.push(
                context: context,
                route: item.path,
              );
            },
          ),
        );
      }),
    );
  }

  Widget _buildLogoTitle() {
    return Container(
      padding: AppTheme.geometry.custom(left: 16, right: 16, top: 4, bottom: 4),
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
