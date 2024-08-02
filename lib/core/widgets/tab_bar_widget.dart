import 'package:flutter/material.dart';

import '../themes/app_theme.dart';
import 'customs/tab_bar_custom_widget.dart';
import 'hovers/tab_bar_hover_widget.dart';

class TabBarWidget {
  static Widget basic({
    required void Function(int) onTap,
    required List<String> items,
  }) {
    return TabBarCustomWidget(
      onTap: onTap,
      tabs: items.map((item) {
        return item;
      }).toList(),
    );
  }

  static Widget card({
    required int currentIndex,
    required List<TabItem> items,
    required void Function(int) onChange,
  }) {
    return Column(
      children: [
        Row(
          children: List.generate(
            items.length,
            (index) {
              bool isLast = index == items.length - 1;

              return GestureDetector(
                onTap: () {
                  onChange(index);
                },
                child: TabBarHoverWidget(
                  label: items[index].label,
                  isSelected: (index == currentIndex),
                  padding: AppTheme.geometry.custom(left: 18, right: 18, top: 12, bottom: 12),
                  margin: !isLast ? AppTheme.geometry.exSmallR : null,
                  decoration: BoxDecoration(
                    boxShadow: AppTheme.boxShadows.basic,
                    borderRadius: AppTheme.radius.custom(topLeft: 8, topRight: 8),
                  ),
                ),
              );
            },
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: AppTheme.radius.custom(bottomLeft: 8, bottomRight: 8, topRight: 8),
          ),
          child: items[currentIndex].body,
        )
      ],
    );
  }
}

class TabItem {
  final String label;
  final Widget body;

  TabItem({required this.label, required this.body});
}
