import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../extensions/string_extension.dart';

String enumToString(Object enumValue) {
  return enumValue.toString().split('.').last.toWordCase();
}

String generateRandomToken({int length = 32}) {
  final secureRandom = Random.secure();
  final values = List<int>.generate(
    length,
    (index) => secureRandom.nextInt(256),
  );
  final token = base64UrlEncode(values);
  return token;
}

double convertSarToIdr({required double sar, required double kurs}) {
  return sar * kurs;
}

void copyToClipboard(
  BuildContext context,
  String text,
  String messageInfo, {
  bool noSnackBar = false,
}) async {
  await Clipboard.setData(
    ClipboardData(
      text: text,
    ),
  ).then((_) {
    if (!noSnackBar) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(messageInfo),
        ),
      );
    }
  });
}

bool isLargeScreen(BuildContext context) {
  return ResponsiveBreakpoints.of(context).isDesktop;
}

bool isMediumScreen(BuildContext context) {
  return ResponsiveBreakpoints.of(context).isTablet;
}

bool isSmallScreen(BuildContext context) {
  return ResponsiveBreakpoints.of(context).isMobile;
}
