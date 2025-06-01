import 'package:flutter/material.dart';
import 'package:clean_architecture_rest_api_template/common/styles/app_colors.dart';

class ListTileThemes {
  const ListTileThemes._();

  static const defaultStyle = ListTileThemeData(
    tileColor: CustomAppColors.white,
    contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 4),
  );

  static final roundedStyle = ListTileThemeData(
    tileColor: CustomAppColors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
    contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
  );
}
