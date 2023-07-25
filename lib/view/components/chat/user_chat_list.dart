import 'package:chatteree_mobile/view/screens/chat/chat_screen.dart';
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

        var messageValues = userMessage.value!;

        String latestText = messageValues
                .lastWhere((e) => e.userId == userMessage.from.id)
                .text ??
            '';

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: UserMessage(
            from: userMessage.from,
            dateTime: userMessage.dateTime ?? "",
            unreadCount: userMessage.unreadCount,
            value: latestText,
            onTap: () {
              messageProvider.activeMessage = userMessage;
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const ChatScreen();
                },
              ));
            },
          ),
        );
      },
    );
  }
}
