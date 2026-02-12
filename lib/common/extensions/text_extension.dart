import 'package:flutter/material.dart';
import 'package:clean_architecture_template/common/styles/text_themes.dart';

extension BuildContextTextThemeExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;

  String capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }
}

/// Extension for easy access to custom text styles
extension TextStyleExtension on BuildContext {
  /// Link text styles
  TextStyle get linkStyle => TextThemes.link;
  TextStyle get linkBoldStyle => TextThemes.linkBold;

  /// Input styles
  TextStyle get placeholderStyle => TextThemes.placeholder;
  TextStyle get inputLabelStyle => TextThemes.inputLabel;

  /// Button styles
  TextStyle get buttonPrimaryStyle => TextThemes.buttonPrimary;
  TextStyle get buttonSecondaryStyle => TextThemes.buttonSecondary;

  /// Footer and small text
  TextStyle get footerStyle => TextThemes.footer;
  TextStyle get overlineStyle => TextThemes.overline;
}
