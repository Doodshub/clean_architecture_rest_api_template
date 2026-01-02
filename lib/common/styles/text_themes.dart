import 'package:flutter/material.dart';
import 'package:clean_architecture_template/common/styles/app_colors.dart';

class TextThemes {
  const TextThemes._();

  static const fontFamily = 'AdelleSans';

  static TextTheme defaultStyle = const TextTheme(
    // headline1
    displayLarge: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w900,
      fontSize: 57,
      letterSpacing: -0.25,
      color: CustomAppColors.primaryText,
    ),
    // headline2
    displayMedium: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w700,
      fontSize: 34,
      letterSpacing: .5,
      color: CustomAppColors.primaryText,
    ),
    // headline3
    displaySmall: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w700,
      fontSize: 28,
      letterSpacing: .5,
      color: CustomAppColors.primaryText,
    ),
    // headline4
    headlineMedium: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w700,
      fontSize: 24,
      letterSpacing: 0.5,
      color: CustomAppColors.primaryText,
    ),
    // headline5
    headlineSmall: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w700,
      fontSize: 20,
      letterSpacing: 0.25,
      color: CustomAppColors.primaryText,
    ),
    // headline6
    titleLarge: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w600,
      fontSize: 20,
      letterSpacing: 0.25,
      color: CustomAppColors.primaryText,
    ),
    // bodyText1
    bodyLarge: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w400,
      fontSize: 18,
      letterSpacing: 0.5,
      color: CustomAppColors.primaryText,
    ),
    // bodyText2
    bodyMedium: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w400,
      fontSize: 16,
      letterSpacing: 0.25,
      color: CustomAppColors.primaryText,
    ),
    labelLarge: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w600,
      fontSize: 18,
      letterSpacing: .25,
      color: CustomAppColors.primaryText,
    ),
    labelMedium: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
      fontSize: 16,
      letterSpacing: .25,
      color: CustomAppColors.primaryText,
    ),
    labelSmall: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w400,
      fontSize: 14,
      letterSpacing: .25,
      color: CustomAppColors.primaryText,
    ),
  );

  static TextTheme darkStyle = TextTheme(
    // headline1
    displayLarge: defaultStyle.displayLarge!.copyWith(
      color: CustomAppColors.white,
    ),
    // headline2
    displayMedium: defaultStyle.displayMedium!.copyWith(
      color: CustomAppColors.white,
    ),
    // headline3
    displaySmall: defaultStyle.displaySmall!.copyWith(
      color: CustomAppColors.white,
    ),
    // headline4
    headlineMedium: defaultStyle.headlineMedium!.copyWith(
      color: CustomAppColors.white,
    ),
    // headline5
    headlineSmall: defaultStyle.headlineSmall!.copyWith(
      color: CustomAppColors.white,
    ),
    // headline6
    titleLarge: defaultStyle.titleLarge!.copyWith(color: CustomAppColors.white),
    // bodyText1
    bodyLarge: defaultStyle.bodyLarge!.copyWith(color: CustomAppColors.white),
    // bodyText2
    bodyMedium: defaultStyle.bodyMedium!.copyWith(color: CustomAppColors.white),
    labelLarge: defaultStyle.labelLarge!.copyWith(color: CustomAppColors.white),
    labelMedium: defaultStyle.labelMedium!.copyWith(
      color: CustomAppColors.white,
    ),
    labelSmall: defaultStyle.labelSmall!.copyWith(color: CustomAppColors.white),
  );
}
