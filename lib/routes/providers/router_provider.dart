import 'package:flutter/material.dart';

import '../../screens/auth/providers/auth_provider.dart';
import '../router.dart';

class RouterProvider with ChangeNotifier {
  final AuthProvider authProvider;

  RouterProvider(this.authProvider) {
    _init();
  }

  Future<void> _init() async {
    AppRouter(authProvider).defineRoutes(AppRouter.instance);
  }
}
