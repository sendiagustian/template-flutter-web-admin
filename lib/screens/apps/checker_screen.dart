import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/themes/app_theme.dart';
import '../../core/themes/typography_theme.dart';
import '../../core/utils/layout_util.dart';

class CheckerScreen extends StatelessWidget {
  const CheckerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDesktop = LayoutUtil(context).isDesktop;
    TypographyTheme typography = AppTheme(
      isDesktop: isDesktop,
    ).typography;

    return Scaffold(
      appBar: AppBar(
        title: Text("Test Typography", style: typography.titleMedium),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              context.go('/data');
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'displayLarge\nSTUPWXYZabcdefgh1234567890',
              style: typography.displayLarge,
            ),
            const SizedBox(height: 4),
            const Divider(),
            const SizedBox(height: 4),
            Text(
              'displayMedium\nSTUPWXYZabcdefgh1234567890',
              style: typography.displayMedium,
            ),
            const SizedBox(height: 4),
            const Divider(),
            const SizedBox(height: 4),
            Text(
              'displaySmall\nSTUPWXYZabcdefgh1234567890',
              style: typography.displaySmall,
            ),
            const SizedBox(height: 4),
            const Divider(),
            const SizedBox(height: 4),
            Text(
              'headlineMedium\nSTUPWXYZabcdefgh1234567890',
              style: typography.headlineMedium,
            ),
            const SizedBox(height: 4),
            const Divider(),
            const SizedBox(height: 4),
            Text(
              'headlineSmall\nSTUPWXYZabcdefgh1234567890',
              style: typography.headlineSmall,
            ),
            const SizedBox(height: 4),
            const Divider(),
            const SizedBox(height: 4),
            Text(
              'titleLarge\nSTUPWXYZabcdefgh1234567890',
              style: typography.titleLarge,
            ),
            const SizedBox(height: 4),
            const Divider(),
            const SizedBox(height: 4),
            Text(
              'titleMedium\nSTUPWXYZabcdefgh1234567890',
              style: typography.titleMedium,
            ),
            const SizedBox(height: 4),
            const Divider(),
            const SizedBox(height: 4),
            Text(
              'titleSmall\nSTUPWXYZabcdefgh1234567890',
              style: typography.titleSmall,
            ),
            const SizedBox(height: 4),
            const Divider(),
            const SizedBox(height: 4),
            Text(
              'bodyLarge\nSTUPWXYZabcdefgh1234567890',
              style: typography.bodyLarge,
            ),
            const SizedBox(height: 4),
            const Divider(),
            const SizedBox(height: 4),
            Text(
              'bodyMedium\nSTUPWXYZabcdefgh1234567890',
              style: typography.bodyMedium,
            ),
            const SizedBox(height: 4),
            const Divider(),
            const SizedBox(height: 4),
            Text(
              'bodySmall\nSTUPWXYZabcdefgh1234567890',
              style: typography.bodySmall,
            ),
            const SizedBox(height: 4),
            const Divider(),
            const SizedBox(height: 4),
            Text(
              'labelLarge\nSTUPWXYZabcdefgh1234567890',
              style: typography.labelLarge,
            ),
            const SizedBox(height: 4),
            const Divider(),
            const SizedBox(height: 4),
            Text(
              'labelMedium\nSTUPWXYZabcdefgh1234567890',
              style: typography.labelMedium,
            ),
            const SizedBox(height: 4),
            const Divider(),
            const SizedBox(height: 4),
            Text(
              'labelSmall\nSTUPWXYZabcdefgh1234567890',
              style: typography.labelSmall,
            ),
            const SizedBox(height: 4),
            const Divider(),
            const SizedBox(height: 4),
          ],
        ),
      ),
    );
  }
}
