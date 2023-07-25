import 'package:chatteree_mobile/providers/message_provider.dart';
import 'package:flutter/material.dart';

import 'package:chatteree_mobile/utils/colors.dart';
import 'package:chatteree_mobile/utils/constants.dart';
import 'package:chatteree_mobile/utils/theme.dart';
import 'package:chatteree_mobile/view/components/commons/profile_pic.dart';
import 'package:chatteree_mobile/view/widgets/c_icon_button.dart';
import 'package:provider/provider.dart';

class ChatHeader extends StatefulWidget {
  const ChatHeader({super.key});

  @override
  State<ChatHeader> createState() => _ChatHeaderState();
}

class _ChatHeaderState extends State<ChatHeader> {
  String favoriteIcon = "assets/icons/icon/interfaces/heart.svg";
  String favoriteIconFilled = "assets/icons/icon/interfaces/heart-filled.svg";
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    MessageProvider messageProvider = context.watch<MessageProvider>();

    return Container(
      padding: const EdgeInsets.only(
        left: 24,
        right: 24,
        bottom: 4,
      ),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.secondaryLight2,
          ),
        ),
      ),
      child: SizedBox(
        height: 60,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ProfilePic(
                  imagePath:
                      messageProvider.activeMessage!.from.profileImageUrl,
                  initial: messageProvider.activeMessage!.from.name![0],
                  minRadius: 20,
                  fontSize: 18,
                ),
                const SizedBox(width: 16),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      messageProvider.activeMessage!.from.name!,
                      style: cBodyTextStyle.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      messageProvider.activeMessage!.from.onlineStatus!
                          ? "Online"
                          : 'Offline',
                      style: cSmallBodyTextStyle.copyWith(
                        fontWeight: FontWeight.w500,
                        color: messageProvider.activeMessage!.from.onlineStatus!
                            ? AppColors.success
                            : AppColors.gray,
                      ),
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
                  iconColor: isFavorite ? AppColors.accent : AppColors.primary,
                  svgIconPath: isFavorite ? favoriteIconFilled : favoriteIcon,
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
    );
  }
}
