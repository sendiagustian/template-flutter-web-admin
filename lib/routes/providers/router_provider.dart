import 'package:flutter/material.dart';

import '../../screens/auth/providers/auth_app_provider.dart';
import '../router.dart';

class RouterProvider with ChangeNotifier {
  final AuthAppProvider auth;

  RouterProvider(this.auth) {
    _init();
  }

  Future<void> _init() async {
    AppRouter(auth).defineRoutes(AppRouter.instance);
  }
}
