import 'package:chatteree_mobile/utils/colors.dart';
import 'package:chatteree_mobile/utils/constants.dart';
import 'package:flutter/material.dart';

class CButton extends StatelessWidget {
  const CButton({
    super.key,
    required this.text,
    this.prefixIcon,
    this.suffixIcon,
    required this.onPressed,
    this.size = CSize.MD,
    this.disabled = false,
    this.type = CType.PRIMARY,
  });

  final String text;
  final CSize? size;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final VoidCallback onPressed;
  final bool disabled;
  final CType type;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: !disabled ? onPressed : null,
      style: ElevatedButton.styleFrom(
        disabledBackgroundColor: type == CType.PRIMARY
            ? disabled
                ? AppColors.gray
                : null
            : AppColors.light,
        backgroundColor:
            type == CType.PRIMARY ? AppColors.primary : AppColors.light,
        shadowColor: Colors.transparent,
        elevation: 0,
        shape: StadiumBorder(
          side: type == CType.PRIMARY
              ? BorderSide.none
              : const BorderSide(
                  width: 1,
                  color: AppColors.secondaryLight2,
                ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: size == CSize.SM
              ? prefixIcon != null
                  ? 2
                  : 20
              : prefixIcon != null
                  ? 12
                  : 24,
          right: size == CSize.SM
              ? suffixIcon != null
                  ? 2
                  : 20
              : suffixIcon != null
                  ? 12
                  : 24,
          top: size == CSize.SM ? 8 : 12,
          bottom: size == CSize.SM ? 8 : 12,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (prefixIcon != null)
              Row(
                children: [
                  SizedBox(
                    height: 24,
                    width: 24,
                    child: prefixIcon!,
                  ),
                  const SizedBox(width: 12),
                ],
              ),
            Text(
              text,
              style: TextStyle(
                fontSize: size == CSize.SM ? 14 : 15,
                color: type == CType.PRIMARY
                    ? !disabled
                        ? AppColors.accent
                        : AppColors.light
                    : !disabled
                        ? AppColors.primary
                        : AppColors.gray,
              ),
            ),
            if (suffixIcon != null)
              Row(
                children: [
                  const SizedBox(width: 8),
                  SizedBox(
                    height: 24,
                    width: 24,
                    child: suffixIcon!,
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
