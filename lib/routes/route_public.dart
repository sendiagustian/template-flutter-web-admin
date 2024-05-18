import '../screens/auth/login_screen.dart';
import '../screens/auth/register_screen.dart';
import 'items/route_item.dart';

List<RouteItem> routesPublic = [
  const RouteItem(
    path: LoginScreen.path,
    name: LoginScreen.name,
    page: LoginScreen(),
  ),
  const RouteItem(
    path: RegisterScreen.path,
    name: RegisterScreen.name,
    page: RegisterScreen(),
  ),
];
