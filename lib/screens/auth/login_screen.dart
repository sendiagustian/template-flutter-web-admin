import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/constants/enums/type_enums.dart';
import '../../core/utils/validator_text_field_util.dart';
import '../../routes/services/navigator_service.dart';
import '../../core/themes/app_theme.dart';
import '../../core/utils/app_util.dart';
import '../../core/widgets/button_widget.dart';
import '../../core/widgets/input_widget.dart';
import '../dashboard/dashboard_screen.dart';
import 'providers/auth_app_provider.dart';
import 'services/auth_service.dart';

class LoginScreen extends StatelessWidget {
  static const String path = "/login";
  static const String name = "Login";

  const LoginScreen({super.key});

  static final AuthService _authService = AuthService();
  static final ValidatorTextFieldUtil _validatorField = ValidatorTextFieldUtil();

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formLogin = GlobalKey<FormState>();
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 900, maxHeight: 500),
            child: Builder(builder: (context) {
              if (isLargeScreen(context)) {
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
                        AppTheme.spacing.customX(24),
                        Container(width: 1, color: Colors.grey[350]),
                      ],
                    ),
                    Consumer<AuthAppProvider>(builder: (_, auth, __) {
                      return _buildForm(context, formLogin);
                    }),
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
                      Consumer<AuthAppProvider>(builder: (_, auth, __) {
                        return _buildForm(context, formLogin);
                      }),
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
    return Image.asset(
      'assets/images/logo_name.png',
      width: isLargeScreen(context) ? 400 : 300,
    );
  }

  Widget _buildForm(BuildContext context, GlobalKey<FormState> formKey) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<AuthAppProvider>(builder: (_, auth, __) {
            return Row(
              crossAxisAlignment: auth.formValid ? CrossAxisAlignment.end : CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: InputWidget.formFieldInput(
                    context: context,
                    title: "Phone Number",
                    hintText: "Phone Number",
                    enabled: auth.verifyId == null ? true : false,
                    controller: auth.phoneController,
                    prefixIcon: const Icon(Icons.phone_outlined),
                    validator: _validatorField.validatePhoneNumber,
                  ),
                ),
                AppTheme.spacing.exSmallX,
                ButtonWidget.ractangle(
                  text: "Verify",
                  height: 48,
                  type: auth.verifyId == null ? ButtonType.primary : ButtonType.disable,
                  onPressed: _onVerifyPhone(auth, formKey, context),
                ),
              ],
            );
          }),
          AppTheme.spacing.mediumY,
          Consumer<AuthAppProvider>(builder: (_, auth, __) {
            return InputWidget.formFieldInput(
              context: context,
              enabled: auth.verifyId != null ? true : false,
              title: "OTP Code",
              hintText: "OTP Code",
              controller: auth.codeOTPController,
              prefixIcon: const Icon(Icons.vpn_key),
            );
          }),
          AppTheme.spacing.mediumY,
          Consumer<AuthAppProvider>(builder: (_, auth, __) {
            return ButtonWidget.ractangle(
              text: "Submit",
              type: auth.verifyId != null ? ButtonType.primary : ButtonType.disable,
              width: AppTheme.double.screenW(context),
              onPressed: _onSubmit(auth, context),
            );
          }),
        ],
      ),
    );
  }

  void Function()? _onVerifyPhone(AuthAppProvider auth, GlobalKey<FormState> formKey, BuildContext context) {
    if (auth.verifyId == null) {
      return () {
        _authService.verifyPhoneNumber(context: context, auth: auth, form: formKey);
      };
    } else {
      return null;
    }
  }

  void Function()? _onSubmit(AuthAppProvider auth, BuildContext context) {
    if (auth.verifyId != null) {
      return () {
        _authService.verifyCodeSms(context: context, auth: auth, verificationId: auth.verifyId!).then((value) {
          if (value) {
            NavigatorService.pushAndRemoveUntil(context: context, route: DashboardScreen.path);
          }
        });
      };
    } else {
      return null;
    }
  }
}
