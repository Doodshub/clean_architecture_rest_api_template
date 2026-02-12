import 'package:flutter/material.dart';
import 'package:clean_architecture_template/common/styles/app_colors.dart';
import 'package:clean_architecture_template/common/styles/text_themes.dart';

/// Input decoration themes for form fields
/// Based on Trackify app design with elevated white cards and icon integration
class InputDecorationThemes {
  const InputDecorationThemes._();

  // Constants for consistent styling
  static const double _borderRadius = 12.0;
  static const double _borderWidth = 1.0;
  static const double _focusedBorderWidth = 1.5;

  /// Default input decoration theme
  /// Features:
  /// - White background with subtle shadow
  /// - Rounded corners (12px)
  /// - Icon support with proper padding
  /// - Uppercase labels
  /// - Clear focus states
  static final defaultStyle = InputDecorationTheme(
    // Fill properties
    fillColor: CustomAppColors.white,
    filled: true,

    // Padding - accounts for prefix and suffix icons
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),

    // Icon theme for prefix and suffix icons
    iconColor: CustomAppColors.gray2,
    prefixIconColor: CustomAppColors.gray2,
    suffixIconColor: CustomAppColors.gray2,

    // Label style - uppercase, semibold, gray
    labelStyle: TextThemes.inputLabel.copyWith(color: CustomAppColors.gray2),
    floatingLabelStyle: TextThemes.inputLabel.copyWith(
      color: CustomAppColors.gray2,
    ),

    // Hint text style - regular, lighter gray
    hintStyle: TextThemes.placeholder,

    // Helper and error text styles
    helperStyle: const TextStyle(
      fontFamily: 'Figtree',
      fontSize: 12,
      color: CustomAppColors.gray3,
    ),
    errorStyle: const TextStyle(
      fontFamily: 'Figtree',
      fontSize: 12,
      color: CustomAppColors.error,
    ),

    // Border configuration
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(_borderRadius),
      borderSide: BorderSide.none, // No border, using shadow instead
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(_borderRadius),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(_borderRadius),
      borderSide: const BorderSide(
        color: CustomAppColors.primary,
        width: _focusedBorderWidth,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(_borderRadius),
      borderSide: const BorderSide(
        color: CustomAppColors.error,
        width: _borderWidth,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(_borderRadius),
      borderSide: const BorderSide(
        color: CustomAppColors.error,
        width: _focusedBorderWidth,
      ),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(_borderRadius),
      borderSide: BorderSide.none,
    ),

    // Constraints
    constraints: const BoxConstraints(minHeight: 56),
  );

  /// Dark theme input decoration
  static final darkStyle = InputDecorationTheme(
    fillColor: CustomAppColors.darkCards,
    filled: true,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
    iconColor: CustomAppColors.gray4,
    prefixIconColor: CustomAppColors.gray4,
    suffixIconColor: CustomAppColors.gray4,
    labelStyle: TextThemes.inputLabel.copyWith(color: CustomAppColors.gray4),
    floatingLabelStyle: TextThemes.inputLabel.copyWith(
      color: CustomAppColors.gray4,
    ),
    hintStyle: TextThemes.placeholder.copyWith(color: CustomAppColors.gray4),
    helperStyle: const TextStyle(
      fontFamily: 'Figtree',
      fontSize: 12,
      color: CustomAppColors.gray4,
    ),
    errorStyle: const TextStyle(
      fontFamily: 'Figtree',
      fontSize: 12,
      color: CustomAppColors.errorDark,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(_borderRadius),
      borderSide: const BorderSide(
        color: CustomAppColors.gray3,
        width: _borderWidth,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(_borderRadius),
      borderSide: const BorderSide(
        color: CustomAppColors.gray3,
        width: _borderWidth,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(_borderRadius),
      borderSide: const BorderSide(
        color: CustomAppColors.primary,
        width: _focusedBorderWidth,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(_borderRadius),
      borderSide: const BorderSide(
        color: CustomAppColors.errorDark,
        width: _borderWidth,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(_borderRadius),
      borderSide: const BorderSide(
        color: CustomAppColors.errorDark,
        width: _focusedBorderWidth,
      ),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(_borderRadius),
      borderSide: const BorderSide(
        color: CustomAppColors.gray4,
        width: _borderWidth,
      ),
    ),
    constraints: const BoxConstraints(minHeight: 56),
  );

  /// Custom decoration for search fields
  static InputDecoration searchDecoration({
    String? hintText,
    Widget? prefixIcon,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      hintText: hintText ?? 'Search...',
      prefixIcon: prefixIcon ?? const Icon(Icons.search),
      suffixIcon: suffixIcon,
      filled: true,
      fillColor: CustomAppColors.gray6,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(_borderRadius),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(_borderRadius),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(_borderRadius),
        borderSide: const BorderSide(
          color: CustomAppColors.primary,
          width: _focusedBorderWidth,
        ),
      ),
    );
  }

  /// Custom decoration for email fields
  static InputDecoration emailDecoration({
    String? labelText,
    String? hintText,
    bool showIcon = true,
  }) {
    return InputDecoration(
      labelText: labelText ?? 'EMAIL',
      hintText: hintText ?? 'email@companyname.com',
      prefixIcon: showIcon ? const Icon(Icons.email_outlined) : null,
    );
  }

  /// Custom decoration for password fields
  static InputDecoration passwordDecoration({
    String? labelText,
    String? hintText,
    bool obscureText = true,
    VoidCallback? onToggleVisibility,
    bool showIcon = true,
  }) {
    return InputDecoration(
      labelText: labelText ?? 'PASSWORD',
      hintText: hintText ?? '••••••••',
      prefixIcon: showIcon ? const Icon(Icons.lock_outlined) : null,
      suffixIcon:
          onToggleVisibility != null
              ? IconButton(
                icon: Icon(
                  obscureText
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                ),
                onPressed: onToggleVisibility,
              )
              : null,
    );
  }
}
