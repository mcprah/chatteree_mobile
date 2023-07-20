import 'package:chatteree_mobile/view/widgets/c_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:chatteree_mobile/utils/theme.dart';
import 'package:chatteree_mobile/view/components/email_text_field.dart';
import 'package:chatteree_mobile/view/components/google_signin_button.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/images/logo.svg",
                width: 112,
              ),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24) +
                const EdgeInsets.only(top: 24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  "assets/images/onboarding-1.png",
                  width: MediaQuery.of(context).size.height * 0.4,
                ),
                const SizedBox(
                  height: 42,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.height * 0.26,
                  child: Text(
                    "Howdy chatter! Your peeps are waiting",
                    textAlign: TextAlign.center,
                    style: cHeading3TextStyle,
                  ),
                ),
                const SizedBox(
                  height: 42,
                ),
                Column(
                  children: [
                    EmailTextFormField(
                      emailController: emailController,
                      onSubmit: () {
                        // process signin
                      },
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    GoogleSignInButton(
                      onPressed: () {
                        // process goodle signin
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
