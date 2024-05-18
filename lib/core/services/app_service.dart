// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'package:flutter/foundation.dart';

class AppService {
  void reloeadPage() {
    if (kIsWeb) {
      html.window.location.reload();
    }
  }
}
