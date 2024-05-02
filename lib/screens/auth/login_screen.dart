import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/services/navigator_service.dart';
import '../../core/themes/app_theme.dart';
import '../../core/utils/layout_util.dart';
import '../../core/widgets/button_widget.dart';
import '../../core/widgets/input_widget.dart';
import '../dashboard/dashboard_screen.dart';
import 'providers/auth_provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final bool isLargeScreen = LayoutUtil(context).isDesktop;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 900, maxHeight: 500),
            child: Builder(builder: (context) {
              if (isLargeScreen) {
                return GridView(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                  ),
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Welcome to Admin!",
                              textAlign: TextAlign.center,
                              style: AppTheme.typography.displayLarge,
                            ),
                            AppTheme.spacing.mediumY,
                            _buildLogo(context),
                          ],
                        ),
                        AppTheme.spacing.customX(4.5),
                        Container(width: 1, color: Colors.grey[350]),
                      ],
                    ),
                    _buildForm(context),
                  ],
                );
              } else {
                return Container(
                  padding: AppTheme.geometry.mediumX,
                  child: Column(
                    children: [
                      Text(
                        "Welcome to Admin!",
                        textAlign: TextAlign.center,
                        style: AppTheme.typography.displayLarge,
                      ),
                      AppTheme.spacing.mediumY,
                      _buildLogo(context),
                      AppTheme.spacing.mediumY,
                      _buildForm(context),
                    ],
                  ),
                );
              }
            }),
          ),
        ),
      ),
    );
  }

  Widget _buildLogo(BuildContext context) {
    final bool isLargeScreen = LayoutUtil(context).isDesktop;

    return Image.asset(
      'assets/images/logo_name.png',
      width: isLargeScreen ? 400 : 300,
    );
  }

  Widget _buildForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InputWidget.formFieldInput(
            context: context,
            title: "Phone Number",
            hintText: "Phone Number",
            prefixIcon: const Icon(Icons.phone_outlined),
          ),
          AppTheme.spacing.mediumY,
          InputWidget.formFieldInput(
            context: context,
            title: "Password",
            hintText: "Password",
            prefixIcon: const Icon(Icons.lock_outline_rounded),
          ),
          AppTheme.spacing.mediumY,
          Consumer<AuthProvider>(builder: (_, authProvider, __) {
            return ButtonWidget.basic(
              text: "Submit",
              type: ButtonType.primary,
              onPressed: () {
                authProvider.isLogin = true;
                NavigatorService.pushReplace(context: context, route: DashboardScreen.route);
              },
            );
          }),
        ],
      ),
    );
  }
}
