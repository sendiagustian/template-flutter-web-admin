import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/themes/app_theme.dart';
import '../../core/utils/layout_util.dart';
import 'providers/auth_provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final bool isLargeScreen = LayoutUtil(context).isDesktop;

    return Scaffold(
      body: Center(
        child: Builder(
          builder: (context) {
            if (!isLargeScreen) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildLogo(context),
                  _buildForm(context),
                ],
              );
            } else {
              return Container(
                padding: const EdgeInsets.all(32.0),
                constraints: const BoxConstraints(maxWidth: 800),
                child: Row(
                  children: [
                    Expanded(child: _buildLogo(context)),
                    Expanded(
                      child: Center(
                        child: _buildForm(context),
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildLogo(BuildContext context) {
    final bool isLargeScreen = LayoutUtil(context).isDesktop;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FlutterLogo(size: isLargeScreen ? 200 : 100),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Welcome to Flutter!",
            textAlign: TextAlign.center,
            style: AppTheme.typography.headlineMedium,
          ),
        )
      ],
    );
  }

  Widget _buildForm(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 300),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Email',
                hintText: 'Enter your email',
                prefixIcon: Icon(Icons.email_outlined),
                border: OutlineInputBorder(),
              ),
            ),
            AppTheme.spacing.mediumY,
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
                prefixIcon: Icon(Icons.lock_outline_rounded),
                border: OutlineInputBorder(),
              ),
            ),
            AppTheme.spacing.mediumY,
            CheckboxListTile(
              value: false,
              onChanged: (value) {
                if (value == null) return;
              },
              title: const Text('Remember me'),
              controlAffinity: ListTileControlAffinity.leading,
              dense: true,
              contentPadding: const EdgeInsets.all(0),
            ),
            AppTheme.spacing.mediumY,
            SizedBox(
              width: double.infinity,
              child: Consumer<AuthProvider>(builder: (_, authProvider, __) {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Sign in',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  onPressed: () {
                    authProvider.isLogin = true;
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
