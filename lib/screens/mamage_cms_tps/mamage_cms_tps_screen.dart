import 'package:flutter/material.dart';

class ManageCMSTPSScreen extends StatelessWidget {
  const ManageCMSTPSScreen({super.key});

  static const String route = '/manage-cms-tps';
  static const String name = 'manage CMS TPS';
  static const String category = 'Manage';
  static const IconData icon = Icons.assignment_add;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Text('Manage CMS TPS'),
    ));
  }
}
