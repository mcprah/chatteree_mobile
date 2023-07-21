import 'package:chatteree_mobile/utils/colors.dart';
import 'package:chatteree_mobile/view/components/verification_pin.dart';
import 'package:chatteree_mobile/view/widgets/c_button.dart';
import 'package:flutter/material.dart';

import 'package:chatteree_mobile/utils/theme.dart';
import 'package:chatteree_mobile/view/components/back_button.dart';
import 'package:chatteree_mobile/view/screens/layout/default.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class Verify extends StatefulWidget {
  const Verify({super.key});

  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  TextEditingController textEditingController = TextEditingController();

  String currentText = "";
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      screen: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CBackButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(
                  top: 24,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Check your mail",
                      style: cHeading3TextStyle,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    RichText(
                      text: TextSpan(
                        text: "Enter the confirmation code sent to",
                        style: cBodyTextStyle,
                        children: const [
                          TextSpan(
                              text: " kwesiokyere@gmail.com ",
                              style: TextStyle(fontWeight: FontWeight.w500)),
                          TextSpan(
                            text: "to verify that it is you.",
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    VerificationPin(
                      textEditingController: textEditingController,
                      onCompleted: (v) {
                        print("Completed");
                        print(v);
                      },
                      onChanged: (value) {
                        setState(() {
                          currentText = value;
                        });
                      },
                      beforeTextPaste: (text) {
                        print("Allowing to paste $text");
                        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                        //but you can show anything you want here, like your pop up saying wrong paste format or etc
                        return true;
                      },
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {},
                          style: const ButtonStyle(
                            splashFactory: NoSplash.splashFactory,
                            overlayColor: MaterialStatePropertyAll(
                              AppColors.secondaryLight,
                            ),
                            enableFeedback: false,
                          ),
                          child: Text(
                            "Resend code",
                            style: cBodyTextStyle.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        CButton(
                          text: "Verify",
                          onPressed: () {},
                          minWidth: 80,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/onboarding-2.png",
                          width: MediaQuery.of(context).size.height * 0.3,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
