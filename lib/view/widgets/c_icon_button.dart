import 'package:flutter/material.dart';

import 'package:chatteree_mobile/utils/colors.dart';
import 'package:chatteree_mobile/utils/constants.dart';
import 'package:flutter_svg/svg.dart';

class CIconButton extends StatelessWidget {
  final CSize? size;
  final String svgIconPath;
  final VoidCallback onPressed;
  final bool disabled;
  final CButtonType type;

  const CIconButton({
    super.key,
    required this.onPressed,
    this.size = CSize.SM,
    this.disabled = false,
    this.type = CButtonType.PRIMARY,
    required this.svgIconPath,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: size == CSize.SM ? const Size(40, 40) : const Size(48, 48),
      child: ClipOval(
        child: Material(
          color: !disabled ? AppColors.primary : AppColors.gray,
          child: InkWell(
            onTap: !disabled ? onPressed : null,
            child: Center(
              child: SvgPicture.asset(
                svgIconPath,
                color: AppColors.accent,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
