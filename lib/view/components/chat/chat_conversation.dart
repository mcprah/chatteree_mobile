import 'package:chatteree_mobile/providers/authentication_provider.dart';
import 'package:chatteree_mobile/providers/message_provider.dart';
import 'package:flutter/material.dart';

import 'package:chatteree_mobile/models/message_model.dart';
import 'package:chatteree_mobile/view/components/chat/chat_bubble.dart';
import 'package:provider/provider.dart';

class ChatConversation extends StatefulWidget {
  const ChatConversation({
    super.key,
    required this.scrollController,
  });
  final ScrollController scrollController;

  @override
  State<ChatConversation> createState() => _ChatConversationState();
}

class _ChatConversationState extends State<ChatConversation> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.scrollController
          .jumpTo(widget.scrollController.position.maxScrollExtent);
    });
  }

  @override
  Widget build(BuildContext context) {
    MessageProvider messageProvider = context.watch<MessageProvider>();
    AuthenticationProvider authenticationProvider =
        context.watch<AuthenticationProvider>();

    return ListView.builder(
      padding: const EdgeInsets.only(
        top: 16,
      ),
      reverse: true,
      controller: widget.scrollController,
      itemCount: messageProvider.activeMessage!.value!.length,
      itemBuilder: (BuildContext context, int idx) {
        Value messageValue = messageProvider.activeMessage!.value![idx];
        bool messageFromUser =
            messageValue.userId == authenticationProvider.userData!.id;

        return Padding(
          padding: const EdgeInsets.only(
            bottom: 16,
          ),
          child: ChatBubble(
            message: messageValue.text ?? '',
            from: messageFromUser
                ? authenticationProvider.userData!
                : messageProvider.activeMessage!.from,
            dateTime: messageValue.dateTime ?? '',
            messageFromUser: messageFromUser,
          ),
        );
      },
    );
  }
}
