import 'package:flutter/material.dart';

class RouteItem {
  final String path;
  final String name;
  final String? category;
  final IconData? icon;
  final Widget page;
  final List<RouteItem> subRoutes;

  RouteItem({
    required this.path,
    required this.name,
    this.category,
    this.icon,
    this.subRoutes = const [],
    required this.page,
  });
}
