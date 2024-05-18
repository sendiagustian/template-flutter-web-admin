import 'dart:async';

import 'package:flutter/material.dart';

import '../configs/environment_config.dart';

class AppProvider with ChangeNotifier {
  final Environment environment;

  AppProvider(this.environment) {
    _init();
  }

  Future<void> _init() async {
    debugPrint("ENV USE : ${env.name}");
  }

  Environment get env => environment;

  bool _isHovered = false;
  bool get isHovered => _isHovered;
  set isHovered(bool value) {
    _isHovered = value;
    notifyListeners();
  }
}
