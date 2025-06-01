import 'package:flutter/material.dart';

extension BuildContextTextThemeExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;

  String capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }
}
