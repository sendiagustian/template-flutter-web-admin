import 'package:flutter/material.dart';

import '../constants/enums/type_enums.dart';
import '../themes/app_theme.dart';

class ButtonWidget {
  static Widget ractangle({
    required String text,
    required ButtonType type,
    Color? textColor,
    Color? iconColor,
    Color? backgroundColor,
    double? width,
    double height = 50,
    IconData? leftIcon,
    IconData? rightIcon,
    double? fontsize,
    Function()? onPressed,
    MainAxisAlignment? alignment,
  }) {
    Decoration? decoration;
    Color buttonColor;
    Color overlayColor;

    if (type == ButtonType.primary) {
      buttonColor = backgroundColor ?? AppTheme.colors.primary;
      overlayColor = AppTheme.colors.bgDark.withOpacity(0.15);
      decoration = BoxDecoration(
        borderRadius: AppTheme.radius.exSmall,
      );
    } else if (type == ButtonType.gradient) {
      buttonColor = Colors.transparent;
      overlayColor = AppTheme.colors.bgDark.withOpacity(0.15);
      decoration = BoxDecoration(
        borderRadius: AppTheme.radius.exSmall,
        gradient: AppTheme.colors.gradientPrimary,
      );
    } else if (type == ButtonType.secondary) {
      textColor = textColor ?? AppTheme.colors.primary;
      iconColor = iconColor ?? AppTheme.colors.primary;
      buttonColor = backgroundColor ?? Colors.white;
      overlayColor = Colors.black12;
      decoration = BoxDecoration(
        borderRadius: AppTheme.radius.exSmall,
        border: Border.all(
          width: 1.5,
          color: AppTheme.colors.primary,
        ),
      );
    } else {
      buttonColor = backgroundColor ?? Colors.grey[400]!;
      overlayColor = Colors.grey[700]!;
      decoration = BoxDecoration(
        borderRadius: AppTheme.radius.exSmall,
      );
    }

    assert(type == ButtonType.disable ? onPressed == null : true);
    return Material(
      color: buttonColor,
      borderRadius: AppTheme.radius.exSmall,
      child: InkWell(
        borderRadius: AppTheme.radius.exSmall,
        overlayColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.pressed)) {
              return overlayColor;
            }
            return null;
          },
        ),
        onTap: onPressed,
        child: IntrinsicWidth(
          child: Container(
            width: width,
            height: height,
            decoration: decoration,
            padding: AppTheme.geometry.custom(left: 14, right: 14),
            child: Row(
              mainAxisAlignment: alignment ?? MainAxisAlignment.center,
              children: [
                Builder(builder: (context) {
                  if (leftIcon != null) {
                    return Container(
                      padding: AppTheme.geometry.smallR,
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
                    return Container(
                      padding: AppTheme.geometry.exSmallL,
                      child: Icon(
                        rightIcon,
                        size: 25,
                        color: iconColor ?? Colors.white,
                      ),
                    );
                  } else {
                    return const SizedBox();
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
