import 'package:flutter/material.dart';

import '../../routes/services/navigator_service.dart';
import '../themes/app_theme.dart';

class ModalBottomWidget {
  static void basic({
    required BuildContext context,
    bool useSafeArea = false,
    bool useFullScreen = true,
    bool isScrollControlled = true,
    bool? showDragHandle = true,
    bool showCloseIcon = false,
    bool enableDrag = true,
    String? title,
    double? height,
    required Widget child,
  }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      isScrollControlled: isScrollControlled,
      showDragHandle: showDragHandle,
      enableDrag: enableDrag,
      useSafeArea: useSafeArea,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      builder: (BuildContext contextModal) {
        return Container(
          height: height,
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.symmetric(vertical: 4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Builder(builder: (context) {
                      if (title != null) {
                        return Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: Text(
                              title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: AppTheme.typography.titleMedium,
                            ),
                          ),
                        );
                      } else {
                        return Container();
                      }
                    }),
                    Builder(builder: (context) {
                      if (!showCloseIcon) {
                        return Container();
                      }
                      return IconButton(
                        onPressed: () {
                          NavigatorService.pop(context);
                        },
                        icon: const Icon(
                          Icons.close,
                          color: Colors.black,
                        ),
                      );
                    }),
                  ],
                ),
              ),
              Builder(builder: (context) {
                if (useFullScreen) {
                  return Expanded(child: child);
                }
                return child;
              }),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }
}
