import 'package:flutter/material.dart';

class WidgetTableScreen extends StatelessWidget {
  const WidgetTableScreen({super.key});

  static const String route = "/table-widget";
  static const String name = "Table Widget";
  static const String category = "Widgets";
  static const IconData icon = Icons.table_chart;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Table Widget Screen"),
      ),
    );
  }
}
