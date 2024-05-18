import 'package:flutter/material.dart';

class RouteItem {
  final String path;
  final String name;
  final Widget page;
  final String? category;
  final IconData? icon;
  final List<RouteItem> subRoutes;

  const RouteItem({
    required this.path,
    required this.name,
    required this.page,
    this.category,
    this.icon,
    this.subRoutes = const [],
  });

  RouteItem copyWith({
    String? path,
    String? name,
    Widget? page,
    String? category,
    IconData? icon,
    List<RouteItem>? subRoutes,
  }) {
    return RouteItem(
      path: path ?? this.path,
      name: name ?? this.name,
      category: category ?? this.category,
      icon: icon ?? this.icon,
      page: page ?? this.page,
      subRoutes: subRoutes ?? this.subRoutes,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'path': path,
      'name': name,
      'category': category,
      'icon': icon,
      'page': page,
      'subRoutes': subRoutes.map((e) => e.toJson()).toList(),
    };
  }

  static RouteItem fromJson(Map<String, Object?> json) {
    return RouteItem(
      path: json['path'] as String,
      name: json['name'] as String,
      page: json['page'] as Widget,
      category: json['category'] == null ? null : json['category'] as String,
      icon: json['icon'] == null ? null : json['icon'] as IconData,
      subRoutes: (json['subRoutes'] as List<RouteItem>).map((e) => RouteItem.fromJson(e as Map<String, Object?>)).toList(),
    );
  }

  @override
  String toString() {
    return '''RouteItem(
      path:$path,
      name:$name,
      category:$category,
      icon:$icon,
      page:$page,
      subRoutes:${subRoutes.toString()}
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is RouteItem &&
        other.runtimeType == runtimeType &&
        other.path == path &&
        other.name == name &&
        other.category == category &&
        other.icon == icon &&
        other.page == page &&
        other.subRoutes == subRoutes;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, path, name, category, icon, page, subRoutes);
  }
}
