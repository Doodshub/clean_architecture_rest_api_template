import 'package:flutter/material.dart';
import 'package:clean_architecture_template/common/styles/app_colors.dart';

/// Text themes using Figtree font family
/// Organized by usage patterns from the Trackify app design
class TextThemes {
  const TextThemes._();

  // Base font family
  static const String _fontFamily = 'Figtree';

  static final defaultStyle = TextTheme(
    // Display styles - Hero headlines
    // Usage: Main landing page headline "Easier, Safer, faster. That's Trackify."
    displayLarge: const TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w700, // Bold
      fontSize: 36,
      height: 1.2,
      letterSpacing: -0.5,
      color: CustomAppColors.gray1,
    ),

    // Usage: Large hero text variations
    displayMedium: const TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w700, // Bold
      fontSize: 32,
      height: 1.25,
      letterSpacing: -0.25,
      color: CustomAppColors.gray1,
    ),

    // Usage: Section headlines, page titles
    displaySmall: const TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w700, // Bold
      fontSize: 28,
      height: 1.3,
      letterSpacing: 0,
      color: CustomAppColors.gray1,
    ),

    // Headline styles - Page and section titles
    // Usage: Page title "Choose Your Business"
    headlineLarge: const TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w700, // Bold
      fontSize: 24,
      height: 1.3,
      letterSpacing: 0,
      color: CustomAppColors.gray1,
    ),

    // Usage: Section headers, dialog titles
    headlineMedium: const TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w600, // SemiBold
      fontSize: 20,
      height: 1.4,
      letterSpacing: 0,
      color: CustomAppColors.gray1,
    ),

    // Usage: Card titles, subsection headers
    headlineSmall: const TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w600, // SemiBold
      fontSize: 18,
      height: 1.4,
      letterSpacing: 0,
      color: CustomAppColors.gray1,
    ),

    // Title styles - Component titles
    // Usage: List item titles "Outback Freight Solutions"
    titleLarge: const TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w600, // SemiBold
      fontSize: 16,
      height: 1.5,
      letterSpacing: 0.15,
      color: CustomAppColors.gray1,
    ),

    // Usage: Card headers, drawer items
    titleMedium: const TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w600, // SemiBold
      fontSize: 15,
      height: 1.5,
      letterSpacing: 0.15,
      color: CustomAppColors.gray1,
    ),

    // Usage: Small component titles
    titleSmall: const TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w600, // SemiBold
      fontSize: 14,
      height: 1.5,
      letterSpacing: 0.1,
      color: CustomAppColors.gray1,
    ),

    // Body styles - Primary content text
    // Usage: Input field text, main content
    bodyLarge: const TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w400, // Regular
      fontSize: 16,
      height: 1.5,
      letterSpacing: 0.25,
      color: CustomAppColors.gray1,
    ),

    // Usage: Descriptions "You're associated with multiple businesses..."
    bodyMedium: const TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w400, // Regular
      fontSize: 14,
      height: 1.6,
      letterSpacing: 0.25,
      color: CustomAppColors.gray2,
    ),

    // Usage: Captions, hints, helper text "The Fleet Management System..."
    bodySmall: const TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w400, // Regular
      fontSize: 13,
      height: 1.6,
      letterSpacing: 0.25,
      color: CustomAppColors.gray2,
    ),

    // Label styles - UI component labels and buttons
    // Usage: Button text "Log In", "Continue to Dashboard"
    labelLarge: const TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w600, // SemiBold
      fontSize: 16,
      height: 1.4,
      letterSpacing: 0.1,
      color: CustomAppColors.white,
    ),

    // Usage: Input labels "EMAIL", "PASSWORD", secondary buttons
    labelMedium: const TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w600, // SemiBold
      fontSize: 14,
      height: 1.4,
      letterSpacing: 0.5,
      color: CustomAppColors.gray1,
    ),

    // Usage: Small labels, tags, list subtitles "OBFS-2319"
    labelSmall: const TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w400, // Regular
      fontSize: 12,
      height: 1.5,
      letterSpacing: 0.5,
      color: CustomAppColors.gray3,
    ),
  );

  static TextTheme darkStyle = TextTheme(
    displayLarge: defaultStyle.displayLarge!.copyWith(
      color: CustomAppColors.white,
    ),
    displayMedium: defaultStyle.displayMedium!.copyWith(
      color: CustomAppColors.white,
    ),
    displaySmall: defaultStyle.displaySmall!.copyWith(
      color: CustomAppColors.white,
    ),
    headlineLarge: defaultStyle.headlineLarge!.copyWith(
      color: CustomAppColors.white,
    ),
    headlineMedium: defaultStyle.headlineMedium!.copyWith(
      color: CustomAppColors.white,
    ),
    headlineSmall: defaultStyle.headlineSmall!.copyWith(
      color: CustomAppColors.white,
    ),
    titleLarge: defaultStyle.titleLarge!.copyWith(color: CustomAppColors.white),
    titleMedium: defaultStyle.titleMedium!.copyWith(
      color: CustomAppColors.white,
    ),
    titleSmall: defaultStyle.titleSmall!.copyWith(color: CustomAppColors.white),
    bodyLarge: defaultStyle.bodyLarge!.copyWith(color: CustomAppColors.gray6),
    bodyMedium: defaultStyle.bodyMedium!.copyWith(color: CustomAppColors.gray5),
    bodySmall: defaultStyle.bodySmall!.copyWith(color: CustomAppColors.gray5),
    labelLarge: defaultStyle.labelLarge!.copyWith(color: CustomAppColors.white),
    labelMedium: defaultStyle.labelMedium!.copyWith(
      color: CustomAppColors.white,
    ),
    labelSmall: defaultStyle.labelSmall!.copyWith(color: CustomAppColors.gray4),
  );

  // Custom text styles for specific use cases

  /// Link text style - "Forgot Password?", "Contact Support"
  static const TextStyle link = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    height: 1.5,
    letterSpacing: 0.1,
    color: CustomAppColors.primary,
    decoration: TextDecoration.none,
  );

  /// Link text style (bold variant)
  static const TextStyle linkBold = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 14,
    height: 1.5,
    letterSpacing: 0.1,
    color: CustomAppColors.primary,
    decoration: TextDecoration.none,
  );

  /// Input field placeholder text
  static const TextStyle placeholder = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    height: 1.5,
    letterSpacing: 0.25,
    color: CustomAppColors.gray3,
  );

  /// Footer text - "© Trackify • Android V3.2.2"
  static const TextStyle footer = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    height: 1.5,
    letterSpacing: 0.25,
    color: CustomAppColors.gray3,
  );

  /// Button text - Primary
  static const TextStyle buttonPrimary = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 16,
    height: 1.25,
    letterSpacing: 0.1,
    color: CustomAppColors.white,
  );

  /// Button text - Secondary
  static const TextStyle buttonSecondary = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 16,
    height: 1.25,
    letterSpacing: 0.1,
    color: CustomAppColors.gray1,
  );

  /// Input label - Uppercase style
  static const TextStyle inputLabel = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 12,
    height: 1.5,
    letterSpacing: 1.0,
    color: CustomAppColors.gray1,
  );

  /// Overline text - Used for categories, tags
  static const TextStyle overline = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 11,
    height: 1.5,
    letterSpacing: 1.5,
    color: CustomAppColors.gray3,
  );
}
