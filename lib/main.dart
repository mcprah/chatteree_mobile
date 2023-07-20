import 'package:chatteree_mobile/utils/colors.dart';
import 'package:chatteree_mobile/utils/constants.dart';
import 'package:chatteree_mobile/utils/theme.dart';
import 'package:chatteree_mobile/view/components/c_button.dart';
import 'package:chatteree_mobile/view/components/c_dropdown.dart';
import 'package:chatteree_mobile/view/components/c_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return MaterialApp(
      title: 'Chatteree',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'GeneralSans',
        bottomSheetTheme: BottomSheetThemeData(
          modalBackgroundColor: Colors.transparent,
          modalBarrierColor: Colors.black.withOpacity(0.15),
          elevation: 0,
        ),
        // inputDecorationTheme: InputDecorationTheme(
        //   focusedBorder: buildAccentStadiumBorder(),
        //   enabledBorder: buildStadiumBorder(),
        //   contentPadding: const EdgeInsets.symmetric(
        //     horizontal: 24,
        //     vertical: 18,
        //   ),
        // ),
      ),
      home: Scaffold(
        backgroundColor: AppColors.light,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CTextField(
                        textController: TextEditingController(),
                        label: "Label",
                        placeholder: "Typeee",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Not be empty';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      CDropdown(
                        dropdownItems: const ["Maame", "Ama", "Adwoa", "Mansa"],
                        selectedValue: '',
                        placeholder: "Select option",
                        textController: TextEditingController(),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      CButton(
                        text: "Submit",
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {}
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
