import 'package:dashboard/core/providers/app_provider.dart';
import 'package:dashboard/core/themes/app_theme.dart';
import 'package:dashboard/core/themes/base_theme.dart';
import 'package:dashboard/core/themes/typography_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'core/utils/layout_util.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProvider()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        child: const MyHomePage(title: 'Flutter Demo Home Page'),
        builder: (context, child) {
          return Consumer<AppProvider>(builder: (_, appProvider, __) {
            return MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: const BaseTheme(true).baseTheme,
              initialRoute: "/",
              home: child,
              builder: (_, child) {
                return ResponsiveBreakpoints.builder(
                  child: child!,
                  breakpoints: const [
                    Breakpoint(start: 0, end: 690, name: MOBILE),
                    Breakpoint(start: 691, end: 1024, name: TABLET),
                    Breakpoint(start: 1025, end: 1920, name: DESKTOP),
                    Breakpoint(start: 1921, end: double.infinity, name: '4K'),
                  ],
                );
              },
            );
          });
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    bool isDesktop = LayoutUtil(context).isDesktop;
    TypographyTheme typography = AppTheme(isDesktop).typography;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'displayLarge\nSTUPWXYZabcdefgh1234567890',
              style: typography.displayLarge,
            ),
            const SizedBox(height: 4),
            const Divider(),
            const SizedBox(height: 4),
            Text(
              'displayMedium\nSTUPWXYZabcdefgh1234567890',
              style: typography.displayMedium,
            ),
            const SizedBox(height: 4),
            const Divider(),
            const SizedBox(height: 4),
            Text(
              'displaySmall\nSTUPWXYZabcdefgh1234567890',
              style: typography.displaySmall,
            ),
            const SizedBox(height: 4),
            const Divider(),
            const SizedBox(height: 4),
            Text(
              'headlineMedium\nSTUPWXYZabcdefgh1234567890',
              style: typography.headlineMedium,
            ),
            const SizedBox(height: 4),
            const Divider(),
            const SizedBox(height: 4),
            Text(
              'headlineSmall\nSTUPWXYZabcdefgh1234567890',
              style: typography.headlineSmall,
            ),
            const SizedBox(height: 4),
            const Divider(),
            const SizedBox(height: 4),
            Text(
              'titleLarge\nSTUPWXYZabcdefgh1234567890',
              style: typography.titleLarge,
            ),
            const SizedBox(height: 4),
            const Divider(),
            const SizedBox(height: 4),
            Text(
              'titleMedium\nSTUPWXYZabcdefgh1234567890',
              style: typography.titleMedium,
            ),
            const SizedBox(height: 4),
            const Divider(),
            const SizedBox(height: 4),
            Text(
              'titleSmall\nSTUPWXYZabcdefgh1234567890',
              style: typography.titleSmall,
            ),
            const SizedBox(height: 4),
            const Divider(),
            const SizedBox(height: 4),
            Text(
              'bodyLarge\nSTUPWXYZabcdefgh1234567890',
              style: typography.bodyLarge,
            ),
            const SizedBox(height: 4),
            const Divider(),
            const SizedBox(height: 4),
            Text(
              'bodyMedium\nSTUPWXYZabcdefgh1234567890',
              style: typography.bodyMedium,
            ),
            const SizedBox(height: 4),
            const Divider(),
            const SizedBox(height: 4),
            Text(
              'bodySmall\nSTUPWXYZabcdefgh1234567890',
              style: typography.bodySmall,
            ),
            const SizedBox(height: 4),
            const Divider(),
            const SizedBox(height: 4),
            Text(
              'labelLarge\nSTUPWXYZabcdefgh1234567890',
              style: typography.labelLarge,
            ),
            const SizedBox(height: 4),
            const Divider(),
            const SizedBox(height: 4),
            Text(
              'labelMedium\nSTUPWXYZabcdefgh1234567890',
              style: typography.labelMedium,
            ),
            const SizedBox(height: 4),
            const Divider(),
            const SizedBox(height: 4),
            Text(
              'labelSmall\nSTUPWXYZabcdefgh1234567890',
              style: typography.labelSmall,
            ),
            const SizedBox(height: 4),
            const Divider(),
            const SizedBox(height: 4),
          ],
        ),
      ),
    );
  }
}
