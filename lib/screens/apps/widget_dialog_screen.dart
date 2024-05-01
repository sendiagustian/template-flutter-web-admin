import 'package:flutter/material.dart';

class WidgetDialogScreen extends StatelessWidget {
  const WidgetDialogScreen({super.key});

  static const String route = '/widget-dialog';
  static const String name = 'Dialog Widget';
  static const String category = 'Widgets';
  static const IconData icon = Icons.notifications_active_rounded;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Widget Dialog Screen'),
      ),
    );
  }
}
