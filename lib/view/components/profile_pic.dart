import 'package:chatteree_mobile/utils/colors.dart';
import 'package:chatteree_mobile/utils/theme.dart';
import 'package:flutter/material.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    super.key,
    required this.imagePath,
    this.onTap,
    this.onImageError,
    this.initial,
    this.minRadius,
    this.fontSize,
  });
  final String imagePath;
  final void Function()? onTap;
  final void Function(Object, StackTrace?)? onImageError;
  final String? initial;
  final double? minRadius;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: AppColors.accentBold,
        backgroundImage: AssetImage(imagePath),
        onBackgroundImageError: onImageError,
        minRadius: minRadius ?? 34,
        child: initial != null
            ? Text(
                "M",
                style: cHeading3TextStyle.copyWith(
                  color: AppColors.light,
                  fontSize: fontSize ?? 22,
                ),
              )
            : null,
      ),
    );
  }
}
