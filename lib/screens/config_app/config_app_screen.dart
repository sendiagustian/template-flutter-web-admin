import 'package:flutter/material.dart';

class ConfigAppScreen extends StatelessWidget {
  const ConfigAppScreen({super.key});

  static const String route = '/config-app';
  static const String name = 'Config App';
  static const String category = 'Settings';
  static const IconData icon = Icons.settings_applications_sharp;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Text('Config App'),
    ));
  }
}
