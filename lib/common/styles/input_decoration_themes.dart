import 'package:flutter/material.dart';
import 'package:clean_architecture_template/common/styles/app_colors.dart';

class InputDecorationThemes {
  const InputDecorationThemes._();

  static final defaultStyle = InputDecorationTheme(
    fillColor: const Color(0xFFFFFBF8),
    filled: true,
    contentPadding: const EdgeInsets.only(
      left: 12,
      right: 12,
      top: 20,
      bottom: 20,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: CustomAppColors.gray4, width: 1),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: CustomAppColors.gray4, width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: CustomAppColors.primary, width: 2),
    ),
  );
}
