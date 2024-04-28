import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        actions: [
          IconButton(
            onPressed: () {
              context.go("/login");
            },
            icon: const Icon(Icons.login),
          ),
        ],
      ),
      body: const Center(
        child: Text('Register Screen'),
      ),
    );
  }
}
