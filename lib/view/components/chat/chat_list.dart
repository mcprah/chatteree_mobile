import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:chatteree_mobile/models/message_model.dart';
import 'package:chatteree_mobile/providers/message_provider.dart';
import 'package:chatteree_mobile/view/components/chat/user_chat_message.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    MessageProvider messageProvider = context.watch<MessageProvider>();

    return ListView.builder(
      itemCount: messageProvider.userMessageList.length,
      itemBuilder: (BuildContext context, int index) {
        Message userMessage = messageProvider.userMessageList[index];

        return UserMessage(
          from: userMessage.from,
          dateTime: userMessage.dateTime ?? "",
          unreadCount: userMessage.unreadCount,
          messageSnippet: userMessage.messageSnippet,
          onTap: () {
            print("userMessage: ${userMessage.toJson()}");
          },
        );
      },
    );
  }
}
