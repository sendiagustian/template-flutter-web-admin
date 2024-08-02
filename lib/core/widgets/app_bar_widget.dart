import 'package:flutter/material.dart';

import '../themes/app_theme.dart';
import 'customs/app_bar_custom_widget.dart';

class AppBarWidget {
  static PreferredSizeWidget gradient({
    Key? key,
    required String title,
    bool automaticallyImplyLeading = true,
    TextStyle? titleStyle,
    bool? centerTitle = true,
    Widget? leading,
    double elevation = 2.0,
    List<Widget>? actions,
  }) {
    return AppBarCustomWidget(
      key: key,
      title: Text(
        title,
        style: titleStyle ?? AppTheme.typography.titleLarge.copyWith(color: Colors.white),
      ),
      automaticallyImplyLeading: automaticallyImplyLeading,
      elevation: elevation,
      centerTitle: centerTitle,
      leading: leading,
      actions: actions,
    );
  }

  static PreferredSizeWidget basic({
    Key? key,
    required String title,
    bool automaticallyImplyLeading = true,
    bool? centerTitle = true,
    Widget? leading,
    double elevation = 2.0,
    Color? backgroundColor,
    List<Widget>? actions,
  }) {
    return AppBarCustomWidget(
      key: key,
      title: Text(
        title,
        style: AppTheme.typography.titleLarge.copyWith(color: Colors.white),
      ),
      automaticallyImplyLeading: automaticallyImplyLeading,
      elevation: elevation,
      backgroundColor: backgroundColor ?? AppTheme.colors.primary,
      centerTitle: centerTitle,
      leading: leading,
      actions: actions,
    );
  }
}
