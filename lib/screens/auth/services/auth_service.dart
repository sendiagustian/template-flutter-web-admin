import 'package:flutter/material.dart';

import '../providers/auth_app_provider.dart';

class AuthService {
  AuthService();

  String getPhoneNumber(
    String countryCode,
    TextEditingController phoneController,
  ) {
    String phone = phoneController.text.replaceFirst(RegExp(r'^0+'), '');
    phone = phone.replaceFirst(RegExp(r'^62+'), '');
    String phoneNumber = "$countryCode$phone";
    return phoneNumber;
  }

  Future<void> verifyPhoneNumber({
    required AuthAppProvider auth,
    required BuildContext context,
    required GlobalKey<FormState> form,
  }) async {
    auth.verifyId = "123456";
    // code here
  }

  Future<void> resendCodeSms(BuildContext context, AuthAppProvider auth) async {
    // code here
  }

  Future<bool> verifyCodeSms({
    required BuildContext context,
    required AuthAppProvider auth,
    required String verificationId,
  }) async {
    auth.isLogin = true;
    return true;
    //code here
  }

  Future<void> logOut(BuildContext context, AuthAppProvider auth) async {
    auth.isLogin = false;
  }
}
