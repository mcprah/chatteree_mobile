import 'package:chatteree_mobile/models/user_model.dart';
import 'package:chatteree_mobile/providers/authentication_provider.dart';
import 'package:chatteree_mobile/utils/notification.dart';
import 'package:chatteree_mobile/utils/colors.dart';
import 'package:chatteree_mobile/view/components/commons/back_button.dart';
import 'package:chatteree_mobile/view/components/commons/profile_pic.dart';
import 'package:chatteree_mobile/view/components/commons/verification_pin.dart';
import 'package:chatteree_mobile/view/screens/auth/user_setup.dart';
import 'package:chatteree_mobile/view/screens/chat/chat_list_screen.dart';
import 'package:chatteree_mobile/view/widgets/c_button.dart';
import 'package:flutter/material.dart';

import 'package:chatteree_mobile/utils/theme.dart';
import 'package:chatteree_mobile/view/screens/layout/default.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

class Verify extends StatefulWidget {
  const Verify({super.key});

  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  TextEditingController textEditingController = TextEditingController();
  late AuthenticationProvider authenticationProvider;
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (authenticationProvider.isRegisteredUser) {
        authenticationProvider.userData = User(
          id: 123,
          name: "Mark",
          email: authenticationProvider.userData!.email,
          profileImageUrl: "https://i.pravatar.cc/150?u=a042581fjjf9023014d",
          username: "@mcprah",
          onlineStatus: false,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    authenticationProvider = context.watch<AuthenticationProvider>();

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
                                    authenticationProvider.userData!.username ??
                                        '',
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
                                imagePath: authenticationProvider
                                    .userData!.profileImageUrl,
                                initial:
                                    authenticationProvider.userData!.name?[0] ??
                                        'L',
                              )
                            ],
                          )
                        : Text(
                            "Check your mail",
                            style: cHeading3TextStyle,
                          ),
                    _buildVerificationWidget(),
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

  Widget _buildVerificationWidget() {
    return Column(
      children: [
        const SizedBox(
          height: 16,
        ),
        RichText(
          text: TextSpan(
            text: "Enter the confirmation code sent to ",
            style: cBodyTextStyle,
            children: [
              TextSpan(
                  text: authenticationProvider.userData!.email,
                  style: const TextStyle(fontWeight: FontWeight.w500)),
              const TextSpan(
                text: " to verify that it is you.",
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

                authenticationProvider.isRegisteredUser
                    ? Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const ChatListScreen();
                          },
                        ),
                        (Route<dynamic> route) => false,
                      )
                    : Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) {
                          return const UserSetup();
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
}
