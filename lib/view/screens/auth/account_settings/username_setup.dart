// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:chatteree_mobile/providers/authentication_provider.dart';
import 'package:chatteree_mobile/utils/colors.dart';
import 'package:chatteree_mobile/utils/theme.dart';
import 'package:chatteree_mobile/view/widgets/c_button.dart';
import 'package:chatteree_mobile/view/widgets/c_textfield.dart';

class UsernameSetup extends StatelessWidget {
  const UsernameSetup({
    super.key,
    required this.authenticationProvider,
    required this.pageController,
  });

  final AuthenticationProvider authenticationProvider;
  final PageController pageController;
  static TextEditingController textEditingController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(
              top: 24,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "A Chatteree ID cos you’re special.",
                  style: cHeading3TextStyle.copyWith(fontSize: 24),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "People will be able to find you with your unique ID",
                  style: cBodyTextStyle,
                ),
                const SizedBox(
                  height: 42,
                ),
                CTextField(
                  label: "Chatteree ID",
                  textController: textEditingController,
                  placeholder: "username",
                  prefix: SvgPicture.asset(
                    "assets/icons/icon/interfaces/at.svg",
                    color: AppColors.gray,
                  ),
                ),
                const SizedBox(
                  height: 42,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CButton(
                      disabled: authenticationProvider.verificationCode == '' ||
                          authenticationProvider.verificationCode.length != 6,
                      text: "Continue",
                      onPressed: () {
                        pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
