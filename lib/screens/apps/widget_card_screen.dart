import 'package:flutter/material.dart';

import '../../core/themes/app_theme.dart';
import '../../core/utils/layout_util.dart';
import '../../core/widgets/card_widget.dart';

class WidgetCardScreen extends StatelessWidget {
  const WidgetCardScreen({super.key});

  static const String route = '/widget-card';
  static const String name = 'Card Widget';
  static const String category = 'Widgets';
  static const IconData icon = Icons.credit_card_rounded;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: AppTheme.geometry.large,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Form Widgets",
              style: AppTheme.typography.displayMedium,
            ),
            AppTheme.spacing.customY(24),
            Builder(builder: (context) {
              if (isLargeScreen(context)) {
                return Row(
                  children: [
                    Expanded(
                      child: CardWidget.basic(
                        title: "Detail Card",
                        placeholder: const AssetImage("assets/images/placeholder.png"),
                        image: const AssetImage("assets/images/banner.png"),
                        children: [
                          const Text("This is a detail card"),
                          const Text("This is a detail card"),
                          const Text("This is a detail card"),
                        ],
                      ),
                    ),
                    AppTheme.spacing.smallX,
                    Expanded(
                      child: CardWidget.basic(
                        title: "Detail Card",
                        placeholder: const AssetImage("assets/images/placeholder.png"),
                        image: const AssetImage("assets/images/banner.png"),
                        children: [
                          const Text("This is a detail card"),
                          const Text("This is a detail card"),
                          const Text("This is a detail card"),
                        ],
                      ),
                    ),
                  ],
                );
              } else {
                return Column(
                  children: [
                    CardWidget.basic(
                      title: "Detail Card",
                      placeholder: const AssetImage("assets/images/placeholder.png"),
                      image: const AssetImage("assets/images/banner.png"),
                      children: [
                        const Text("This is a detail card"),
                        const Text("This is a detail card"),
                        const Text("This is a detail card"),
                      ],
                    ),
                    AppTheme.spacing.smallY,
                    CardWidget.basic(
                      title: "Detail Card",
                      placeholder: const AssetImage("assets/images/placeholder.png"),
                      image: const AssetImage("assets/images/banner.png"),
                      children: [
                        const Text("This is a detail card"),
                        const Text("This is a detail card"),
                        const Text("This is a detail card"),
                      ],
                    ),
                  ],
                );
              }
            }),
            AppTheme.spacing.mediumY,
            CardWidget.expansion(
              title: "Detail Card",
              initiallyExpanded: true,
              children: [
                const Text("This is a detail card"),
                const Text("This is a detail card"),
                const Text("This is a detail card"),
              ],
            ),
            AppTheme.spacing.customY(24),
            CardWidget.basic(
              title: "Detail Card",
              children: [
                const Text("This is a detail card"),
                const Text("This is a detail card"),
                const Text("This is a detail card"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
