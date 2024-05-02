import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../themes/app_theme.dart';

enum ButtonType { primary, secondary, disable }

class ButtonWidget {
  static Widget basic({
    required String text,
    required ButtonType type,
    Color? textColor,
    Color? iconColor,
    double? width,
    double height = 50,
    IconData? leftIcon,
    IconData? rightIcon,
    double? fontsize,
    Function()? onPressed,
    MainAxisAlignment? alignment,
  }) {
    Decoration? decoration;
    Color backgroundColor;
    Color overlayColor;

    if (type == ButtonType.primary) {
      backgroundColor = AppTheme.colors.primary;
      overlayColor = AppTheme.colors.bgDark.withOpacity(0.15);
      decoration = BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      );
    } else if (type == ButtonType.secondary) {
      textColor = textColor ?? AppTheme.colors.primary;
      iconColor = iconColor ?? AppTheme.colors.primary;
      backgroundColor = Colors.white;
      overlayColor = Colors.black12;
      decoration = BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          width: 1.5,
          color: AppTheme.colors.primary,
        ),
      );
    } else {
      backgroundColor = Colors.grey[600]!;
      overlayColor = Colors.grey[700]!;
      decoration = BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      );
    }

    assert(type == ButtonType.disable ? onPressed == null : true);
    return Material(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        overlayColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return overlayColor;
            }
            return null;
          },
        ),
        onTap: onPressed,
        child: Container(
          decoration: decoration,
          height: height,
          width: width ?? 1.sw,
          child: Row(
            mainAxisAlignment: alignment ?? MainAxisAlignment.center,
            children: [
              Builder(builder: (context) {
                if (leftIcon != null) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Icon(
                      leftIcon,
                      size: 25,
                      color: iconColor ?? Colors.white,
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              }),
              Text(
                text,
                style: TextStyle(
                  color: textColor ?? Colors.white,
                  fontSize: fontsize ?? 18,
                ),
              ),
              Builder(builder: (context) {
                if (rightIcon != null) {
                  return Icon(
                    rightIcon,
                    size: 25,
                    color: iconColor ?? Colors.white,
                  );
                } else {
                  return const SizedBox();
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
