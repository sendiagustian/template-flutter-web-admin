import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'providers/auth_provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        actions: [
          IconButton(
            onPressed: () {
              context.go("/register");
            },
            icon: const Icon(Icons.app_registration),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Login Screen"),
            Consumer<AuthProvider>(builder: (_, authProvider, __) {
              return TextButton(
                onPressed: () {
                  authProvider.isLogin = true;
                },
                child: const Text("Masuk"),
              );
            }),
          ],
        ),
      ),
    );
  }
}
