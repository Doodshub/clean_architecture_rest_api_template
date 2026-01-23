import 'package:flutter/material.dart';
import 'package:clean_architecture_template/common/styles/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class TextThemes {
  const TextThemes._();

  static final defaultStyle = TextTheme(
    // headline1
    displayLarge: GoogleFonts.poppins(
      fontWeight: FontWeight.w700,
      fontSize: 57,
      letterSpacing: -0.25,
      color: CustomAppColors.primaryText,
    ),
    // headline2
    displayMedium: GoogleFonts.poppins(
      fontWeight: FontWeight.w600,
      fontSize: 34,
      letterSpacing: 0,
      color: CustomAppColors.primaryText,
    ),
    // headline3
    displaySmall: GoogleFonts.poppins(
      fontWeight: FontWeight.w600,
      fontSize: 28,
      letterSpacing: 0,
      color: CustomAppColors.primaryText,
    ),
    // headline4
    headlineMedium: GoogleFonts.poppins(
      fontWeight: FontWeight.w600,
      fontSize: 24,
      letterSpacing: 0,
      color: CustomAppColors.primaryText,
    ),
    // headline5
    headlineSmall: GoogleFonts.poppins(
      fontWeight: FontWeight.w600,
      fontSize: 20,
      letterSpacing: 0,
      color: CustomAppColors.primaryText,
    ),
    // headline6
    titleLarge: GoogleFonts.inter(
      fontWeight: FontWeight.w600,
      fontSize: 20,
      letterSpacing: 0.15,
      color: CustomAppColors.primaryText,
    ),
    // bodyText1
    bodyLarge: GoogleFonts.inter(
      fontWeight: FontWeight.w400,
      fontSize: 18,
      letterSpacing: 0.5,
      color: CustomAppColors.primaryText,
    ),
    // bodyText2
    bodyMedium: GoogleFonts.inter(
      fontWeight: FontWeight.w400,
      fontSize: 16,
      letterSpacing: 0.25,
      color: CustomAppColors.primaryText,
    ),
    labelLarge: GoogleFonts.inter(
      fontWeight: FontWeight.w600,
      fontSize: 18,
      letterSpacing: 0.1,
      color: CustomAppColors.primaryText,
    ),
    labelMedium: GoogleFonts.inter(
      fontWeight: FontWeight.w500,
      fontSize: 16,
      letterSpacing: 0.1,
      color: CustomAppColors.primaryText,
    ),
    labelSmall: GoogleFonts.inter(
      fontWeight: FontWeight.w400,
      fontSize: 14,
      letterSpacing: 0.1,
      color: CustomAppColors.primaryText,
    ),
  );

  static TextTheme darkStyle = TextTheme(
    // headline1
    displayLarge: defaultStyle.displayLarge!.copyWith(
      color: CustomAppColors.gray6,
    ),
    // headline2
    displayMedium: defaultStyle.displayMedium!.copyWith(
      color: CustomAppColors.gray6,
    ),
    // headline3
    displaySmall: defaultStyle.displaySmall!.copyWith(
      color: CustomAppColors.gray6,
    ),
    // headline4
    headlineMedium: defaultStyle.headlineMedium!.copyWith(
      color: CustomAppColors.gray6,
    ),
    // headline5
    headlineSmall: defaultStyle.headlineSmall!.copyWith(
      color: CustomAppColors.gray6,
    ),
    // headline6
    titleLarge: defaultStyle.titleLarge!.copyWith(color: CustomAppColors.gray6),
    // bodyText1
    bodyLarge: defaultStyle.bodyLarge!.copyWith(color: CustomAppColors.gray6),
    // bodyText2
    bodyMedium: defaultStyle.bodyMedium!.copyWith(color: CustomAppColors.gray6),
    labelLarge: defaultStyle.labelLarge!.copyWith(color: CustomAppColors.gray6),
    labelMedium: defaultStyle.labelMedium!.copyWith(
      color: CustomAppColors.gray6,
    ),
    labelSmall: defaultStyle.labelSmall!.copyWith(color: CustomAppColors.gray6),
  );
}
