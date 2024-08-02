import 'package:flutter/material.dart';

import '../themes/app_theme.dart';

class ListTileWidget {
  static Widget basic({
    required BuildContext context,
    required List<Widget> content,
    Widget? leading,
    Widget? trailing,
    bool withColorLeading = false,
    String? title,
    Function()? onTapDetail,
    List<BoxShadow>? boxShadow,
    double? height,
    int? maxLineTitle,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: AppTheme.radius.exSmall,
        boxShadow: boxShadow ?? AppTheme.boxShadows.basic,
      ),
      child: Material(
        borderRadius: AppTheme.radius.exSmall,
        color: Colors.white,
        elevation: 0,
        child: InkWell(
          borderRadius: AppTheme.radius.exSmall,
          onTap: onTapDetail,
          overlayColor: WidgetStateProperty.resolveWith<Color?>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.hovered)) {
                return Colors.black.withOpacity(0.05);
              } else if (states.contains(WidgetState.pressed)) {
                return Colors.black.withOpacity(0.1);
              }
              return null;
            },
          ),
          child: Container(
            height: height,
            padding: AppTheme.geometry.custom(left: 12, top: 12, right: 8, bottom: 12),
            child: Row(
              crossAxisAlignment: (content.length > 2) ? CrossAxisAlignment.start : CrossAxisAlignment.center,
              children: [
                Builder(builder: (context) {
                  if (leading != null) {
                    if (withColorLeading) {
                      return Container(
                        height: 70,
                        width: 70,
                        padding: AppTheme.geometry.medium,
                        decoration: BoxDecoration(
                          color: AppTheme.colors.primary,
                          borderRadius: AppTheme.radius.circle,
                        ),
                        child: Center(child: leading),
                      );
                    }
                    return leading;
                  } else {
                    return const SizedBox();
                  }
                }),
                AppTheme.spacing.mediumX,
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Builder(builder: (context) {
                        if (title != null) {
                          return Text(
                            title,
                            maxLines: maxLineTitle ?? 2,
                            overflow: TextOverflow.ellipsis,
                            style: AppTheme.typography.titleSmall,
                          );
                        } else {
                          return const SizedBox();
                        }
                      }),
                      ...content,
                    ],
                  ),
                ),
                Builder(builder: (context) {
                  if (trailing != null) {
                    return trailing;
                  }
                  return const SizedBox();
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
