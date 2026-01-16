import 'package:flutter/material.dart';
import 'package:clean_architecture_template/common/styles/app_colors.dart';

class ColorSchemes {
  const ColorSchemes._();

  static ColorScheme defaultStyle = ColorScheme.fromSwatch().copyWith(
    primary: CustomAppColors.primary,
    secondary: CustomAppColors.secondary,
    tertiary: const Color(0xFF88A0A8),
    error: CustomAppColors.error,
    onPrimary: CustomAppColors.white,
    onSecondary: CustomAppColors.primaryText,
    onTertiary: CustomAppColors.white,
    onError: CustomAppColors.white,
    onSurfaceVariant: const Color(0xFF5A6665),
    primaryContainer: const Color(0xFFE1EFEE),
    secondaryContainer: const Color(0xFFEDF7F6),
    tertiaryContainer: const Color(0xFFD5E3E6),
    errorContainer: const Color(0xFFFCEBEB),
    surface: CustomAppColors.primaryBackground,
    outline: CustomAppColors.secondary,
    onPrimaryContainer: const Color(0xFF2C3A39),
    onSecondaryContainer: const Color(0xFF1F2D2C),
    onTertiaryContainer: const Color(0xFF1F3236),
    onErrorContainer: const Color(0xFF5A2424),
    onSurface: CustomAppColors.primaryText,
  );

  static ColorScheme darkStyle = ColorScheme.fromSwatch().copyWith(
    primary: const Color(0xFF8BB5B1),
    secondary: const Color(0xFF72A09C),
    tertiary: const Color(0xFF9CB8BA),
    error: const Color(0xFFE89C9C),
    onPrimary: const Color(0xFF1F2D2C),
    onSecondary: const Color(0xFF1F2D2C),
    onTertiary: const Color(0xFF1F2D2C),
    onError: const Color(0xFF1F2D2C),
    onSurfaceVariant: const Color(0xFFB4C5C4),
    primaryContainer: const Color(0xFF4A7471),
    secondaryContainer: const Color(0xFF5A8481),
    tertiaryContainer: const Color(0xFF6A8E90),
    errorContainer: const Color(0xFF8A4848),
    surface: CustomAppColors.darkCards,
    outline: const Color(0xFF778988),
    onPrimaryContainer: const Color(0xFFEDF4F3),
    onSecondaryContainer: const Color(0xFFEDF4F3),
    onTertiaryContainer: const Color(0xFFEDF4F3),
    onErrorContainer: const Color(0xFFF5EDE8),
    onSurface: const Color(0xFFEDF4F3),
  );
}
