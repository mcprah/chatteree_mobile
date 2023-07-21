import 'package:chatteree_mobile/utils/colors.dart';
import 'package:flutter/material.dart';

///
/// TextStyles
///

TextStyle cHeading3TextStyle = const TextStyle(
  color: AppColors.primary,
  fontSize: 22,
  fontWeight: FontWeight.w600,
  fontFamily: "GeneralSans",
);

TextStyle cBodyTextStyle = const TextStyle(
  color: AppColors.primary,
  fontSize: 15,
  fontWeight: FontWeight.normal,
  fontFamily: "GeneralSans",
);

TextStyle cSmallBodyTextStyle = const TextStyle(
  color: AppColors.primary,
  fontSize: 12,
  fontWeight: FontWeight.normal,
  fontFamily: "GeneralSans",
);

TextStyle cSubText = const TextStyle(
  color: AppColors.primary,
  fontSize: 14,
  fontWeight: FontWeight.normal,
  fontFamily: "GeneralSans",
);

///
/// Input Styles
///

InputDecoration cDefaultInputDecoration = InputDecoration(
  hintStyle: cBodyTextStyle.copyWith(color: AppColors.gray),
  filled: true,
  fillColor: AppColors.secondaryLight,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(30),
    borderSide: const BorderSide(color: Colors.transparent),
  ),
  focusedBorder: buildAccentStadiumBorder(),
  enabledBorder: buildStadiumBorder(),
  errorBorder: buildStadiumBorder(),
  errorStyle: cSmallBodyTextStyle.copyWith(color: AppColors.danger, height: 1),
  contentPadding: const EdgeInsets.symmetric(
    horizontal: 24,
    vertical: 16,
  ),
);

InputBorder buildAccentStadiumBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(30),
    borderSide: BorderSide(
      width: 3,
      strokeAlign: 1,
      color: AppColors.accent.withOpacity(0.5),
    ),
  );
}

InputBorder buildStadiumBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(30),
    borderSide: const BorderSide(
      width: 1,
      strokeAlign: 0,
      color: Colors.transparent,
    ),
  );
}

/// Snackbar

SnackBar snackBar = SnackBar(
  backgroundColor: Colors.transparent,
  elevation: 0,
  content: Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.greenAccent,
        border: Border.all(color: Colors.green, width: 3),
        boxShadow: const [
          BoxShadow(
            color: Color(0x19000000),
            spreadRadius: 2.0,
            blurRadius: 8.0,
            offset: Offset(2, 4),
          )
        ],
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          const Icon(Icons.favorite, color: Colors.green),
          const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text('Yay! A SnackBar!\nYou did great!',
                style: TextStyle(color: Colors.green)),
          ),
          const Spacer(),
          TextButton(onPressed: () => debugPrint("Undid"), child: Text("Undo"))
        ],
      )),
);
