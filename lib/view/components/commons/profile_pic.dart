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
    this.isOnline = false,
    this.showStatusIndicator = false,
    this.backgroundColor,
  });
  final String? imagePath;
  final void Function()? onTap;
  final void Function(Object, StackTrace?)? onImageError;
  final String? initial;
  final double? minRadius;
  final double? fontSize;
  final bool isOnline;
  final bool showStatusIndicator;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        children: [
          CircleAvatar(
            backgroundColor: backgroundColor ?? AppColors.accentDark,
            backgroundImage:
                imagePath != null ? NetworkImage(imagePath!) : null,
            onBackgroundImageError: onImageError,
            minRadius: minRadius ?? 34,
            child: imagePath == null
                ? initial != null || imagePath == ""
                    ? Text(
                        initial!,
                        style: cHeading3TextStyle.copyWith(
                          color: AppColors.light.withOpacity(0.5),
                          fontSize: fontSize ?? 22,
                        ),
                      )
                    : null
                : null,
          ),
          if (showStatusIndicator)
            Positioned(
              bottom: 0,
              right: 0,
              child: ClipOval(
                child: Container(
                  width: 14,
                  height: 16,
                  decoration: BoxDecoration(
                    color: isOnline ? AppColors.success : AppColors.gray,
                    border: Border.all(
                      color: AppColors.light,
                      width: 2,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
