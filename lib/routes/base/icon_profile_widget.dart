import 'package:flutter/material.dart';
import 'package:popover/popover.dart';

import '../../core/themes/app_theme.dart';
import '../../core/widgets/hovers/text_hover_widget.dart';
import '../items/profile_item.dart';
import '../services/navigator_service.dart';

class IconProfileWidget extends StatelessWidget {
  final Widget profileIcon;
  final double heightItemMenu;
  final double? arrowDyOffset;
  final List<ProfileItem> items;

  const IconProfileWidget({
    super.key,
    required this.profileIcon,
    required this.heightItemMenu,
    this.arrowDyOffset,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _buildProfileMenu(context),
      child: profileIcon,
    );
  }

  void Function()? _buildProfileMenu(BuildContext context) {
    return () {
      showPopover(
        context: context,
        arrowWidth: 15,
        arrowHeight: 15,
        arrowDyOffset: arrowDyOffset ?? 12,
        direction: PopoverDirection.bottom,
        barrierColor: Colors.transparent,
        constraints: BoxConstraints(maxWidth: 230, maxHeight: heightItemMenu),
        bodyBuilder: (context) {
          return Column(
            children: [
              ...List.generate(items.length, (index) {
                ProfileItem item = items[index];
                bool isFirstItem = index == 0;
                bool isLastItem = index == items.length - 1;
                bool is2LastItem = index == items.length - 2;
                return Column(
                  children: [
                    if (isLastItem)
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              color: Colors.grey[200]!,
                            ),
                          ),
                        ),
                      ),
                    InkWell(
                      borderRadius: AppTheme.radius.exSmall,
                      onTap: () {
                        NavigatorService.pop(context);
                        item.onTap();
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
                        margin: AppTheme.geometry.custom(
                          left: 16,
                          right: 16,
                          top: (isFirstItem || isLastItem) ? 8 : 0,
                          bottom: is2LastItem ? 8 : 0,
                        ),
                        padding: AppTheme.geometry.customAll(12),
                        child: TextHoverWidget(
                          text: item.name,
                          icon: item.icon,
                          defaultColor: AppTheme.colors.textPrimary,
                          hoverColor: AppTheme.colors.primary,
                        ),
                      ),
                    ),
                  ],
                );
              })
            ],
          );
        },
      );
    };
  }
}
