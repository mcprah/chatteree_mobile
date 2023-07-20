import 'package:chatteree_mobile/utils/colors.dart';
import 'package:flutter/material.dart';

///
/// TextStyles
///

TextStyle cHeading3TextStyle = const TextStyle(
  color: AppColors.primary,
  fontSize: 22,
  fontWeight: FontWeight.w600,
);

TextStyle cBodyTextStyle = const TextStyle(
  color: AppColors.primary,
  fontSize: 15,
  fontWeight: FontWeight.normal,
);

TextStyle cSmallBodyTextStyle = const TextStyle(
  color: AppColors.primary,
  fontSize: 12,
  fontWeight: FontWeight.normal,
);

TextStyle cSubText = const TextStyle(
  color: AppColors.primary,
  fontSize: 14,
  fontWeight: FontWeight.normal,
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


