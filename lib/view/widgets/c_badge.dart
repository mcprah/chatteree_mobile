import 'package:chatteree_mobile/utils/colors.dart';
import 'package:chatteree_mobile/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class CBadge extends StatelessWidget {
  const CBadge({
    super.key,
    this.label = '',
    this.labelColor,
    this.badgeColor,
    this.labelSize,
  });
  final String? label;
  final double? labelSize;
  final Color? labelColor;
  final Color? badgeColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        badges.Badge(
          badgeContent: Center(
            child: Text(
              label!,
              style: cSmallBodyTextStyle.copyWith(
                fontSize: labelSize ?? 10,
                fontWeight: FontWeight.w500,
                color: labelColor,
              ),
            ),
          ),
          badgeAnimation: const badges.BadgeAnimation.fade(),
          badgeStyle: badges.BadgeStyle(
            shape: badges.BadgeShape.circle,
            badgeColor: badgeColor ?? AppColors.accent,
            padding: const EdgeInsets.all(6),
            elevation: 0,
          ),
        ),
      ],
    );
  }
}
