import 'package:flutter/material.dart';

class AuthAppProvider with ChangeNotifier {
  AuthAppProvider() {
    _init();
  }

  Future<void> _init() async {
    isLogin = true;
  }

  void updateState() {
    notifyListeners();
  }

  bool _isLogin = false;
  bool get isLogin => _isLogin;
  set isLogin(bool value) {
    _isLogin = value;
    notifyListeners();
  }

  bool _formValid = true;
  bool get formValid => _formValid;
  set formValid(bool value) {
    _formValid = value;
    notifyListeners();
  }

  String? _verifyId;
  String? get verifyId => _verifyId;
  set verifyId(String? value) {
    _verifyId = value;
    notifyListeners();
  }

  bool _codeTimeout = false;
  bool get codeTimeout => _codeTimeout;
  set codeTimeout(bool value) {
    _codeTimeout = value;
    notifyListeners();
  }

  String _countryCode = "+62";
  String get countryCode => _countryCode;
  set countryCode(String newValue) {
    _countryCode = newValue;
    notifyListeners();
  }

  TextEditingController _phoneController = TextEditingController();
  TextEditingController get phoneController => _phoneController;
  set phoneController(TextEditingController value) {
    _phoneController = value;
    notifyListeners();
  }

  TextEditingController _codeOTPController = TextEditingController();
  TextEditingController get codeOTPController => _codeOTPController;

  set codeOTPController(TextEditingController value) {
    _codeOTPController = value;
    notifyListeners();
  }
}
