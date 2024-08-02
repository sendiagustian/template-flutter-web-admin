import 'package:flutter/material.dart';

import '../constants/enums/type_enums.dart';
import '../themes/app_theme.dart';
import '../utils/app_util.dart';
import 'customs/loading_indicator_custom_widget.dart';

class DialogWidget {
  static Future<dynamic> info({
    required BuildContext context,
    Widget? image,
    required String title,
    required String desc,
    required List<Widget> buttons,
    bool isDismissible = true,
  }) async {
    final ScrollController scrollController = ScrollController();
    return await showGeneralDialog(
      context: context,
      barrierDismissible: isDismissible,
      transitionDuration: const Duration(milliseconds: 150),
      barrierLabel: '',
      barrierColor: Colors.black.withOpacity(0.6),
      pageBuilder: (context, animation1, animation2) {
        return Container();
      },
      transitionBuilder: (BuildContext context, a1, a2, widget) {
        return PopScope(
          canPop: isDismissible,
          child: Transform.scale(
            scale: a1.value,
            child: Opacity(
              opacity: a1.value,
              child: StatefulBuilder(
                builder: (context, setState) {
                  return AlertDialog(
                    actionsPadding: AppTheme.geometry.custom(top: 16, bottom: 16, left: 16, right: 24),
                    actionsOverflowButtonSpacing: 16,
                    backgroundColor: Colors.white.withOpacity(0.9),
                    shape: RoundedRectangleBorder(
                      borderRadius: AppTheme.radius.exSmall,
                    ),
                    content: SingleChildScrollView(
                      controller: scrollController,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Center(child: image ?? const SizedBox()),
                          if (image != null) AppTheme.spacing.largeY,
                          Center(
                            child: Text(
                              title,
                              textAlign: TextAlign.center,
                              style: AppTheme.typography.displayMedium,
                            ),
                          ),
                          AppTheme.spacing.mediumY,
                          Center(
                            child: Text(
                              desc,
                              textAlign: TextAlign.center,
                              style: AppTheme.typography.bodySmall,
                            ),
                          ),
                        ],
                      ),
                    ),
                    actions: buttons,
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }

  static Future<dynamic> form({
    required BuildContext context,
    required String title,
    required Widget child,
    required Function() onSubmit,
  }) async {
    return await showGeneralDialog(
      context: context,
      barrierDismissible: true,
      transitionDuration: const Duration(milliseconds: 150),
      barrierLabel: '',
      barrierColor: Colors.black.withOpacity(0.6),
      pageBuilder: (context, animation1, animation2) {
        return Container();
      },
      transitionBuilder: (BuildContext context, a1, a2, widget) {
        return PopScope(
          canPop: true,
          child: Transform.scale(
            scale: a1.value,
            child: Opacity(
              opacity: a1.value,
              child: StatefulBuilder(
                builder: (context, setState) {
                  double width = MediaQuery.of(context).size.width;
                  return AlertDialog(
                    actionsOverflowButtonSpacing: 16,
                    backgroundColor: AppTheme.colors.bgLight,
                    title: Text(title, style: AppTheme.typography.displayMedium),
                    shape: RoundedRectangleBorder(borderRadius: AppTheme.radius.exSmall),
                    actionsPadding: AppTheme.geometry.custom(top: 16, bottom: 16, left: 16, right: 24),
                    content: Container(
                      constraints: BoxConstraints(
                        minWidth: isLargeScreen(context) ? width * 0.4 : width * 0.8,
                        maxHeight: MediaQuery.of(context).size.height * 0.7,
                      ),
                      child: child,
                    ),
                    actions: [
                      button(
                        text: 'Cancel',
                        type: ButtonType.secondary,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      button(
                        text: 'Submit',
                        type: ButtonType.primary,
                        onPressed: onSubmit,
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }

  static Future<dynamic> widget({
    required BuildContext context,
    Widget? image,
    Widget? title,
    required Widget content,
    List<Widget>? buttons,
    TextAlign? contentTextAlign,
    bool isDismissible = true,
  }) async {
    return await showGeneralDialog(
      context: context,
      barrierDismissible: isDismissible,
      transitionDuration: const Duration(milliseconds: 150),
      barrierLabel: '',
      barrierColor: Colors.black.withOpacity(0.6),
      pageBuilder: (context, animation1, animation2) {
        return Container();
      },
      transitionBuilder: (BuildContext context, a1, a2, widget) {
        return PopScope(
          onPopInvoked: (p) async => isDismissible,
          child: SafeArea(
            child: Transform.scale(
              scale: a1.value,
              child: Opacity(
                opacity: a1.value,
                child: StatefulBuilder(
                  builder: (context, setState) {
                    return AlertDialog(
                      title: title,
                      backgroundColor: Colors.white.withOpacity(0.9),
                      shape: RoundedRectangleBorder(borderRadius: AppTheme.radius.exSmall),
                      content: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            image ?? Container(),
                            content,
                          ],
                        ),
                      ),
                      actions: buttons,
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  // Widget untuk memanggil full dialog isi [loadingText] jika ingin menggunakan title loading
  static loadingPageIndicator({
    required BuildContext context,
    String loadingText = '',
    double loadingSize = 50,
  }) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      transitionDuration: const Duration(milliseconds: 100),
      barrierLabel: '',
      barrierColor: Colors.black.withOpacity(0.6),
      pageBuilder: (context, animation1, animation2) {
        return Container();
      },
      transitionBuilder: (BuildContext context, a1, a2, widget) {
        return Transform.scale(
          scale: a1.value,
          child: Opacity(
            opacity: a1.value,
            child: LoadingIndicatorCustomWidget(
              loadingText: loadingText,
              loadingSize: loadingSize,
            ),
          ),
        );
      },
    );
  }

  static Widget button({
    required String text,
    required ButtonType type,
    Color? textColor,
    required Function() onPressed,
  }) {
    Color backgroundColor;
    Color overlayColor;
    Color textColor;
    BoxDecoration decoration;

    if (type == ButtonType.primary) {
      backgroundColor = AppTheme.colors.primary;
      overlayColor = AppTheme.colors.bgDark.withOpacity(0.15);
      textColor = Colors.white;
      decoration = BoxDecoration(
        borderRadius: AppTheme.radius.small,
      );
    } else if (type == ButtonType.secondary) {
      textColor = AppTheme.colors.primary;
      backgroundColor = Colors.white;
      overlayColor = Colors.black12;
      decoration = BoxDecoration(
        borderRadius: AppTheme.radius.small,
        border: Border.all(
          width: 1.5,
          color: AppTheme.colors.primary,
        ),
      );
    } else {
      backgroundColor = Colors.grey[400]!;
      overlayColor = Colors.grey[700]!;
      textColor = Colors.white;
      decoration = BoxDecoration(
        borderRadius: AppTheme.radius.small,
      );
    }

    return Material(
      color: backgroundColor,
      borderRadius: AppTheme.radius.small,
      child: InkWell(
        borderRadius: AppTheme.radius.small,
        overlayColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.pressed)) {
              return overlayColor;
            }
            return null;
          },
        ),
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: decoration,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: AppTheme.typography.labelMedium.copyWith(color: textColor),
          ),
        ),
      ),
    );
  }
}
