import '../screens/profile/profile_screen.dart';
import 'items/route_item.dart';

List<RouteItem> routesLogin = [
  const RouteItem(
    path: ProfileScreen.path,
    name: ProfileScreen.name,
    page: ProfileScreen(),
  ),
];
