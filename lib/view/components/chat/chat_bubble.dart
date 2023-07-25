import 'package:chatteree_mobile/models/message_model.dart';
import 'package:chatteree_mobile/models/user_model.dart';
import 'package:chatteree_mobile/utils/colors.dart';
import 'package:chatteree_mobile/utils/theme.dart';
import 'package:chatteree_mobile/view/components/commons/profile_pic.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key,
    required this.message,
    this.messageFromUser = true,
    required this.from,
    required this.dateTime,
  });
  final String message;
  final String dateTime;
  final bool messageFromUser;
  final User from;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        textDirection: messageFromUser ? TextDirection.rtl : TextDirection.ltr,
        children: [
          const ProfilePic(
            imagePath: "https://i.pravatar.cc/150?u=a042581f4e290267045",
            minRadius: 15,
            fontSize: 12,
          ),
          const SizedBox(
            width: 6,
          ),
          Expanded(
            flex: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
              decoration: BoxDecoration(
                color: messageFromUser
                    ? AppColors.dark
                    : AppColors.secondaryLight2,
                borderRadius: BorderRadius.circular(32),
              ),
              constraints: BoxConstraints(maxWidth: constraints.maxWidth * 0.8),
              child: Column(
                crossAxisAlignment: messageFromUser
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                children: [
                  Text(
                    dateTime,
                    style: cSmallBodyTextStyle.copyWith(
                      color: messageFromUser
                          ? AppColors.light
                          : AppColors.grayDark,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    message,
                    style: cBodyTextStyle.copyWith(
                      fontSize: 14,
                      color: messageFromUser ? AppColors.light : AppColors.dark,
                    ),
                    softWrap: true,
                  ),
                ],
              ),
            ),
          )
        ],
      );
    });
  }
}
