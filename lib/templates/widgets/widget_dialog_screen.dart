import 'package:flutter/material.dart';

import '../../core/constants/enums/type_enums.dart';
import '../../core/themes/app_theme.dart';
import '../../core/widgets/button_widget.dart';
import '../../core/widgets/card_widget.dart';
import '../../core/widgets/dialog_widget.dart';

class WidgetDialogScreen extends StatelessWidget {
  const WidgetDialogScreen({super.key});

  static const String path = '/widgets/widget-dialog';
  static const String name = 'Dialog Widget';
  static const String category = 'Widgets';
  static const IconData icon = Icons.notifications_active_rounded;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: AppTheme.geometry.medium,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Dialog Widgets",
              style: AppTheme.typography.displayMedium,
            ),
            AppTheme.spacing.customY(24),
            CardWidget.basic(
              title: "Dialog Sample",
              children: [
                ButtonWidget.ractangle(
                  text: "Show Dialog",
                  type: ButtonType.primary,
                  onPressed: () {
                    DialogWidget.info(
                      context: context,
                      title: "Halo!",
                      desc: "This is a dialog sample. Do you like it? 😊",
                      buttons: [
                        DialogWidget.button(
                          text: "OK",
                          type: ButtonType.primary,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    );
                  },
                ),
                AppTheme.spacing.mediumY,
                ButtonWidget.ractangle(
                  text: "Show Dialog with Image",
                  type: ButtonType.primary,
                  onPressed: () {
                    DialogWidget.info(
                      context: context,
                      image: Image.asset("assets/icons/icon_app.png"),
                      title: "Halo!",
                      desc: "This is a dialog sample. Do you like it? 😊",
                      buttons: [
                        DialogWidget.button(
                          text: "Yes",
                          type: ButtonType.primary,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        DialogWidget.button(
                          text: "No",
                          type: ButtonType.secondary,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
