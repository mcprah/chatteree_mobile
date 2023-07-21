import 'package:flutter/material.dart';

class AuthenticationProvider with ChangeNotifier {
  String _email = '';
  String _verificationCode = '';
  bool _isValidCode = false;

  String get email => _email;
  String get verificationCode => _verificationCode;
  bool get isValidCode => _isValidCode;


  set email(String value) {
    _email = value;
  }

  set verificationCode(String value) {
    _verificationCode = value;
    // notifyListeners();
  }

  set isValidCode(bool value) {
    _isValidCode = value;
    // notifyListeners();
  }

  void validatePin(String value) {
    verificationCode = value;
    isValidCode = verificationCode == "123456";
  }
}
