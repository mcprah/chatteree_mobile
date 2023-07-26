import 'package:chatteree_mobile/providers/authentication_provider.dart';
import 'package:chatteree_mobile/utils/theme.dart';
import 'package:chatteree_mobile/view/components/commons/profile_pic.dart';
import 'package:chatteree_mobile/view/widgets/c_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatListHeader extends StatelessWidget {
  const ChatListHeader({super.key, this.title = "Chats"});
  final String title;

  @override
  Widget build(BuildContext context) {
    AuthenticationProvider authenticationProvider =
        context.watch<AuthenticationProvider>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            ProfilePic(
              imagePath: authenticationProvider.userData!.profileImageUrl,
              initial: authenticationProvider.userData!.name![0],
              minRadius: 20,
              fontSize: 18,
            ),
            const SizedBox(width: 18),
            Text(
              title,
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
