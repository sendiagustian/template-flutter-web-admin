import 'package:flutter/material.dart';

class WidgetDropDownScreen extends StatelessWidget {
  const WidgetDropDownScreen({super.key});

  static const String route = '/widget-drop-down';
  static const String name = 'DropDown Widget';
  static const String category = 'Widgets';
  static const IconData icon = Icons.arrow_drop_down_circle_rounded;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Widget DropDown Screen'),
      ),
    );
  }
}
