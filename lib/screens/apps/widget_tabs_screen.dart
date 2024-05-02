import 'package:flutter/material.dart';

class WidgetTabsScreen extends StatelessWidget {
  const WidgetTabsScreen({super.key});

  static const String route = '/widget-tabs';
  static const String name = 'Tabs Widget';
  static const String category = 'Widgets';
  static const IconData icon = Icons.tab_rounded;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Widget Tabs Screen'),
      ),
    );
  }
}
