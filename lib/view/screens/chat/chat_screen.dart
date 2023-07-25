import 'package:flutter/material.dart';

import 'package:chatteree_mobile/view/components/chat/chat_footer.dart';
import 'package:chatteree_mobile/view/components/chat/chat_header.dart';
import 'package:chatteree_mobile/view/screens/layout/default.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      screen: LayoutBuilder(builder: (context, constraints) {
        return Container(
          constraints: BoxConstraints(
            maxWidth: constraints.maxWidth,
            maxHeight: constraints.maxHeight,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const ChatHeader(),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Placeholder(),
                    ),
                    ChatFooter(
                      textEditingController: textEditingController,
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
