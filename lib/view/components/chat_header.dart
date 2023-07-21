import 'package:chatteree_mobile/utils/theme.dart';
import 'package:chatteree_mobile/view/components/profile_pic.dart';
import 'package:chatteree_mobile/view/widgets/c_icon_button.dart';
import 'package:flutter/material.dart';

class ChatHeader extends StatelessWidget {
  const ChatHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            ProfilePic(
              imagePath: '',
              onImageError: (p0, p1) {},
              initial: "M",
              minRadius: 20,
              fontSize: 18,
            ),
            const SizedBox(width: 18),
            Text(
              "Chats",
              style: cHeading3TextStyle,
            )
          ],
        ),
        CIconButton(
          onPressed: () {},
          svgIconPath: "assets/icons/icon/interfaces/edit-square-feather.svg",
        )
      ],
    );
  }
}
