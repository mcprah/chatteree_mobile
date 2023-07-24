import 'package:chatteree_mobile/utils/colors.dart';
import 'package:chatteree_mobile/utils/theme.dart';
import 'package:flutter/material.dart';

class UserFilm extends StatelessWidget {
  const UserFilm({
    super.key,
    required this.username,
    this.hasUnviewedFilm = false,
    required this.thumbnailUrl,
  });
  final String username;
  final String thumbnailUrl;
  final bool? hasUnviewedFilm;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      splashFactory: NoSplash.splashFactory,
      onTap: () {
        print("View $username's films");
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: hasUnviewedFilm! ? AppColors.accent : AppColors.gray,
                width: 4,
              ),
              borderRadius: BorderRadius.circular(80),
            ),
            child: Container(
              height: 55,
              width: 55,
              margin: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: AppColors.accent,
                borderRadius: BorderRadius.circular(165),
              ),
              clipBehavior: Clip.hardEdge,
              child: CircleAvatar(
                backgroundColor: AppColors.gray,
                backgroundImage: NetworkImage(thumbnailUrl),
              ),
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          CustomTextWithHalfOverflow(
            text: username,
            style: cSmallBodyTextStyle.copyWith(
              fontWeight: FontWeight.w500,
            ),
            maxCharactersToShow: 8,
          ),
        ],
      ),
    );
  }
}

class CustomTextWithHalfOverflow extends StatelessWidget {
  final String text;
  final TextStyle style;
  final int maxCharactersToShow;

  CustomTextWithHalfOverflow({
    required this.text,
    required this.style,
    this.maxCharactersToShow = 10,
  });

  @override
  Widget build(BuildContext context) {
    final textLength = text.length;
    final showHalfText = textLength > maxCharactersToShow;

    return Text(
      showHalfText ? text.substring(0, maxCharactersToShow) + '...' : text,
      style: style,
      overflow: showHalfText ? TextOverflow.fade : TextOverflow.visible,
      softWrap: false,
    );
  }
}
