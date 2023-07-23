import 'package:chatteree_mobile/models/user_model.dart';
import 'package:chatteree_mobile/utils/colors.dart';
import 'package:chatteree_mobile/utils/theme.dart';
import 'package:chatteree_mobile/view/components/profile_pic.dart';
import 'package:chatteree_mobile/view/widgets/c_badge.dart';
import 'package:flutter/material.dart';

class UserMessage extends StatelessWidget {
  const UserMessage({
    super.key,
    required this.dateTime,
    required this.messageSnippet,
    required this.from,
    this.unreadCount,
    this.onTap,
  });
  final User from;
  final String dateTime;
  final String messageSnippet;
  final int? unreadCount;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 12,
        ),
        child: Row(
          children: [
            ProfilePic(
              imagePath: from.profileImageUrl,
              initial: from.name![0],
              minRadius: 24,
              fontSize: 18,
              showStatusIndicator: true,
              isOnline: from.onlineStatus!,
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: LayoutBuilder(builder: (context, constriant) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          from.name ?? "",
                          overflow: TextOverflow.ellipsis,
                          style: cBodyTextStyle.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                          maxLines: 1,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          dateTime,
                          style: cBodyTextStyle.copyWith(
                            color: AppColors.grayDark,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 4),
                      width: constriant.maxWidth,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: constriant.maxWidth * 0.91,
                            child: Text(
                              messageSnippet,
                              style: cBodyTextStyle.copyWith(
                                fontWeight: unreadCount == 0
                                    ? FontWeight.w300
                                    : FontWeight.w400,
                                color: unreadCount == 0
                                    ? AppColors.grayDark
                                    : AppColors.dark,
                                fontSize: 14,
                              ),
                              textWidthBasis: TextWidthBasis.parent,
                              softWrap: true,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          if (unreadCount != 0)
                            CBadge(
                              label: unreadCount.toString(),
                            ),
                        ],
                      ),
                    ),
                  ],
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
