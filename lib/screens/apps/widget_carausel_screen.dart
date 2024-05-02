import 'package:flutter/material.dart';

class WidgetCarauselScreen extends StatelessWidget {
  const WidgetCarauselScreen({super.key});

  static const String route = '/widget-carausel';
  static const String name = 'Carausel Widget';
  static const String category = 'Widgets';
  static const IconData icon = Icons.slideshow_rounded;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Widget Carausel Screen'),
      ),
    );
  }
}
