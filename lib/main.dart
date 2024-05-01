import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'core/configs/app_config.dart';
import 'core/providers/app_provider.dart';
import 'core/themes/base_theme.dart';
import 'routes/router.dart';
import 'routes/providers/router_provider.dart';
import 'screens/auth/providers/auth_provider.dart';
import 'screens/dashboard/dashboard_screen.dart';

AppConfig appConfig = AppConfig();

// FOR BUILD WEB
// flutter build web --release --no-tree-shake-icons
// FOR DEPLOY WEB
// firebase deploy --only hosting:admin-tongnyampah
// RUN WITH IP
// flutter run -d web-server --web-hostname 0.0.0.0 --web-port 8989

Future<void> main() async {
  await appConfig.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return Consumer2<AppProvider, AuthProvider>(
            builder: (_, appProvider, authProvider, __) {
              BaseTheme theme = BaseTheme();

              return ChangeNotifierProvider(
                create: (_) => RouterProvider(authProvider),
                child: Consumer<RouterProvider>(
                  builder: (_, routerProvider, __) {
                    return MaterialApp(
                      theme: theme.baseTheme,
                      title: 'Admin Tong Nyampah',
                      debugShowCheckedModeBanner: false,
                      initialRoute: DashboardScreen.route,
                      onGenerateRoute: AppRouter.instance.generator,
                      builder: (_, child) {
                        return ResponsiveBreakpoints.builder(
                          child: child!,
                          breakpoints: const [
                            Breakpoint(start: 0, end: 750, name: MOBILE),
                            Breakpoint(start: 751, end: 1024, name: TABLET),
                            Breakpoint(start: 1025, end: 1920, name: DESKTOP),
                            Breakpoint(start: 1921, end: double.infinity, name: '4K'),
                          ],
                        );
                      },
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
