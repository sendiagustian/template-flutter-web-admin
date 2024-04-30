import 'package:flutter/material.dart';

class VerificationComplaintScreen extends StatelessWidget {
  const VerificationComplaintScreen({super.key});

  static const String route = '/verification-complaint';
  static const String name = 'Verification Complaint';
  static const String category = 'Verification';
  static const IconData icon = Icons.inbox_rounded;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Text('Verification Complaint'),
    ));
  }
}
