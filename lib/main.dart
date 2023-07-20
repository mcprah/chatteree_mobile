import 'package:chatteree_mobile/utils/colors.dart';
import 'package:chatteree_mobile/utils/constants.dart';
import 'package:chatteree_mobile/utils/theme.dart';
import 'package:chatteree_mobile/view/screens/sign_in.dart';
import 'package:chatteree_mobile/view/widgets/c_icon_button.dart';
import 'package:chatteree_mobile/view/widgets/c_text_button.dart';
import 'package:chatteree_mobile/view/widgets/c_dropdown.dart';
import 'package:chatteree_mobile/view/widgets/c_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

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
      home: const Scaffold(

        backgroundColor: AppColors.light,
        body: SafeArea(
          top: true,
          bottom: false,
          child: SignIn(),
        ),
      ),
    );
  }
}
