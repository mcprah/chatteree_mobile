import 'package:chatteree_mobile/models/message_model.dart';
import 'package:chatteree_mobile/models/user_model.dart';
import 'package:chatteree_mobile/providers/message_provider.dart';
import 'package:chatteree_mobile/repositories/message_repository.dart';
import 'package:chatteree_mobile/view/components/user_chat_message.dart';
import 'package:chatteree_mobile/view/widgets/c_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;

import 'package:chatteree_mobile/providers/authentication.dart';
import 'package:chatteree_mobile/utils/colors.dart';
import 'package:chatteree_mobile/utils/constants.dart';
import 'package:chatteree_mobile/utils/theme.dart';
import 'package:chatteree_mobile/view/components/chat_header.dart';
import 'package:chatteree_mobile/view/components/search_bar.dart';
import 'package:chatteree_mobile/view/screens/layout/default.dart';
import 'package:chatteree_mobile/view/widgets/c_button.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController textController = TextEditingController();
  late AuthenticationProvider authenticationProvider;
  late MessageProvider messageProvider;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      messageProvider.setUserMessageList();
      print("userMessageList: ${messageProvider.userMessageList}");
    });
  }

  Widget buildChatScreen({
    required AuthenticationProvider authenticationProvider,
    required MessageProvider messageProvider,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: SearchBar(
            searchTextController: textController,
            onSubmit: () {},
          ),
        ),
        const SizedBox(
          height: 60,
          width: double.infinity,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: messageProvider.userMessageList.length,
            itemBuilder: (BuildContext context, int index) {
              Message userMessage = messageProvider.userMessageList[index];

              return UserMessage(
                from: userMessage.from,
                dateTime: userMessage.dateTime ?? "",
                unreadCount: userMessage.unreadCount,
                messageSnippet: userMessage.messageSnippet,
              );
            },
          ),
        ),
      ],
    );
  }

  Widget buildFirstTimeScreen() {
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

  @override
  Widget build(BuildContext context) {
    authenticationProvider = context.watch<AuthenticationProvider>();
    messageProvider = context.watch<MessageProvider>();

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
            child: authenticationProvider.isFirstTimeUser ||
                    messageProvider.userMessageList.isEmpty
                ? buildFirstTimeScreen()
                : buildChatScreen(
                    authenticationProvider: authenticationProvider,
                    messageProvider: messageProvider,
                  ),
          ),
        ],
      ),
    );
  }
}
