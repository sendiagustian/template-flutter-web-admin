import 'package:flutter/material.dart';

class ManageCMSMissionScreen extends StatelessWidget {
  const ManageCMSMissionScreen({super.key});

  static const String route = '/manage-cms-mission';
  static const String name = 'Manage CMS Mission';
  static const String category = 'Manage';
  static const IconData icon = Icons.assignment_add;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Text('Manage CMS Mission'),
    ));
  }
}
