// ignore_for_file: deprecated_member_use

import 'package:chatteree_mobile/view/widgets/c_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:chatteree_mobile/providers/authentication_provider.dart';
import 'package:chatteree_mobile/utils/colors.dart';
import 'package:chatteree_mobile/utils/theme.dart';
import 'package:chatteree_mobile/view/widgets/c_button.dart';
import 'package:chatteree_mobile/view/widgets/c_textfield.dart';

class UsernameSetup extends StatefulWidget {
  const UsernameSetup({
    super.key,
    required this.authenticationProvider,
    required this.pageController,
  });

  final AuthenticationProvider authenticationProvider;
  final PageController pageController;

  @override
  State<UsernameSetup> createState() => _UsernameSetupState();
}

class _UsernameSetupState extends State<UsernameSetup> {
  final formKey = GlobalKey<FormState>();
  TextEditingController textEditingController = TextEditingController();
  int charInputLimit = 9;
  late int remainingText;
  bool isValidatingUsername = false;

  void calculateRemainingChars({
    required int charCount,
    required int charInputLimit,
  }) {
    setState(() {
      remainingText = charInputLimit - charCount;
    });
  }

  @override
  void initState() {
    remainingText = charInputLimit;
    super.initState();
  }

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
            child: Form(
              key: formKey,
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
                    maxLength: charInputLimit,
                    prefix: SvgPicture.asset(
                      "assets/icons/icon/interfaces/at.svg",
                      color: AppColors.gray,
                    ),
                    suffix: isValidatingUsername
                        ? const CLoader(
                            width: 40,
                            height: 40,
                          )
                        : widget.authenticationProvider.isValidUsername != null
                            ? widget.authenticationProvider.isValidUsername!
                                ? SvgPicture.asset(
                                    "assets/icons/icon/interfaces/checkmark-circle.svg")
                                : SvgPicture.asset(
                                    "assets/icons/icon/interfaces/close-circle.svg")
                            : Text(
                                remainingText.toString(),
                                style: cBodyTextStyle.copyWith(
                                  color: AppColors.gray,
                                ),
                              ),
                    onChanged: (value) {
                      if (value.isEmpty) {
                        remainingText = charInputLimit;
                        formKey.currentState!.validate();
                        setState(() {});
                      } else {
                        setState(() {
                          isValidatingUsername = true;
                        });
                        calculateRemainingChars(
                          charCount: textEditingController.text.length,
                          charInputLimit: charInputLimit,
                        );
                        if (value.length > 2) {
                          formKey.currentState!.validate();
                        } else {
                          widget.authenticationProvider.isValidUsername = null;
                        }
                        // mimic validation load time
                        Future.delayed(const Duration(milliseconds: 500), () {
                          setState(() {
                            isValidatingUsername = false;
                          });
                        });
                      }
                    },
                    validator: (value) =>
                        widget.authenticationProvider.validateUsername(value),
                  ),
                  const SizedBox(
                    height: 42,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CButton(
                        disabled:
                            widget.authenticationProvider.verificationCode ==
                                    '' ||
                                widget.authenticationProvider.verificationCode
                                        .length !=
                                    6,
                        text: "Continue",
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            String fullUsername =
                                "@${textEditingController.text}";
                            widget.authenticationProvider.userData!.username =
                                fullUsername;

                            widget.pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn,
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
