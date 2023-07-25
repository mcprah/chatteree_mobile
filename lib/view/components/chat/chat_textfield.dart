import 'package:flutter/material.dart';

import 'package:chatteree_mobile/utils/colors.dart';
import 'package:chatteree_mobile/utils/constants.dart';
import 'package:chatteree_mobile/view/widgets/c_icon_button.dart';
import 'package:chatteree_mobile/view/widgets/c_textfield.dart';

class ChatTextField extends StatelessWidget {
  const ChatTextField({
    Key? key,
    required this.textEditingController,
    required this.onEmojiPressed,
    required this.onChanged,
  }) : super(key: key);
  final TextEditingController textEditingController;
  final void Function(String) onChanged;
  final void Function() onEmojiPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CTextField(
          placeholder: "Type your message",
          textController: textEditingController,
          keyboardType: TextInputType.multiline,
          maxLines: null,
          onChanged: onChanged,
          hasSuffixWidget: true,
        ),
        Positioned(
          top: 6,
          right: 6,
          child: CIconButton(
            onPressed: onEmojiPressed,
            type: CButtonType.SECONDARY,
            iconColor: AppColors.dark,
            svgIconPath: "assets/icons/icon/interfaces/smile.svg",
          ),
        )
      ],
    );
  }
}
