import 'package:flutter/material.dart';

import 'package:chatteree_mobile/view/components/chat/chat_conversation.dart';
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
  final ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      screen: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // _____ Chat screen header _____ //
          const ChatHeader(),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // _____ Conversation _____ //
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: 24,
                      right: 24,
                    ),
                    width: double.infinity,
                    child: ChatConversation(
                      scrollController: scrollController,
                    ),
                  ),
                ),

                // _____ Chat footer _____ //
                ChatFooter(
                  textEditingController: textEditingController,
                  scrollController: scrollController,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
