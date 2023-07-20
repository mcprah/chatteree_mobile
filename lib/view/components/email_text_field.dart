import 'package:chatteree_mobile/view/widgets/c_icon_button.dart';
import 'package:chatteree_mobile/view/widgets/c_textfield.dart';
import 'package:flutter/material.dart';

class EmailTextFormField extends StatelessWidget {
  final TextEditingController emailController;
  final void Function() onSubmit;

  const EmailTextFormField({
    super.key,
    required this.emailController,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CTextField(
          textController: emailController,
          hasSuffixWidget: true,
          keyboardType: TextInputType.emailAddress,
        ),
        Positioned(
          top: 6,
          right: 8,
          child: CIconButton(
            onPressed: onSubmit,
            svgIconPath: "assets/icons/icon/arrow/arrow-right.svg",
          ),
        )
      ],
    );
  }
}
