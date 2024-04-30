import 'package:flutter/material.dart';

import '../../core/services/navigator_service.dart';

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
