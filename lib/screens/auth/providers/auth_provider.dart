import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  AuthProvider() {
    _init();
  }

  Future<void> _init() async {
    // isLogin = true;
  }

  bool _isLogin = false;
  bool get isLogin => _isLogin;
  set isLogin(bool value) {
    _isLogin = value;
    notifyListeners();
  }
}
