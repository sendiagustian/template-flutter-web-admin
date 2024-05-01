import 'package:flutter/material.dart';

class WidgetButtonScreen extends StatelessWidget {
  const WidgetButtonScreen({super.key});

  static const String route = '/widget-button';
  static const String name = 'Button Widget';
  static const String category = 'Widgets';
  static const IconData icon = Icons.smart_button_rounded;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Widget Button Screen'),
      ),
    );
  }
}
