import 'package:flutter/material.dart';

import 'package:chatteree_mobile/models/message_model.dart';
import 'package:chatteree_mobile/models/user_model.dart';
import 'package:chatteree_mobile/view/components/chat/chat_bubble.dart';

class ChatConversation extends StatelessWidget {
  const ChatConversation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ChatBubble(
          message: Message(
            from: User(),
            messageSnippet: "Hello World",
            dateTime: '6:30pm',
          ),
          from: User(),
        ),
        const SizedBox(
          height: 16,
        ),
        ChatBubble(
          message: Message(
            from: User(),
            messageSnippet:
                "You for look sharp make we go see am before the day go end else la wu",
            dateTime: '6:30pm',
          ),
          from: User(),
          messageFromUser: false,
        ),
      ],
    );
  }
}
