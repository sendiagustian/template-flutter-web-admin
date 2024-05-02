import 'dart:async';

import 'package:flutter/material.dart';

class AppProvider with ChangeNotifier {
  AppProvider() {
    _init();
  }

  Future<void> _init() async {}

  bool _isHovered = false;
  bool get isHovered => _isHovered;
  set isHovered(bool value) {
    _isHovered = value;
    notifyListeners();
  }
}
