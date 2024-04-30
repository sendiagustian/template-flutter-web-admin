import 'package:flutter/material.dart';

import '../../routes/components/route_item.dart';
import '../../screens/profile/profile_screen.dart';
import '../services/navigator_service.dart';

class IconProfileWidget extends StatelessWidget {
  final List<RouteItem> items;
  const IconProfileWidget(this.items, {super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<RouteItem>(
      icon: GestureDetector(
        onTap: _onTapProfile(context),
        child: const Icon(Icons.person),
      ),
      offset: const Offset(0, 40),
      itemBuilder: (BuildContext context) {
        return items.map((RouteItem item) {
          return PopupMenuItem<RouteItem>(
            value: item,
            onTap: () {
              NavigatorService.push(context: context, route: item.path);
            },
            child: Text(item.name),
          );
        }).toList();
      },
    );
  }

  void Function()? _onTapProfile(BuildContext context) {
    if (items.isEmpty) {
      return () {
        NavigatorService.push(context: context, route: ProfileScreen.route);
      };
    }
    return null;
  }
}
