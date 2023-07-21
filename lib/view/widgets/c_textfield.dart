import 'package:flutter/material.dart';

import 'package:chatteree_mobile/utils/colors.dart';
import 'package:chatteree_mobile/utils/theme.dart';

class CTextField extends StatelessWidget {
  final String placeholder;
  final String? label;
  final String? Function(String?)? validator;
  final TextEditingController textController;
  final bool? hasSuffixWidget;
  final TextInputType? keyboardType;
  final Widget? prefix;
  final Widget? suffix;
  final int? maxLength;
  final void Function(String)? onChanged;

  const CTextField({
    super.key,
    this.label,
    this.placeholder = "Enter text",
    this.validator,
    required this.textController,
    this.hasSuffixWidget = false,
    this.keyboardType,
    this.prefix,
    this.suffix,
    this.onChanged,
    this.maxLength,
  });

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
                if (label != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8, left: 16),
                    child: Text(
                      label!,
                      style: cSubText.copyWith(color: AppColors.gray),
                    ),
                  ),
                Stack(
                  children: [
                    TextFormField(
                      controller: textController,
                      keyboardType: keyboardType ?? TextInputType.text,
                      cursorColor: AppColors.primary,
                      validator: (value) {
                        String? error = validator?.call(value);
                        return error;
                      },
                      onTapOutside: (e) {
                        if (FocusScope.of(context).hasFocus) {
                          FocusScope.of(context).unfocus();
                        }
                      },
                      maxLength: maxLength,
                      onChanged: onChanged,
                      style: cBodyTextStyle.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: InputDecoration(
                          hintText: placeholder,
                          hintStyle:
                              cBodyTextStyle.copyWith(color: AppColors.gray),
                          filled: true,
                          fillColor: hasFocus
                              ? AppColors.light
                              : AppColors.secondaryLight,
                          counterText: '',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                                color: hasFocus
                                    ? Colors.transparent
                                    : AppColors.accent),
                          ),
                          focusedBorder: buildAccentStadiumBorder(),
                          enabledBorder: buildStadiumBorder(),
                          errorBorder: buildStadiumBorder(),
                          errorStyle: cSmallBodyTextStyle.copyWith(
                            color: AppColors.danger,
                            height: 1,
                          ),
                          contentPadding: !hasSuffixWidget!
                              ? prefix == null
                                  ? const EdgeInsets.symmetric(
                                      horizontal: 24,
                                      vertical: 16,
                                    )
                                  : const EdgeInsets.only(
                                      top: 16,
                                      bottom: 16,
                                      right: 24,
                                      left: 48,
                                    )
                              : const EdgeInsets.only(
                                  top: 16,
                                  bottom: 16,
                                  left: 24,
                                  right: 56,
                                )),
                    ),
                    if (prefix != null)
                      Positioned(
                        top: 14,
                        left: 14,
                        child: SizedBox(
                          height: 24,
                          width: 24,
                          child: prefix!,
                        ),
                      ),
                    if (suffix != null)
                      Positioned(
                        top: 14,
                        right: 14,
                        child: SizedBox(
                          height: 24,
                          width: 24,
                          child: suffix!,
                        ),
                      )
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
