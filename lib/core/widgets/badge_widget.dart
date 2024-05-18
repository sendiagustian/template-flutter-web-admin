import 'package:flutter/material.dart';

import '../themes/app_theme.dart';

class BadgeWidget {
  BadgeWidget();

  static bool _isSelected(int index, int currentMenu) {
    if (currentMenu == index) {
      return true;
    } else {
      return false;
    }
  }

  static TextStyle _labelStyle(int index, int currentMenu) {
    if (currentMenu == index) {
      return const TextStyle(color: Colors.white, fontSize: 12.0);
    } else {
      return const TextStyle(color: Colors.black, fontSize: 12.0);
    }
  }

  static Widget build({
    required BuildContext context,
    required int currentMenu,
    required Function(int) onTap,
    required List<String> menus,
    TextStyle? textStyle,
  }) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          menus.length,
          (index) {
            bool isSelected = currentMenu == index;
            return Container(
              margin: (index == menus.length - 1) ? null : AppTheme.geometry.smallR,
              child: ChoiceChip(
                showCheckmark: false,
                label: Text(
                  menus[index],
                  style: textStyle?.copyWith(color: isSelected ? Colors.white : Colors.black),
                ),
                backgroundColor: Colors.white,
                selectedColor: AppTheme.colors.primary,
                padding: AppTheme.geometry.small,
                labelStyle: _labelStyle(index, currentMenu),
                selected: _isSelected(index, currentMenu),
                shape: RoundedRectangleBorder(
                  borderRadius: AppTheme.radius.small,
                ),
                onSelected: (value) {
                  onTap(index);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
