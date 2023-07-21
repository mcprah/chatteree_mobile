import 'package:flutter/material.dart';

class AuthenticationProvider with ChangeNotifier {
  String _email = '';
  String _verificationCode = '';
  bool _isValidCode = false;
  bool _isRegisteredUser = true;

  String get email => _email;
  String get verificationCode => _verificationCode;
  bool get isValidCode => _isValidCode;
  bool get isRegisteredUser => _isRegisteredUser;

  set email(String value) {
    _email = value;
  }

  set verificationCode(String value) {
    _verificationCode = value;
    notifyListeners();
  }

  set isValidCode(bool value) {
    _isValidCode = value;
    // notifyListeners();
  }

  set isRegisteredUser(bool value) {
    _isRegisteredUser = value;
    notifyListeners();
  }

  void validatePin(String value) {
    verificationCode = value;
    isValidCode = verificationCode == "123456";
  }
}
