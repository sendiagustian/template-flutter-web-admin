import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

import 'environment_config.dart';

class AppConfig {
  final Environment env;

  AppConfig(this.env);

  Future<void> init() async {
    setPathUrlStrategy();
    WidgetsFlutterBinding.ensureInitialized();
    await env.configure();
  }
}
