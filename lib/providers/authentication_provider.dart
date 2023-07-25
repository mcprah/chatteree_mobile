import 'package:chatteree_mobile/models/user_model.dart';
import 'package:flutter/material.dart';

class AuthenticationProvider with ChangeNotifier {
  String _email = '';
  String _verificationCode = '';
  bool _isValidCode = false;
  bool _isRegisteredUser = false;
  bool _isFirstTimeUser = true;
  User? _userData = User(
    id: 123,
    profileImageUrl: "https://i.pravatar.cc/150?u=a042581fjjf9022314d",
    username: "@mcprah",
    name: "Mark",
    email: "mcprah@gmail.com",
    onlineStatus: true,
  );

  User? get userData => _userData;
  String get email => _email;
  String get verificationCode => _verificationCode;
  bool get isValidCode => _isValidCode;
  bool get isRegisteredUser => _isRegisteredUser;
  bool get isFirstTimeUser => _isFirstTimeUser;

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

  set isValidCode(bool value) {
    _isValidCode = value;
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
}
