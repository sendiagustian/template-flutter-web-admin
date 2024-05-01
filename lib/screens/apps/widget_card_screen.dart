import 'package:flutter/material.dart';

class WidgetCardScreen extends StatelessWidget {
  const WidgetCardScreen({super.key});

  static const String route = '/widget-card';
  static const String name = 'Card Widget';
  static const String category = 'Widgets';
  static const IconData icon = Icons.credit_card_rounded;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Widget Card Screen'),
      ),
    );
  }
}
