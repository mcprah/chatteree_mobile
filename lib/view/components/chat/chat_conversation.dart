import 'package:chatteree_mobile/providers/authentication_provider.dart';
import 'package:chatteree_mobile/providers/message_provider.dart';
import 'package:flutter/material.dart';

import 'package:chatteree_mobile/models/message_model.dart';
import 'package:chatteree_mobile/view/components/chat/chat_bubble.dart';
import 'package:provider/provider.dart';

class ChatConversation extends StatelessWidget {
  const ChatConversation({super.key});

  @override
  Widget build(BuildContext context) {
    MessageProvider messageProvider = context.watch<MessageProvider>();
    AuthenticationProvider authenticationProvider =
        context.watch<AuthenticationProvider>();

    return ListView.builder(
      reverse: true,
      itemCount: messageProvider.activeMessage!.value!.length,
      itemBuilder: (BuildContext context, int idx) {
        Value messageValue = messageProvider.activeMessage!.value![idx];
        bool messageFromUser =
            messageValue.userId == authenticationProvider.userData!.id;

        return Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: ChatBubble(
            message: messageValue.text ?? '',
            from: messageProvider.activeMessage!.from,
            dateTime: messageProvider.activeMessage!.dateTime ?? '',
            messageFromUser: messageFromUser,
          ),
        );
      },
    );
  }
}
