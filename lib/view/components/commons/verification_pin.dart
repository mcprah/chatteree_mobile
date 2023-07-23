import 'package:chatteree_mobile/utils/colors.dart';
import 'package:chatteree_mobile/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationPinComponent extends StatefulWidget {
  const VerificationPinComponent({
    super.key,
    required this.textEditingController,
    this.beforeTextPaste,
    this.onChanged,
    this.onCompleted,
    this.hasError = false,
  });
  final TextEditingController textEditingController;
  final bool Function(String?)? beforeTextPaste;
  final bool hasError;
  final void Function(String)? onChanged;
  final void Function(String)? onCompleted;

  @override
  State<VerificationPinComponent> createState() => _VerificationPinState();
}

class _VerificationPinState extends State<VerificationPinComponent> {
  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      autoFocus: true,
      autovalidateMode: AutovalidateMode.always,
      enablePinAutofill: true,
      appContext: context,
      textStyle: cBodyTextStyle.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      pastedTextStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      length: 6,
      obscureText: false,
      obscuringCharacter: '*',
      animationType: AnimationType.fade,
      validator: (v) {
        if (v!.length < 6) {
          // return "Incomplete otp";
        } else {
          return null;
        }
        return null;
      },
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(12),
        fieldHeight: 68,
        fieldWidth: 54,
        activeColor: AppColors.light,
        inactiveColor: AppColors.light,
        selectedColor: AppColors.gray,
        inactiveFillColor: AppColors.secondaryLight2,
        selectedFillColor: AppColors.light,
        fieldOuterPadding: EdgeInsets.zero,
        activeFillColor:
            widget.hasError ? AppColors.accent : AppColors.secondaryLight2,
      ),
      cursorColor: Colors.black,
      animationDuration: const Duration(milliseconds: 300),
      backgroundColor: Colors.transparent,
      enableActiveFill: true,
      controller: widget.textEditingController,
      keyboardType: TextInputType.number,
      boxShadows: const [
        BoxShadow(
          offset: Offset(0, 1),
          color: Colors.black12,
          blurRadius: 10,
        )
      ],
      onCompleted: widget.onCompleted,
      onChanged: widget.onChanged,
      beforeTextPaste: widget.beforeTextPaste,
    );
  }
}
