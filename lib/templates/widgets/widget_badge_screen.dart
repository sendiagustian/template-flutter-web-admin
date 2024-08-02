import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/themes/app_theme.dart';
import '../../core/widgets/badge_widget.dart';
import '../../core/widgets/card_widget.dart';

class WidgetBadgeScreen extends StatelessWidget {
  const WidgetBadgeScreen({super.key});

  static const String path = '/widgets/widget-badge';
  static const String name = 'Badge Widget';
  static const String category = 'Widgets';
  static const IconData icon = Icons.badge_rounded;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BadgeState(),
      child: Scaffold(
        body: SingleChildScrollView(
          padding: AppTheme.geometry.medium,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Badge Widgets",
                style: AppTheme.typography.displayMedium,
              ),
              AppTheme.spacing.customY(24),
              CardWidget.basic(
                title: "Badge Basic",
                children: [
                  Wrap(
                    runSpacing: 16,
                    spacing: 16,
                    children: [
                      Consumer<BadgeState>(builder: (_, state, __) {
                        return BadgeWidget.basic(
                          context: context,
                          currentMenu: state.currentMenu,
                          menus: ["Semua", "Pengajuan", "Proses", "Selesai"],
                          onTap: (index) {
                            state.currentMenu = index;
                          },
                        );
                      }),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BadgeState with ChangeNotifier {
  int _currentMenu = 0;
  int get currentMenu => _currentMenu;
  set currentMenu(int value) {
    _currentMenu = value;
    notifyListeners();
  }
}
