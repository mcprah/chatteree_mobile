import 'package:flutter/material.dart';

class AuthenticationProvider with ChangeNotifier {
  String _verificationCode = '';
  String get verificationCode => _verificationCode;

  bool _isValidCode = false;
  bool get isValidCode => _isValidCode;

  set isValidCode(bool value) {
    _isValidCode = value;
    notifyListeners();
  }

  set verificationCode(String value) {
    _verificationCode = value;
    notifyListeners();
  }

  void validatePin() {
    isValidCode = verificationCode == "123456";
    notifyListeners();
  }
}
