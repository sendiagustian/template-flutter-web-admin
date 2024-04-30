import 'package:flutter/material.dart';

class ManageUsersScreen extends StatelessWidget {
  const ManageUsersScreen({super.key});

  static const String route = '/manage-users';
  static const String name = 'Manage Users';
  static const String category = 'Manage';
  static const IconData icon = Icons.group_rounded;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Text('Manage Users'),
    ));
  }
}
