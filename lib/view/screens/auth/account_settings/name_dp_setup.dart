import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:chatteree_mobile/providers/authentication_provider.dart';
import 'package:chatteree_mobile/utils/colors.dart';
import 'package:chatteree_mobile/utils/constants.dart';
import 'package:chatteree_mobile/utils/notification.dart';
import 'package:chatteree_mobile/utils/theme.dart';
import 'package:chatteree_mobile/utils/utils.dart';
import 'package:chatteree_mobile/view/screens/chat/chat_list_screen.dart';
import 'package:chatteree_mobile/view/widgets/c_button.dart';
import 'package:chatteree_mobile/view/widgets/c_loader.dart';
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
  final formKey2 = GlobalKey<FormState>();
  int charInputLimit = 18;
  late int remainingText;
  File? imageFile;
  TextEditingController textEditingController = TextEditingController();
  bool isValidatingName = false;

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
                Form(
                  key: formKey2,
                  child: Column(
                    children: [
                      CTextField(
                        label: "Your name",
                        textController: textEditingController,
                        placeholder: "",
                        maxLength: charInputLimit,
                        onChanged: (val) {
                          formKey2.currentState!.validate();
                          if (val.isEmpty) {
                            remainingText = charInputLimit;
                            setState(() {});
                          } else {
                            isValidatingName = true;
                            calculateRemainingChars(
                              charCount: textEditingController.text.length,
                              charInputLimit: charInputLimit,
                            );
                            if (val.length < 2) {
                              widget.authenticationProvider.isValidName = null;
                            }
                            // mimic validation load time
                            Future.delayed(const Duration(milliseconds: 500),
                                () {
                              setState(() {
                                isValidatingName = false;
                              });
                            });
                          }
                        },
                        validator: (value) {
                          return widget.authenticationProvider
                              .validateName(value);
                        },
                        suffix: isValidatingName
                            ? const CLoader(
                                width: 40,
                                height: 40,
                              )
                            : widget.authenticationProvider.isValidName != null
                                ? widget.authenticationProvider.isValidName!
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
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 42,
                ),
                CButton(
                  disabled: widget.authenticationProvider.isValidName == null ||
                      !widget.authenticationProvider.isValidName!,
                  text: "Let’s geauxxxx!",
                  onPressed: () {
                    if (formKey2.currentState!.validate()) {
                      // Set user's name
                      widget.authenticationProvider.userData!.name =
                          textEditingController.text;
                      // Set user's profile picture
                      if (imageFile != null) {
                        // widget.authenticationProvider.userData!
                        //     .profileImageUrl = imageFile!.path;
                      } else {
                        widget.authenticationProvider.userData!
                                .profileImageUrl =
                            "https://i.pravatar.cc/150?u=a042581fjjf9022314d";
                        widget.authenticationProvider.userData!
                            .profileImageUrl = null;
                      }

                      // Set user's online status
                      widget.authenticationProvider.userData!.onlineStatus =
                          true;

                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const ChatListScreen();
                          },
                        ),
                        (Route<dynamic> route) => false,
                      );
                    }
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
