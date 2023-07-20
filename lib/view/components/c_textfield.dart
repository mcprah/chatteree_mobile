import 'package:flutter/material.dart';

import 'package:chatteree_mobile/utils/colors.dart';
import 'package:chatteree_mobile/utils/theme.dart';

class CTextField extends StatefulWidget {

  final String placeholder;
  final String? label;
  final String? Function(String?)? validator;
  final TextEditingController textController;

    const CTextField({
    super.key,
    this.label,
    this.placeholder = "Enter text",
    this.validator,
    required this.textController,
  });

  @override
  State<CTextField> createState() => _CTextFieldState();
}

class _CTextFieldState extends State<CTextField> {
  @override
  Widget build(BuildContext context) {
    return FocusScope(
      autofocus: true,
      child: Focus(
        child: Builder(
          builder: (BuildContext context) {
            final FocusNode focusNode = Focus.of(context);
            final bool hasFocus = focusNode.hasFocus;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (widget.label != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8, left: 16),
                    child: Text(
                      widget.label!,
                      style: cSubText.copyWith(color: AppColors.gray),
                    ),
                  ),
                TextFormField(
                  controller: widget.textController,
                  cursorColor: AppColors.primary,
                  validator: (value) {
                    String? error = widget.validator?.call(value);
                    return error; // Return the validation error message to be displayed
                  },
                  decoration: InputDecoration(
                    hintText: widget.placeholder,
                    hintStyle: cBodyTextStyle.copyWith(color: AppColors.gray),
                    filled: true,
                    fillColor:
                        hasFocus ? AppColors.light : AppColors.secondaryLight,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                          color:
                              hasFocus ? Colors.transparent : AppColors.accent),
                    ),
                    focusedBorder: buildAccentStadiumBorder(),
                    enabledBorder: buildStadiumBorder(),
                    errorBorder: buildStadiumBorder(),
                    errorStyle: cSmallBodyTextStyle.copyWith(
                        color: AppColors.danger, height: 1),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 16,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
