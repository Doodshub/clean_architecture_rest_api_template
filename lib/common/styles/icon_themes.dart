import 'package:flutter/material.dart';
import 'package:clean_architecture_template/common/styles/app_colors.dart';

/// Icon themes for consistent icon styling throughout the app
/// Based on Trackify app design patterns
class IconThemes {
  const IconThemes._();

  // Icon sizes
  static const double iconSizeSmall = 16.0;
  static const double iconSizeMedium = 20.0;
  static const double iconSizeLarge = 24.0;
  static const double iconSizeXLarge = 32.0;
  static const double iconSizeXXLarge = 48.0;

  /// Default icon theme - medium gray icons
  static const defaultStyle = IconThemeData(
    color: CustomAppColors.gray2,
    size: iconSizeLarge,
  );

  /// Dark theme icon style
  static const darkStyle = IconThemeData(
    color: CustomAppColors.gray5,
    size: iconSizeLarge,
  );

  /// Primary colored icons (for active states)
  static const primary = IconThemeData(
    color: CustomAppColors.primary,
    size: iconSizeLarge,
  );

  /// Secondary colored icons
  static const secondary = IconThemeData(
    color: CustomAppColors.secondary,
    size: iconSizeLarge,
  );

  /// Light icons (for dark backgrounds)
  static const light = IconThemeData(
    color: CustomAppColors.white,
    size: iconSizeLarge,
  );

  /// Muted/disabled icons
  static const muted = IconThemeData(
    color: CustomAppColors.gray3,
    size: iconSizeLarge,
    opacity: 0.5,
  );

  /// Error state icons
  static const error = IconThemeData(
    color: CustomAppColors.error,
    size: iconSizeLarge,
  );

  /// Success state icons
  static const success = IconThemeData(
    color: CustomAppColors.success,
    size: iconSizeLarge,
  );

  /// Warning state icons
  static const warning = IconThemeData(
    color: CustomAppColors.warning,
    size: iconSizeLarge,
  );

  // Size variants

  /// Small icons (16px) - for inline text, dense lists
  static const small = IconThemeData(
    color: CustomAppColors.gray2,
    size: iconSizeSmall,
  );

  /// Medium icons (20px) - for compact UIs
  static const medium = IconThemeData(
    color: CustomAppColors.gray2,
    size: iconSizeMedium,
  );

  /// Large icons (24px) - default size, most common
  static const large = IconThemeData(
    color: CustomAppColors.gray2,
    size: iconSizeLarge,
  );

  /// Extra large icons (32px) - for prominent actions
  static const xLarge = IconThemeData(
    color: CustomAppColors.gray2,
    size: iconSizeXLarge,
  );

  /// Extra extra large icons (48px) - for hero sections, avatars
  static const xxLarge = IconThemeData(
    color: CustomAppColors.gray2,
    size: iconSizeXXLarge,
  );

  // Context-specific icon themes

  /// Icons for input fields (prefix/suffix)
  static const input = IconThemeData(
    color: CustomAppColors.gray2,
    size: iconSizeMedium,
  );

  /// Icons for app bar
  static const appBar = IconThemeData(
    color: CustomAppColors.gray1,
    size: iconSizeLarge,
  );

  /// Icons for app bar (dark)
  static const appBarDark = IconThemeData(
    color: CustomAppColors.white,
    size: iconSizeLarge,
  );

  /// Icons for buttons
  static const button = IconThemeData(
    color: CustomAppColors.white,
    size: iconSizeMedium,
  );

  /// Icons for list items
  static const listItem = IconThemeData(
    color: CustomAppColors.gray2,
    size: iconSizeLarge,
  );

  /// Icons for navigation
  static const navigation = IconThemeData(
    color: CustomAppColors.gray2,
    size: iconSizeLarge,
  );

  /// Icons for navigation (active/selected state)
  static const navigationActive = IconThemeData(
    color: CustomAppColors.primary,
    size: iconSizeLarge,
  );

  /// Icons for FAB (Floating Action Button)
  static const fab = IconThemeData(
    color: CustomAppColors.white,
    size: iconSizeLarge,
  );

  /// Helper method to create custom icon theme
  static IconThemeData custom({Color? color, double? size, double? opacity}) {
    return IconThemeData(
      color: color ?? CustomAppColors.gray2,
      size: size ?? iconSizeLarge,
      opacity: opacity,
    );
  }
}
