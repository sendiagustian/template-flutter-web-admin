import 'package:flutter/material.dart';

class ManageAvatarScreen extends StatelessWidget {
  const ManageAvatarScreen({super.key});

  static const String route = '/manage-avatar';
  static const String name = 'Manage Avatar';
  static const String category = 'Manage';
  static const IconData icon = Icons.account_circle_rounded;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Text('Manage Avatar'),
    ));
  }
}
