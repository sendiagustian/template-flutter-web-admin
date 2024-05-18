import 'package:fluro/fluro.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'core/configs/app_config.dart';
import 'core/configs/environment_config.dart';
import 'core/providers/app_provider.dart';
import 'core/themes/base_theme.dart';
import 'routes/router.dart';
import 'routes/providers/router_provider.dart';
import 'screens/auth/providers/auth_app_provider.dart';
import 'screens/dashboard/dashboard_screen.dart';

AppConfig appConfig = AppConfig(Environment.dev());

// FOR BUILD WEB
// flutter build web --release --no-tree-shake-icons
// RUN WITH IP
// flutter run -d web-server --web-hostname 0.0.0.0 --web-port 8989

Future<void> main() async {
  await appConfig.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final Environment env = Environment.dev();

  @override
  Widget build(BuildContext context) {
    FluroRouter router = AppRouter.instance;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProvider(env)),
        ChangeNotifierProvider(create: (_) => AuthAppProvider()),
      ],
      child: Consumer2<AppProvider, AuthAppProvider>(
        builder: (_, appProvider, auth, __) {
          BaseTheme theme = BaseTheme();

          return ChangeNotifierProvider(
            create: (_) => RouterProvider(auth),
            child: Consumer<RouterProvider>(
              builder: (_, routerProvider, __) {
                return MaterialApp(
                  theme: theme.baseTheme,
                  title: 'Admin Tong Nyampah',
                  debugShowCheckedModeBanner: false,
                  initialRoute: DashboardScreen.path,
                  scrollBehavior: WebHorizontalScrollBehavior(),
                  onGenerateRoute: router.generator,
                  locale: const Locale('en', 'EN'),
                  supportedLocales: const [
                    Locale('en', 'EN'),
                  ],
                  localizationsDelegates: const [
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
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
      ),
    );
  }
}

class WebHorizontalScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices {
    return {
      PointerDeviceKind.mouse,
      PointerDeviceKind.touch,
      PointerDeviceKind.trackpad,
      PointerDeviceKind.stylus,
      PointerDeviceKind.invertedStylus,
    };
  }
}
