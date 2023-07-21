import 'package:chatteree_mobile/utils/constants.dart';
import 'package:chatteree_mobile/utils/theme.dart';
import 'package:chatteree_mobile/view/components/chat_header.dart';
import 'package:chatteree_mobile/view/components/profile_pic.dart';
import 'package:chatteree_mobile/view/screens/layout/default.dart';
import 'package:chatteree_mobile/view/widgets/c_button.dart';
import 'package:chatteree_mobile/view/widgets/c_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      screen: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.only(
              top: 12.0,
              left: 24,
              right: 24,
            ),
            child: ChatHeader(),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/first-time-welcome.png",
                  width: MediaQuery.of(context).size.height * 0.36,
                ),
                const SizedBox(
                  height: 42,
                ),
                Text(
                  "We hear say your mouth die hmmm",
                  textAlign: TextAlign.center,
                  style: cBodyTextStyle,
                ),
                const SizedBox(
                  height: 42,
                ),
                CButton(
                  text: "Start Chatting",
                  onPressed: () {},
                  type: CButtonType.ACCENT,
                  prefixIcon: SvgPicture.asset(
                    "assets/icons/icon/interfaces/edit-square-feather.svg",
                  ),
                ),
                const SizedBox(
                  height: 62,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
