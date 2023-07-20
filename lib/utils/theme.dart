import 'package:chatteree_mobile/utils/colors.dart';
import 'package:flutter/material.dart';

TextStyle bodyTextStyle = const TextStyle(
  color: AppColors.primary,
  fontSize: 15,
  fontWeight: FontWeight.normal,
);

TextStyle smallBodyTextStyle = const TextStyle(
  color: AppColors.primary,
  fontSize: 12,
  fontWeight: FontWeight.normal,
);

TextStyle subText = const TextStyle(
  color: AppColors.primary,
  fontSize: 14,
  fontWeight: FontWeight.normal,
);

// Inputs
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
