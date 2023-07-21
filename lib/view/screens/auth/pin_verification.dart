import 'package:chatteree_mobile/providers/authentication.dart';
import 'package:chatteree_mobile/utils/notification.dart';
import 'package:chatteree_mobile/utils/colors.dart';
import 'package:chatteree_mobile/view/components/profile_pic.dart';
import 'package:chatteree_mobile/view/components/verification_pin.dart';
import 'package:chatteree_mobile/view/screens/auth/user_setup.dart';
import 'package:chatteree_mobile/view/screens/chat/chat_screen.dart';
import 'package:chatteree_mobile/view/widgets/c_button.dart';
import 'package:flutter/material.dart';

import 'package:chatteree_mobile/utils/theme.dart';
import 'package:chatteree_mobile/view/components/back_button.dart';
import 'package:chatteree_mobile/view/screens/layout/default.dart';
import 'package:provider/provider.dart';

class Verify extends StatelessWidget {
  Verify({super.key});

  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AuthenticationProvider authenticationProvider =
        context.watch<AuthenticationProvider>();

    Widget buildVerificationWidget() {
      return Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          RichText(
            text: TextSpan(
              text: "Enter the confirmation code sent to",
              style: cBodyTextStyle,
              children: const [
                TextSpan(
                    text: " kwesiokyere@gmail.com ",
                    style: TextStyle(fontWeight: FontWeight.w500)),
                TextSpan(
                  text: "to verify that it is you.",
                )
              ],
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          VerificationPinComponent(
            // Enter 123456 to verify, any other code will fail
            textEditingController: textEditingController,
            onCompleted: (value) {
              print(value);
              authenticationProvider.validatePin(value);
              if (!authenticationProvider.isValidCode) {
                CNoty.showToast(
                  message: "Incorrect confirmation code",
                  color: AppColors.danger,
                );
              }
            },
            onChanged: (value) {
              authenticationProvider.verificationCode = value;
            },
            beforeTextPaste: (text) {
              print("Allowing to paste $text");
              //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
              //but you can show anything you want here, like your pop up saying wrong paste format or etc
              return true;
            },
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {},
                style: const ButtonStyle(
                  splashFactory: NoSplash.splashFactory,
                  overlayColor: MaterialStatePropertyAll(
                    AppColors.secondaryLight,
                  ),
                  enableFeedback: false,
                ),
                child: Text(
                  "Resend code",
                  style: cBodyTextStyle.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              CButton(
                disabled: authenticationProvider.verificationCode == '' ||
                    authenticationProvider.verificationCode.length != 6,
                text: "Verify",
                onPressed: () {
                  if (!authenticationProvider.isValidCode) {
                    CNoty.showToast(
                      message: "Incorrect confirmation code",
                      color: AppColors.danger,
                    );
                    return;
                  }

                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return authenticationProvider.isRegisteredUser
                          ? const ChatScreen()
                          : const UserSetup();
                    },
                  ));
                },
                minWidth: 80,
              ),
            ],
          ),
          const SizedBox(
            height: 60,
          ),
        ],
      );
    }

    return DefaultLayout(
      screen: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CBackButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(
                  top: 24,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    authenticationProvider.isRegisteredUser
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Welcome back,",
                                    style: cHeading3TextStyle,
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    "@nkayyjo",
                                    style: cBodyTextStyle.copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 36,
                                  ),
                                ],
                              ),
                              ProfilePic(
                                imagePath: '',
                                onImageError: (p0, p1) {},
                                initial: "M",
                              )
                            ],
                          )
                        : Text(
                            "Check your mail",
                            style: cHeading3TextStyle,
                          ),
                    buildVerificationWidget(),
                    if (!authenticationProvider.isRegisteredUser)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/onboarding-2.png",
                            width: MediaQuery.of(context).size.height * 0.3,
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
