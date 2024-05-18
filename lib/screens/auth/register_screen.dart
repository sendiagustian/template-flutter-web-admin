import 'package:flutter/material.dart';

import '../../routes/services/navigator_service.dart';

class RegisterScreen extends StatelessWidget {
  static const String path = "/register";
  static const String name = "Register";

  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        actions: [
          IconButton(
            onPressed: () {
              NavigatorService.push(context: context, route: "/login");
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
