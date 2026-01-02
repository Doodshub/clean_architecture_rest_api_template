import 'package:flutter/material.dart';
import 'package:clean_architecture_template/common/styles/app_colors.dart';
import 'package:clean_architecture_template/common/styles/icon_themes.dart';

class AppBarThemes {
  const AppBarThemes._();

  static const defaultStyle = AppBarTheme(
    elevation: 0,
    iconTheme: IconThemes.defaultStyle,
    backgroundColor: Colors.transparent,
    centerTitle: false,
    titleTextStyle: TextStyle(
      color: CustomAppColors.primaryText,
      fontSize: 28,
      fontWeight: FontWeight.w600,
    ),
  );

  static const darkStyle = AppBarTheme(
    backgroundColor: CustomAppColors.darkScaffold,
    elevation: 0,
    iconTheme: IconThemes.darkStyle,
  );
}
