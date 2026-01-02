import 'package:flutter/material.dart';
import 'package:clean_architecture_template/common/styles/app_colors.dart';

class InputDecorationThemes {
  const InputDecorationThemes._();

  static final defaultStyle = InputDecorationTheme(
    fillColor: CustomAppColors.white,
    filled: true,
    contentPadding: const EdgeInsets.only(
      left: 12,
      right: 12,
      top: 20,
      bottom: 20,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.grey, width: 0.5),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.grey, width: 0.5),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: CustomAppColors.primary, width: 2.5),
    ),
  );
}
