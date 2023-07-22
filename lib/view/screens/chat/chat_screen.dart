import 'package:chatteree_mobile/providers/authentication.dart';
import 'package:chatteree_mobile/utils/colors.dart';
import 'package:chatteree_mobile/view/components/email_text_field.dart';
import 'package:chatteree_mobile/view/components/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:chatteree_mobile/utils/constants.dart';
import 'package:chatteree_mobile/utils/theme.dart';
import 'package:chatteree_mobile/view/components/chat_header.dart';
import 'package:chatteree_mobile/view/screens/layout/default.dart';
import 'package:chatteree_mobile/view/widgets/c_button.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AuthenticationProvider authenticationProvider =
        context.watch<AuthenticationProvider>();
    Widget buildChatSreen() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: SearchBar(
              searchTextController: textController,
              onSubmit: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) {},
                //   ),
                // );
              },
            ),
          ),
          Container(
            height: 60,
            width: double.infinity,
            color: AppColors.secondaryLight2,
            child: const Text("Status"),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Chat list"),
              ],
            ),
          ),
        ],
      );
    }

    Widget buildFirstTimeSreen() {
      return Column(
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
      );
    }

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
              child: authenticationProvider.isFirstTimeUser
                  ? buildFirstTimeSreen()
                  : buildChatSreen()),
        ],
      ),
    );
  }
}
