import 'package:flutter/material.dart';

class ListTileThemes {
  const ListTileThemes._();

  static const defaultStyle = ListTileThemeData(
    tileColor: Color(0xFFFFFBF8),
    contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 4),
  );

  static final roundedStyle = ListTileThemeData(
    tileColor: const Color(0xFFFFFBF8),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
  );
}
