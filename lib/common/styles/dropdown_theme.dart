import 'package:flutter/material.dart';
import 'package:clean_architecture_template/common/styles/app_colors.dart';
import 'package:clean_architecture_template/common/styles/icon_themes.dart';

class DropdownThemes {
  const DropdownThemes._();

  static final defaultStyle = DropdownMenuThemeData(
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10), // Rounded corners
        borderSide: BorderSide(color: Colors.grey.shade400),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.grey.shade400),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.grey.shade600),
      ),
    ),
    textStyle: const TextStyle(fontSize: 16, color: Colors.black),
    menuStyle: MenuStyle(
      backgroundColor: WidgetStateProperty.all(Colors.white),
      elevation: WidgetStateProperty.all(0),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      side: WidgetStateProperty.all(BorderSide(color: Colors.grey.shade400)),
    ),
  );

  static const darkStyle = AppBarTheme(
    backgroundColor: CustomAppColors.darkScaffold,
    elevation: 0,
    iconTheme: IconThemes.darkStyle,
  );
}
