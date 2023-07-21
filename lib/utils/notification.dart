import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CNoty {
  static showToast({String? message, Color? color}) {
    Fluttertoast.showToast(
      msg: message ?? "message here",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: color ?? Colors.green.shade300,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
