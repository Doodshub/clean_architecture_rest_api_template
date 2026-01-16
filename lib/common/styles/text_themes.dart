import 'package:flutter/material.dart';
import 'package:clean_architecture_template/common/styles/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class TextThemes {
  const TextThemes._();

  static final defaultStyle = TextTheme(
    // headline1
    displayLarge: GoogleFonts.playfairDisplay(
      fontWeight: FontWeight.w700,
      fontSize: 57,
      letterSpacing: -0.25,
      color: CustomAppColors.primaryText,
    ),
    // headline2
    displayMedium: GoogleFonts.playfairDisplay(
      fontWeight: FontWeight.w600,
      fontSize: 34,
      letterSpacing: 0,
      color: CustomAppColors.primaryText,
    ),
    // headline3
    displaySmall: GoogleFonts.playfairDisplay(
      fontWeight: FontWeight.w600,
      fontSize: 28,
      letterSpacing: 0,
      color: CustomAppColors.primaryText,
    ),
    // headline4
    headlineMedium: GoogleFonts.playfairDisplay(
      fontWeight: FontWeight.w600,
      fontSize: 24,
      letterSpacing: 0,
      color: CustomAppColors.primaryText,
    ),
    // headline5
    headlineSmall: GoogleFonts.playfairDisplay(
      fontWeight: FontWeight.w600,
      fontSize: 20,
      letterSpacing: 0,
      color: CustomAppColors.primaryText,
    ),
    // headline6
    titleLarge: GoogleFonts.lora(
      fontWeight: FontWeight.w600,
      fontSize: 20,
      letterSpacing: 0.15,
      color: CustomAppColors.primaryText,
    ),
    // bodyText1
    bodyLarge: GoogleFonts.lora(
      fontWeight: FontWeight.w400,
      fontSize: 18,
      letterSpacing: 0.5,
      color: CustomAppColors.primaryText,
    ),
    // bodyText2
    bodyMedium: GoogleFonts.lora(
      fontWeight: FontWeight.w400,
      fontSize: 16,
      letterSpacing: 0.25,
      color: CustomAppColors.primaryText,
    ),
    labelLarge: GoogleFonts.lora(
      fontWeight: FontWeight.w600,
      fontSize: 18,
      letterSpacing: 0.1,
      color: CustomAppColors.primaryText,
    ),
    labelMedium: GoogleFonts.lora(
      fontWeight: FontWeight.w500,
      fontSize: 16,
      letterSpacing: 0.1,
      color: CustomAppColors.primaryText,
    ),
    labelSmall: GoogleFonts.lora(
      fontWeight: FontWeight.w400,
      fontSize: 14,
      letterSpacing: 0.1,
      color: CustomAppColors.primaryText,
    ),
  );

  static TextTheme darkStyle = TextTheme(
    // headline1
    displayLarge: defaultStyle.displayLarge!.copyWith(
      color: const Color(0xFFF5EDE8),
    ),
    // headline2
    displayMedium: defaultStyle.displayMedium!.copyWith(
      color: const Color(0xFFF5EDE8),
    ),
    // headline3
    displaySmall: defaultStyle.displaySmall!.copyWith(
      color: const Color(0xFFF5EDE8),
    ),
    // headline4
    headlineMedium: defaultStyle.headlineMedium!.copyWith(
      color: const Color(0xFFF5EDE8),
    ),
    // headline5
    headlineSmall: defaultStyle.headlineSmall!.copyWith(
      color: const Color(0xFFF5EDE8),
    ),
    // headline6
    titleLarge: defaultStyle.titleLarge!.copyWith(
      color: const Color(0xFFF5EDE8),
    ),
    // bodyText1
    bodyLarge: defaultStyle.bodyLarge!.copyWith(color: const Color(0xFFF5EDE8)),
    // bodyText2
    bodyMedium: defaultStyle.bodyMedium!.copyWith(
      color: const Color(0xFFF5EDE8),
    ),
    labelLarge: defaultStyle.labelLarge!.copyWith(
      color: const Color(0xFFF5EDE8),
    ),
    labelMedium: defaultStyle.labelMedium!.copyWith(
      color: const Color(0xFFF5EDE8),
    ),
    labelSmall: defaultStyle.labelSmall!.copyWith(
      color: const Color(0xFFF5EDE8),
    ),
  );
}
