import 'package:chatteree_mobile/utils/colors.dart';
import 'package:chatteree_mobile/utils/constants.dart';
import 'package:chatteree_mobile/utils/theme.dart';
import 'package:chatteree_mobile/view/components/commons/profile_pic.dart';
import 'package:chatteree_mobile/view/screens/layout/default.dart';
import 'package:chatteree_mobile/view/widgets/c_icon_button.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  String favoriteIcon = "assets/icons/icon/interfaces/heart.svg";
  String favoriteIconFilled = "assets/icons/icon/interfaces/heart-filled.svg";
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      screen: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 12,
              left: 24,
              right: 24,
            ),
            child: SizedBox(
              height: 80,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const ProfilePic(
                        imagePath: null,
                        initial: "M",
                        minRadius: 20,
                        fontSize: 18,
                      ),
                      const SizedBox(width: 16),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Mullah",
                            style: cBodyTextStyle.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "Online",
                            style: cSmallBodyTextStyle.copyWith(
                                fontWeight: FontWeight.w500,
                                color: AppColors.success),
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      CIconButton(
                        onPressed: () {
                          setState(() {
                            isFavorite = !isFavorite;
                          });
                        },
                        type: CButtonType.SECONDARY,
                        iconColor:
                            isFavorite ? AppColors.accent : AppColors.primary,
                        svgIconPath:
                            isFavorite ? favoriteIconFilled : favoriteIcon,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      CIconButton(
                        onPressed: () {},
                        type: CButtonType.SECONDARY,
                        iconColor: AppColors.primary,
                        svgIconPath: "assets/icons/icon/interfaces/more-h.svg",
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
