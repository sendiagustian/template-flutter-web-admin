import 'package:flutter/material.dart';

class WidgetBadgeScreen extends StatelessWidget {
  const WidgetBadgeScreen({super.key});

  static const String route = '/widget-badge';
  static const String name = 'Badge Widget';
  static const String category = 'Widgets';
  static const IconData icon = Icons.badge_rounded;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Widget Badge Screen'),
      ),
    );
  }
}
