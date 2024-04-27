import 'dart:async';

import 'package:flutter/material.dart';

class AppProvider with ChangeNotifier {
  AppProvider() {
    _init();
  }

  Future<void> _init() async {}

  bool _isDesktop = false;
  bool get isDesktop => _isDesktop;

  set isDesktop(bool value) {
    _isDesktop = value;
    notifyListeners();
  }
}
