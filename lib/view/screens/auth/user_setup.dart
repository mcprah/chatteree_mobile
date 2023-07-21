import 'package:chatteree_mobile/view/screens/auth/profile/name_dp_setup.dart';
import 'package:chatteree_mobile/view/screens/layout/default.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:chatteree_mobile/providers/authentication.dart';
import 'package:chatteree_mobile/view/screens/auth/profile/username_setup.dart';

class UserSetup extends StatelessWidget {
  const UserSetup({super.key});

  @override
  Widget build(BuildContext context) {
    AuthenticationProvider authenticationProvider =
        context.watch<AuthenticationProvider>();
    final PageController pageController = PageController();

    return DefaultLayout(
      screen: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            children: [
              UsernameSetup(
                authenticationProvider: authenticationProvider,
                pageController: pageController,
              ),
              NameDPSetup(
                authenticationProvider: authenticationProvider,
                pageController: pageController,
              ),
            ],
          )),
    );
  }
}
