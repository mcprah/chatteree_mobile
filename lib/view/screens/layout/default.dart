import 'package:chatteree_mobile/utils/colors.dart';
import 'package:flutter/material.dart';

class DefaultLayout extends StatelessWidget {
  const DefaultLayout({super.key, required this.screen});
  final Widget screen;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.light,
      body: SafeArea(
        top: true,
        bottom: false,
        child: screen,
      ),
    );
  }
}
