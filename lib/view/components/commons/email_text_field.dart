import 'package:chatteree_mobile/providers/authentication_provider.dart';
import 'package:chatteree_mobile/utils/colors.dart';
import 'package:chatteree_mobile/view/widgets/c_loader.dart';
import 'package:flutter/material.dart';

import 'package:chatteree_mobile/view/widgets/c_icon_button.dart';
import 'package:chatteree_mobile/view/widgets/c_textfield.dart';
import 'package:provider/provider.dart';

class EmailTextFormField extends StatefulWidget {
  final TextEditingController emailController;
  final void Function() onSubmit;

  const EmailTextFormField({
    super.key,
    required this.emailController,
    required this.onSubmit,
  });

  @override
  State<EmailTextFormField> createState() => _EmailTextFormFieldState();
}

class _EmailTextFormFieldState extends State<EmailTextFormField> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AuthenticationProvider authenticationProvider =
        context.watch<AuthenticationProvider>();

    return Form(
      key: formKey,
      child: Stack(
        children: [
          CTextField(
            textController: widget.emailController,
            hasSuffixWidget: true,
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) {
              if (value.isEmpty) {
                formKey.currentState!.validate();
                authenticationProvider.isValidatingEmail = false;
                return;
              } else if (value.length > 3 && formKey.currentState!.validate()) {
                authenticationProvider.isValidatingEmail = false;
              }
            },
            validator: (value) => authenticationProvider.validateEmail(value),
          ),
          Positioned(
            top: 6,
            right: 6,
            child: authenticationProvider.isValidatingEmail
                ? const CLoader()
                : CIconButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        widget.onSubmit.call();
                      }
                      authenticationProvider.isValidatingEmail = false;
                    },
                    svgIconPath: "assets/icons/icon/arrow/arrow-right.svg",
                  ),
          )
        ],
      ),
    );
  }
}
