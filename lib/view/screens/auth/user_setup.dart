import 'package:chatteree_mobile/providers/authentication.dart';
import 'package:chatteree_mobile/utils/notification.dart';
import 'package:chatteree_mobile/utils/colors.dart';
import 'package:chatteree_mobile/view/components/verification_pin.dart';
import 'package:chatteree_mobile/view/widgets/c_button.dart';
import 'package:chatteree_mobile/view/widgets/c_textfield.dart';
import 'package:flutter/material.dart';

import 'package:chatteree_mobile/utils/theme.dart';
import 'package:chatteree_mobile/view/components/back_button.dart';
import 'package:chatteree_mobile/view/screens/layout/default.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class UserSetup extends StatelessWidget {
  UserSetup({super.key});

  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AuthenticationProvider authenticationProvider =
        context.watch<AuthenticationProvider>();

    return DefaultLayout(
      screen: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Column(
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
                          disabled: authenticationProvider.verificationCode ==
                                  '' ||
                              authenticationProvider.verificationCode.length !=
                                  6,
                          text: "Continue",
                          onPressed: () {},
                          minWidth: 80,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
