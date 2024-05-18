import 'package:flutter/material.dart';
import 'package:popover/popover.dart';

import 'card_widget.dart';

class PopoverWidget {
  static Future<void> cardInfo({
    required BuildContext context,
    required String title,
    required String description,
    required PopoverDirection direction,
    double contentWidth = 300,
    double contentHeight = 200,
  }) {
    return showPopover(
      context: context,
      arrowHeight: 10,
      arrowWidth: 16,
      direction: direction,
      constraints: BoxConstraints(maxWidth: contentWidth, maxHeight: contentHeight),
      bodyBuilder: (context) {
        return CardWidget.basic(
          title: title,
          titleAlignment: TextAlign.center,
          children: [
            Text(description, textAlign: TextAlign.center),
          ],
        );
      },
    );
  }
}
