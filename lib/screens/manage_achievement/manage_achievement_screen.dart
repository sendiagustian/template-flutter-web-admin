import 'package:flutter/material.dart';

class ManageAchievementScreen extends StatelessWidget {
  const ManageAchievementScreen({super.key});

  static const String route = '/manage-achievement';
  static const String name = 'Manage Achievement';
  static const String category = 'Manage';
  static const IconData icon = Icons.hotel_class_rounded;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Text('Manage Achievement'),
    ));
  }
}
