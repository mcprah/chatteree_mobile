import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CBackButton extends StatelessWidget {
  const CBackButton({super.key, required this.onPressed});
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 24,
      height: 24,
      child: IconButton(
        onPressed: onPressed,
        splashRadius: 20,
        padding: EdgeInsets.zero,
        icon: SvgPicture.asset(
          "assets/icons/icon/arrow/arrow-left.svg",
          width: 12,
          height: 12,
        ),
      ),
    );
  }
}
