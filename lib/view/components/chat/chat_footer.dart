import 'package:chatteree_mobile/providers/authentication_provider.dart';
import 'package:chatteree_mobile/providers/message_provider.dart';
import 'package:flutter/material.dart';

import 'package:chatteree_mobile/utils/colors.dart';
import 'package:chatteree_mobile/utils/constants.dart';
import 'package:chatteree_mobile/view/components/chat/chat_textfield.dart';
import 'package:chatteree_mobile/view/widgets/c_icon_button.dart';
import 'package:provider/provider.dart';

class ChatFooter extends StatefulWidget {
  const ChatFooter({
    super.key,
    required this.textEditingController,
    this.scrollController,
  });
  final ScrollController? scrollController;

  final TextEditingController textEditingController;

  @override
  State<ChatFooter> createState() => _ChatFooterState();
}

class _ChatFooterState extends State<ChatFooter> {
  late bool hasTypedText;

  @override
  void initState() {
    super.initState();
    hasTypedText = widget.textEditingController.text.isNotEmpty;
  }

  void _scrollToBottom() {
    widget.scrollController!.animateTo(
      widget.scrollController!.position.maxScrollExtent,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    MessageProvider messageProvider = context.watch<MessageProvider>();
    AuthenticationProvider authenticationProvider =
        context.watch<AuthenticationProvider>();

    return Container(
      padding: const EdgeInsets.all(24.0) - const EdgeInsets.only(top: 8),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: AppColors.secondaryLight2,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: ChatTextField(
              textEditingController: widget.textEditingController,
              onChanged: (value) {
                setState(() {
                  hasTypedText = value.isEmpty;
                });
              },
              onEmojiPressed: () {},
            ),
          ),
          const SizedBox(
            width: 14,
          ),
          widget.textEditingController.text.isNotEmpty
              ? CIconButton(
                  onPressed: () {
                    messageProvider.sendMessage(
                      text: widget.textEditingController.text,
                      userId: authenticationProvider.userData!.id!,
                    );
                    _scrollToBottom();
                    setState(() {
                      widget.textEditingController.clear();
                      hasTypedText = false;
                    });
                  },
                  type: CButtonType.PRIMARY,
                  size: CSize.MD,
                  svgIconPath: "assets/icons/icon/interfaces/send.svg",
                )
              : Row(
                  children: [
                    CIconButton(
                      onPressed: () {},
                      type: CButtonType.SECONDARY,
                      iconColor: AppColors.dark,
                      svgIconPath: "assets/icons/icon/interfaces/paperclip.svg",
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    CIconButton(
                      onPressed: () {},
                      type: CButtonType.SECONDARY,
                      iconColor: AppColors.dark,
                      svgIconPath: "assets/icons/icon/media/microphone.svg",
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
