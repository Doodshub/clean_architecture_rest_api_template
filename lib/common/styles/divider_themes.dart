import 'package:flutter/material.dart';
import 'package:clean_architecture_template/common/styles/app_colors.dart';

class DividerThemes {
  const DividerThemes._();

  static const defaultStyle = DividerThemeData(
    color: CustomAppColors.gray4,
    thickness: 1.0,
    space: 24.0,
  );

  static const darkStyle = DividerThemeData(
    color: Color(0xFF6B5E5E),
    thickness: 1.0,
    space: 16.0,
  );
}
