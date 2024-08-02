import 'package:flutter/material.dart';

import '../../core/constants/enums/type_enums.dart';
import '../../core/themes/app_theme.dart';
import '../../core/widgets/button_widget.dart';
import '../../core/widgets/card_widget.dart';

class WidgetButtonScreen extends StatelessWidget {
  const WidgetButtonScreen({super.key});

  static const String path = '/widgets/widget-button';
  static const String name = 'Button Widget';
  static const String category = 'Widgets';
  static const IconData icon = Icons.smart_button_rounded;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: AppTheme.geometry.medium,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Buttons Widgets",
              style: AppTheme.typography.displayMedium,
            ),
            AppTheme.spacing.customY(24),
            CardWidget.basic(
              title: "Normal Button",
              children: [
                const Text("Width No Set"),
                AppTheme.spacing.smallY,
                Wrap(
                  runSpacing: 16,
                  spacing: 16,
                  children: [
                    ButtonWidget.ractangle(
                      text: "Primary",
                      type: ButtonType.primary,
                      onPressed: () {},
                    ),
                    ButtonWidget.ractangle(
                      text: "Secondary",
                      type: ButtonType.secondary,
                      onPressed: () {},
                    ),
                    ButtonWidget.ractangle(
                      text: "Disable",
                      type: ButtonType.disable,
                    ),
                  ],
                ),
                AppTheme.spacing.smallY,
                const Text("Width Seted 300"),
                AppTheme.spacing.smallY,
                Wrap(
                  runSpacing: 16,
                  spacing: 16,
                  children: [
                    ButtonWidget.ractangle(
                      text: "Primary",
                      width: 300,
                      type: ButtonType.primary,
                      onPressed: () {},
                    ),
                    ButtonWidget.ractangle(
                      text: "Secondary",
                      width: 300,
                      type: ButtonType.secondary,
                      onPressed: () {},
                    ),
                    ButtonWidget.ractangle(
                      text: "Disable",
                      width: 300,
                      type: ButtonType.disable,
                    ),
                  ],
                ),
                AppTheme.spacing.smallY,
                const Text("Infinity Width"),
                AppTheme.spacing.smallY,
                ButtonWidget.ractangle(
                  text: "Primary",
                  width: AppTheme.double.screenW(context),
                  type: ButtonType.primary,
                  onPressed: () {},
                ),
                AppTheme.spacing.smallY,
                ButtonWidget.ractangle(
                  text: "Secondary",
                  width: AppTheme.double.screenW(context),
                  type: ButtonType.secondary,
                  onPressed: () {},
                ),
                AppTheme.spacing.smallY,
                ButtonWidget.ractangle(
                  text: "Disable",
                  width: AppTheme.double.screenW(context),
                  type: ButtonType.disable,
                ),
              ],
            ),
            AppTheme.spacing.customY(16),
            CardWidget.basic(
              title: "Icon Button",
              children: [
                const Text("Width No Set"),
                AppTheme.spacing.smallY,
                Wrap(
                  runSpacing: 16,
                  spacing: 16,
                  children: [
                    ButtonWidget.ractangle(
                      text: "Primary",
                      leftIcon: Icons.add,
                      type: ButtonType.primary,
                      onPressed: () {},
                    ),
                    AppTheme.spacing.customX(12),
                    ButtonWidget.ractangle(
                      text: "Secondary",
                      leftIcon: Icons.add,
                      type: ButtonType.secondary,
                      onPressed: () {},
                    ),
                    AppTheme.spacing.customX(12),
                    ButtonWidget.ractangle(
                      text: "Disable",
                      leftIcon: Icons.add,
                      type: ButtonType.disable,
                    ),
                  ],
                ),
                AppTheme.spacing.smallY,
                const Text("Icon Width Seted 300"),
                AppTheme.spacing.smallY,
                Wrap(
                  runSpacing: 16,
                  spacing: 16,
                  children: [
                    ButtonWidget.ractangle(
                      text: "Primary",
                      width: 300,
                      rightIcon: Icons.send,
                      type: ButtonType.primary,
                      onPressed: () {},
                    ),
                    ButtonWidget.ractangle(
                      text: "Secondary",
                      width: 300,
                      rightIcon: Icons.send,
                      type: ButtonType.secondary,
                      onPressed: () {},
                    ),
                    ButtonWidget.ractangle(
                      text: "Disable",
                      width: 300,
                      rightIcon: Icons.send,
                      type: ButtonType.disable,
                    ),
                  ],
                ),
                AppTheme.spacing.smallY,
                const Text("Icon Infinity Width"),
                AppTheme.spacing.smallY,
                ButtonWidget.ractangle(
                  text: "Primary",
                  width: AppTheme.double.screenW(context),
                  leftIcon: Icons.star,
                  rightIcon: Icons.star,
                  type: ButtonType.primary,
                  onPressed: () {},
                ),
                AppTheme.spacing.smallY,
                ButtonWidget.ractangle(
                  text: "Secondary",
                  width: AppTheme.double.screenW(context),
                  leftIcon: Icons.star,
                  rightIcon: Icons.star,
                  type: ButtonType.secondary,
                  onPressed: () {},
                ),
                AppTheme.spacing.smallY,
                ButtonWidget.ractangle(
                  text: "Disable",
                  width: AppTheme.double.screenW(context),
                  leftIcon: Icons.star,
                  rightIcon: Icons.star,
                  type: ButtonType.disable,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
