import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/themes/app_theme.dart';
import '../../core/widgets/button_widget.dart';
import '../../core/widgets/card_widget.dart';

class WidgetButtonScreen extends StatelessWidget {
  const WidgetButtonScreen({super.key});

  static const String route = '/widget-button';
  static const String name = 'Button Widget';
  static const String category = 'Widgets';
  static const IconData icon = Icons.smart_button_rounded;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: AppTheme.geometry.large,
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
                Row(
                  children: [
                    ButtonWidget.basic(
                      text: "Primary",
                      type: ButtonType.primary,
                      onPressed: () {},
                    ),
                    AppTheme.spacing.customX(12),
                    ButtonWidget.basic(
                      text: "Secondary",
                      type: ButtonType.secondary,
                      onPressed: () {},
                    ),
                    AppTheme.spacing.customX(12),
                    ButtonWidget.basic(
                      text: "Disable",
                      type: ButtonType.disable,
                    ),
                  ],
                ),
                AppTheme.spacing.smallY,
                const Text("Width Seted 300"),
                AppTheme.spacing.smallY,
                Row(
                  children: [
                    ButtonWidget.basic(
                      text: "Primary",
                      width: 300,
                      type: ButtonType.primary,
                      onPressed: () {},
                    ),
                    AppTheme.spacing.customX(12),
                    ButtonWidget.basic(
                      text: "Secondary",
                      width: 300,
                      type: ButtonType.secondary,
                      onPressed: () {},
                    ),
                    AppTheme.spacing.customX(12),
                    ButtonWidget.basic(
                      text: "Disable",
                      width: 300,
                      type: ButtonType.disable,
                    ),
                  ],
                ),
                AppTheme.spacing.smallY,
                const Text("Infinity Width"),
                AppTheme.spacing.smallY,
                ButtonWidget.basic(
                  text: "Primary",
                  width: 1.sw,
                  type: ButtonType.primary,
                  onPressed: () {},
                ),
                AppTheme.spacing.smallY,
                ButtonWidget.basic(
                  text: "Secondary",
                  width: 1.sw,
                  type: ButtonType.secondary,
                  onPressed: () {},
                ),
                AppTheme.spacing.smallY,
                ButtonWidget.basic(
                  text: "Disable",
                  width: 1.sw,
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
                Row(
                  children: [
                    ButtonWidget.basic(
                      text: "Primary",
                      leftIcon: Icons.add,
                      type: ButtonType.primary,
                      onPressed: () {},
                    ),
                    AppTheme.spacing.customX(12),
                    ButtonWidget.basic(
                      text: "Secondary",
                      leftIcon: Icons.add,
                      type: ButtonType.secondary,
                      onPressed: () {},
                    ),
                    AppTheme.spacing.customX(12),
                    ButtonWidget.basic(
                      text: "Disable",
                      leftIcon: Icons.add,
                      type: ButtonType.disable,
                    ),
                  ],
                ),
                AppTheme.spacing.smallY,
                const Text("Width Seted 300"),
                AppTheme.spacing.smallY,
                Row(
                  children: [
                    ButtonWidget.basic(
                      text: "Primary",
                      width: 300,
                      rightIcon: Icons.send,
                      type: ButtonType.primary,
                      onPressed: () {},
                    ),
                    AppTheme.spacing.customX(12),
                    ButtonWidget.basic(
                      text: "Secondary",
                      width: 300,
                      rightIcon: Icons.send,
                      type: ButtonType.secondary,
                      onPressed: () {},
                    ),
                    AppTheme.spacing.customX(12),
                    ButtonWidget.basic(
                      text: "Disable",
                      width: 300,
                      rightIcon: Icons.send,
                      type: ButtonType.disable,
                    ),
                  ],
                ),
                AppTheme.spacing.smallY,
                const Text("Infinity Width"),
                AppTheme.spacing.smallY,
                ButtonWidget.basic(
                  text: "Primary",
                  width: 1.sw,
                  leftIcon: Icons.star,
                  rightIcon: Icons.star,
                  type: ButtonType.primary,
                  onPressed: () {},
                ),
                AppTheme.spacing.smallY,
                ButtonWidget.basic(
                  text: "Secondary",
                  width: 1.sw,
                  leftIcon: Icons.star,
                  rightIcon: Icons.star,
                  type: ButtonType.secondary,
                  onPressed: () {},
                ),
                AppTheme.spacing.smallY,
                ButtonWidget.basic(
                  text: "Disable",
                  width: 1.sw,
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
