import 'package:flutter/material.dart';

class WidgetPopoverScreen extends StatelessWidget {
  const WidgetPopoverScreen({super.key});

  static const String route = '/widget-popover';
  static const String name = 'Popover Widget';
  static const String category = 'Widgets';
  static const IconData icon = Icons.info_rounded;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Widget Popover Screen'),
      ),
    );
  }
}
