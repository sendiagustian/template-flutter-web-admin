import 'package:flutter/material.dart';

import '../../themes/app_theme.dart';

class TabBarCustomWidget extends StatelessWidget {
  final void Function(int)? onTap;
  final List<String> tabs;
  final double? height;
  final double? width;
  final TabAlignment? tabAlignment;
  final ScrollPhysics? physics;

  const TabBarCustomWidget({
    super.key,
    required this.onTap,
    required this.tabs,
    this.height = 50,
    this.width,
    this.tabAlignment,
    this.physics,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width ?? AppTheme.double.screenW(context),
      child: TabBar(
        isScrollable: true,
        padding: EdgeInsets.zero,
        indicatorPadding: EdgeInsets.zero,
        dividerColor: Colors.grey[400],
        dividerHeight: 0.8,
        tabAlignment: TabAlignment.start,
        physics: const BouncingScrollPhysics(),
        onTap: onTap,
        tabs: tabs.map((item) {
          return Tab(
            child: Text(
              item,
              style: AppTheme.typography.labelLarge,
            ),
          );
        }).toList(),
      ),
    );
  }
}
