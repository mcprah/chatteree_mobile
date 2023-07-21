import 'package:chatteree_mobile/view/screens/auth/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:chatteree_mobile/utils/colors.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chatteree',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'GeneralSans',
        bottomSheetTheme: BottomSheetThemeData(
          modalBackgroundColor: Colors.transparent,
          modalBarrierColor: Colors.black.withOpacity(0.15),
          elevation: 0,
        ),
      ),
      home: const SignIn(),
    );
  }
}
