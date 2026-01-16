import 'package:flutter/material.dart';
import 'package:clean_architecture_template/common/styles/app_colors.dart';
import 'package:clean_architecture_template/common/styles/icon_themes.dart';

class DropdownThemes {
  const DropdownThemes._();

  static final defaultStyle = DropdownMenuThemeData(
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      filled: true,
      fillColor: const Color(0xFFFFFBF8),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: CustomAppColors.gray4),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: CustomAppColors.gray4),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: CustomAppColors.primary, width: 2),
      ),
    ),
    textStyle: const TextStyle(
      fontSize: 16,
      color: CustomAppColors.primaryText,
    ),
    menuStyle: MenuStyle(
      backgroundColor: WidgetStateProperty.all(const Color(0xFFFFFBF8)),
      elevation: WidgetStateProperty.all(2),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      side: WidgetStateProperty.all(
        const BorderSide(color: CustomAppColors.gray4),
      ),
    ),
  );

  static const darkStyle = AppBarTheme(
    backgroundColor: CustomAppColors.darkScaffold,
    elevation: 0,
    iconTheme: IconThemes.darkStyle,
  );
}
