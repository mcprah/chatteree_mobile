import 'dart:io';

import 'package:chatteree_mobile/utils/constants.dart';
import 'package:chatteree_mobile/utils/notification.dart';
import 'package:chatteree_mobile/utils/utils.dart';
import 'package:chatteree_mobile/view/screens/chat/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:chatteree_mobile/providers/authentication.dart';
import 'package:chatteree_mobile/utils/colors.dart';
import 'package:chatteree_mobile/utils/theme.dart';
import 'package:chatteree_mobile/view/widgets/c_button.dart';
import 'package:chatteree_mobile/view/widgets/c_textfield.dart';

class NameDPSetup extends StatefulWidget {
  const NameDPSetup({
    super.key,
    required this.authenticationProvider,
    required this.pageController,
  });

  final AuthenticationProvider authenticationProvider;
  final PageController pageController;

  @override
  State<NameDPSetup> createState() => _NameDPSetupState();
}

class _NameDPSetupState extends State<NameDPSetup> {
  int charInputLimit = 18;
  late int remainingText;
  File? imageFile;
  TextEditingController textEditingController = TextEditingController();

  void calculateRemasiningChars({
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
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(
              top: 24,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Help them identify you",
                  textAlign: TextAlign.center,
                  style: cHeading3TextStyle.copyWith(fontSize: 24),
                ),
                const SizedBox(
                  height: 48,
                ),
                Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.secondaryLight2,
                        ),
                        borderRadius: BorderRadius.circular(165),
                      ),
                      child: Container(
                        height: 154,
                        width: 154,
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppColors.accent,
                          borderRadius: BorderRadius.circular(165),
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: imageFile != null
                            ? CircleAvatar(
                                backgroundColor: AppColors.gray,
                                backgroundImage: AssetImage(imageFile!.path),
                                onBackgroundImageError:
                                    (exception, stackTrace) {
                                  debugPrint(
                                      'image issue, $exception,$stackTrace');
                                  setState(() {
                                    imageFile = null;
                                  });
                                },
                              )
                            : Stack(
                                children: [
                                  Positioned(
                                    bottom: -12,
                                    right: -8,
                                    child: Container(
                                      width: 126,
                                      height: 126,
                                      decoration: BoxDecoration(
                                        color: AppColors.accentDark,
                                        borderRadius:
                                            BorderRadius.circular(120),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                      ),
                    ),
                    Positioned(
                      bottom: -4,
                      child: CButton(
                        text: "Upload photo",
                        onPressed: () async {
                          imageFile = await Utils.getFromGallery();
                          if (imageFile == null) {
                            CNoty.showToast(
                              message: 'Image not set',
                              color: AppColors.danger,
                            );
                          }
                          setState(() {});
                        },
                        type: CButtonType.SECONDARY,
                        size: CSize.SM,
                        minWidth: 80,
                        prefixIcon: SvgPicture.asset(
                          "assets/icons/icon/media/image.svg",
                          height: 20,
                          width: 20,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 48,
                ),
                CTextField(
                  label: "Your name",
                  textController: textEditingController,
                  placeholder: "",
                  maxLength: charInputLimit,
                  onChanged: (val) {
                    if (val.isNotEmpty) {
                      calculateRemasiningChars(
                        charCount: textEditingController.text.length,
                        charInputLimit: charInputLimit,
                      );
                    } else if (val.isEmpty) {
                      remainingText = charInputLimit;
                      setState(() {});
                    }
                  },
                  suffix: Text(
                    remainingText.toString(),
                    style: cBodyTextStyle.copyWith(
                      color: AppColors.gray,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 42,
                ),
                CButton(
                  disabled: textEditingController.text.trim().isEmpty,
                  text: "Let’s geauxxxx!",
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const ChatScreen();
                        },
                      ),
                      (Route<dynamic> route) => false,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
