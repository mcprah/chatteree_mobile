import 'package:chatteree_mobile/utils/colors.dart';
import 'package:chatteree_mobile/utils/constants.dart';
import 'package:chatteree_mobile/utils/theme.dart';
import 'package:chatteree_mobile/view/components/CButton.dart';
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
                        textController: TextEditingController(text: ''),
                        label: "Label",
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
                      CTextField(
                        textController: TextEditingController(text: 'p'),
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

class CTextField extends StatefulWidget {
  const CTextField({
    super.key,
    this.label,
    this.placeholder = "Enter text",
    this.validator,
    required this.textController,
  });
  final String placeholder;
  final String? label;
  final String? Function(String?)? validator;
  final TextEditingController textController;

  @override
  State<CTextField> createState() => _CTextFieldState();
}

class _CTextFieldState extends State<CTextField> {
  @override
  Widget build(BuildContext context) {
    return FocusScope(
      autofocus: true,
      child: Focus(
        child: Builder(
          builder: (BuildContext context) {
            final FocusNode focusNode = Focus.of(context);
            final bool hasFocus = focusNode.hasFocus;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (widget.label != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8, left: 16),
                    child: Text(
                      widget.label!,
                      style: subText.copyWith(color: AppColors.gray),
                    ),
                  ),
                TextFormField(
                  controller: widget.textController,
                  cursorColor: AppColors.primary,
                  validator: (value) {
                    String? error = widget.validator?.call(value);
                    return error; // Return the validation error message to be displayed
                  },
                  decoration: InputDecoration(
                    hintText: widget.placeholder,
                    hintStyle: bodyTextStyle.copyWith(color: AppColors.gray),
                    filled: true,
                    fillColor:
                        hasFocus ? AppColors.light : AppColors.secondaryLight,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                          color:
                              hasFocus ? Colors.transparent : AppColors.accent),
                    ),
                    focusedBorder: buildAccentStadiumBorder(),
                    enabledBorder: buildStadiumBorder(),
                    errorBorder: buildStadiumBorder(),
                    errorStyle: smallBodyTextStyle.copyWith(
                        color: AppColors.danger, height: 1),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 16,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
