import 'package:flutter/material.dart';

class ProfileItem {
  final IconData icon;
  final String name;
  final void Function() onTap;

  const ProfileItem({required this.icon, required this.name, required this.onTap});

  ProfileItem copyWith({IconData? icon, String? name, void Function()? onTap}) {
    return ProfileItem(icon: icon ?? this.icon, name: name ?? this.name, onTap: onTap ?? this.onTap);
  }

  Map<String, Object?> toJson() {
    return {'icon': icon, 'name': name, 'onTap': onTap};
  }

  @override
  String toString() {
    return '''ProfileItem(
      icon:$icon,
      name:$name,
      onTap:$onTap
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is ProfileItem &&
        other.runtimeType == runtimeType &&
        other.icon == icon &&
        other.name == name &&
        other.onTap == onTap;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, icon, name, onTap);
  }
}
