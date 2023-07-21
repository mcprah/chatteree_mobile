import 'package:chatteree_mobile/utils/colors.dart';
import 'package:chatteree_mobile/view/components/c_back_button.dart';
import 'package:chatteree_mobile/view/screens/auth/layout/default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Verify extends StatefulWidget {
  const Verify({super.key});

  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      screen: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                CBackButton(
                  onPressed: () {},
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24) +
                    const EdgeInsets.only(top: 24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
