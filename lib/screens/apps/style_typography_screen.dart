import 'package:flutter/material.dart';

import '../../core/themes/app_theme.dart';

class StyleTypograpgyScreen extends StatelessWidget {
  const StyleTypograpgyScreen({super.key});

  static const String route = '/style-typography';
  static const String name = "Typography Styles";
  static const String category = "Styles";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'displayLarge\nSTUPWXYZabcdefgh1234567890',
              style: AppTheme.typography.displayLarge,
            ),
            const SizedBox(height: 4),
            const Divider(),
            const SizedBox(height: 4),
            Text(
              'displayMedium\nSTUPWXYZabcdefgh1234567890',
              style: AppTheme.typography.displayMedium,
            ),
            const SizedBox(height: 4),
            const Divider(),
            const SizedBox(height: 4),
            Text(
              'displaySmall\nSTUPWXYZabcdefgh1234567890',
              style: AppTheme.typography.displaySmall,
            ),
            const SizedBox(height: 4),
            const Divider(),
            const SizedBox(height: 4),
            Text(
              'headlineMedium\nSTUPWXYZabcdefgh1234567890',
              style: AppTheme.typography.headlineMedium,
            ),
            const SizedBox(height: 4),
            const Divider(),
            const SizedBox(height: 4),
            Text(
              'headlineSmall\nSTUPWXYZabcdefgh1234567890',
              style: AppTheme.typography.headlineSmall,
            ),
            const SizedBox(height: 4),
            const Divider(),
            const SizedBox(height: 4),
            Text(
              'titleLarge\nSTUPWXYZabcdefgh1234567890',
              style: AppTheme.typography.titleLarge,
            ),
            const SizedBox(height: 4),
            const Divider(),
            const SizedBox(height: 4),
            Text(
              'titleMedium\nSTUPWXYZabcdefgh1234567890',
              style: AppTheme.typography.titleMedium,
            ),
            const SizedBox(height: 4),
            const Divider(),
            const SizedBox(height: 4),
            Text(
              'titleSmall\nSTUPWXYZabcdefgh1234567890',
              style: AppTheme.typography.titleSmall,
            ),
            const SizedBox(height: 4),
            const Divider(),
            const SizedBox(height: 4),
            Text(
              'bodyLarge\nSTUPWXYZabcdefgh1234567890',
              style: AppTheme.typography.bodyLarge,
            ),
            const SizedBox(height: 4),
            const Divider(),
            const SizedBox(height: 4),
            Text(
              'bodyMedium\nSTUPWXYZabcdefgh1234567890',
              style: AppTheme.typography.bodyMedium,
            ),
            const SizedBox(height: 4),
            const Divider(),
            const SizedBox(height: 4),
            Text(
              'bodySmall\nSTUPWXYZabcdefgh1234567890',
              style: AppTheme.typography.bodySmall,
            ),
            const SizedBox(height: 4),
            const Divider(),
            const SizedBox(height: 4),
            Text(
              'labelLarge\nSTUPWXYZabcdefgh1234567890',
              style: AppTheme.typography.labelLarge,
            ),
            const SizedBox(height: 4),
            const Divider(),
            const SizedBox(height: 4),
            Text(
              'labelMedium\nSTUPWXYZabcdefgh1234567890',
              style: AppTheme.typography.labelMedium,
            ),
            const SizedBox(height: 4),
            const Divider(),
            const SizedBox(height: 4),
            Text(
              'labelSmall\nSTUPWXYZabcdefgh1234567890',
              style: AppTheme.typography.labelSmall,
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
