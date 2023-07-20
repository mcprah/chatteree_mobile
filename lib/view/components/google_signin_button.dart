import 'package:chatteree_mobile/utils/constants.dart';
import 'package:chatteree_mobile/view/widgets/c_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GoogleSignInButton extends StatelessWidget {
  final VoidCallback onPressed;
  const GoogleSignInButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return CTextButton(
      text: "Continue with Google",
      type: CButtonType.SECONDARY,
      prefixIcon: SvgPicture.asset(
        "assets/icons/google_icon.svg",
        width: 112,
      ),
      onPressed: onPressed,
    );
  }
}
