import 'package:flutter/material.dart';

class VerificationArticleScreen extends StatelessWidget {
  const VerificationArticleScreen({super.key});

  static const String route = '/verification-article';
  static const String name = 'Verification Article';
  static const String category = 'Verification';
  static const IconData icon = Icons.document_scanner_rounded;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Text('Verification Article'),
    ));
  }
}
