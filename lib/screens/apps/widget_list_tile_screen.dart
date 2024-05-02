import 'package:flutter/material.dart';

class WidgetListTileScreen extends StatelessWidget {
  const WidgetListTileScreen({super.key});

  static const String route = '/widget-list-tile';
  static const String name = 'List Tile Widget';
  static const String category = 'Widgets';
  static const IconData icon = Icons.list_rounded;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Widget List Tile Screen'),
      ),
    );
  }
}
