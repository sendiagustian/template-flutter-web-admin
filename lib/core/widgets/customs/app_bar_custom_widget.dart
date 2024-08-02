import 'package:flutter/material.dart';

import '../../themes/app_theme.dart';

class AppBarCustomWidget extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final bool? centerTitle;
  final Widget? leading;
  final Color? backgroundColor;
  final List<Widget>? actions;
  final double elevation;
  final bool automaticallyImplyLeading;

  const AppBarCustomWidget({
    super.key,
    this.title,
    this.centerTitle,
    this.leading,
    this.actions,
    this.backgroundColor,
    this.automaticallyImplyLeading = true,
    this.elevation = 2.0,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          gradient: backgroundColor != null ? null : AppTheme.colors.gradientPrimary,
        ),
        child: AppBar(
          automaticallyImplyLeading: automaticallyImplyLeading,
          centerTitle: centerTitle,
          leading: leading,
          elevation: 0.0,
          title: title,
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.transparent,
          actions: actions,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
