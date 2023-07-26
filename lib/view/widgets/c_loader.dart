import 'package:chatteree_mobile/utils/colors.dart';
import 'package:flutter/material.dart';

class CLoader extends StatelessWidget {
  const CLoader({
    super.key,
    this.height = 36,
    this.width = 36,
    this.strokeWidth = 1,
    this.color,
  });
  final double? height;
  final double? width;
  final double strokeWidth;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(8),
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth,
        color: color ?? AppColors.dark,
      ),
    );
  }
}
