import 'package:chatteree_mobile/models/user_model.dart';
import 'package:flutter/material.dart';

class AuthenticationProvider with ChangeNotifier {
  String _email = '';
  String _verificationCode = '';

  // Change this
  bool _isRegisteredUser = true;
  bool _isFirstTimeUser = false;

  bool _isValidCode = false;
  bool? _isValidUsername;
  bool? _isValidName;

  bool _isValidatingEmail = false;

  User? _userData;

  bool? get isValidUsername => _isValidUsername;
  bool? get isValidName => _isValidName;
  bool get isValidCode => _isValidCode;

  bool get isValidatingEmail => _isValidatingEmail;

  User? get userData => _userData;
  String get email => _email;
  String get verificationCode => _verificationCode;
  bool get isRegisteredUser => _isRegisteredUser;
  bool get isFirstTimeUser => _isFirstTimeUser;

  set isValidatingEmail(bool value) {
    _isValidatingEmail = value;
    notifyListeners();
  }

  set isValidUsername(bool? value) {
    _isValidUsername = value;
    notifyListeners();
  }

  set isValidName(bool? value) {
    _isValidName = value;
    notifyListeners();
  }

  set isValidCode(bool value) {
    _isValidCode = value;
    notifyListeners();
  }

  set email(String value) {
    _email = value;
  }

  set userData(User? value) {
    _userData = value;
    notifyListeners();
  }

  set verificationCode(String value) {
    _verificationCode = value;
    notifyListeners();
  }

  set isFirstTimeUser(bool value) {
    _isFirstTimeUser = value;
    notifyListeners();
  }

  set isRegisteredUser(bool value) {
    _isRegisteredUser = value;
    notifyListeners();
  }

  void validatePin(String value) {
    verificationCode = value;
    isValidCode = verificationCode == "123456";
  }

  String? validateEmail(String? value) {
    isValidatingEmail = true;
    if (value == null || value.isEmpty) {
      Future.delayed(const Duration(milliseconds: 500), () {
        isValidatingEmail = false;
      });
      return 'Email is required.';
    }
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      Future.delayed(const Duration(milliseconds: 500), () {
        isValidatingEmail = false;
      });
      return 'Invalid email format.';
    }

    return null;
  }

  String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      isValidUsername = null;
      return 'Username is required.';
    }
    if (value.length < 3) {
      isValidUsername = null;
      return 'Must be at least 3 characters long';
    }
    final usernameRegExp = RegExp(r'^[a-zA-Z0-9_]{3,9}$');

    isValidUsername = usernameRegExp.hasMatch(value);

    return null;
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      isValidName = null;
      return 'Name is required.';
    }
    if (value.length < 3) {
      isValidName = null;
      return 'Must be at least 3 characters long';
    }

    final nameRegExp = RegExp(r'^[a-zA-Z\s]{1,18}$');
    isValidName = nameRegExp.hasMatch(value);

    return null;
  }
}
