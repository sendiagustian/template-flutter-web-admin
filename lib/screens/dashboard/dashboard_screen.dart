import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../auth/providers/auth_provider.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            onPressed: () {
              context.go("/profile");
            },
            icon: const Icon(Icons.person),
          ),
          Consumer<AuthProvider>(builder: (_, authProvider, __) {
            return IconButton(
              onPressed: () {
                authProvider.isLogin = false;
              },
              icon: const Icon(Icons.logout),
            );
          }),
        ],
      ),
      body: const Center(
        child: Text('Dashboard Screen'),
      ),
    );
  }
}
