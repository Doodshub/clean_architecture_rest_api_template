import 'package:clean_architecture_template/common/extensions/responsive_extension.dart';
import 'package:flutter/material.dart';

// Example to use
// Padding(
//    padding: AppSpacing.all(AppSpacing.space16),
//    child: Text('Hello'),
// );
//
// SizedBox(height: AppSpacing.space24);
//
// Responsive spacing (scales on tablet):
// padding: AppSpacing.allResponsive(context, AppSpacing.space16);

/// Defines consistent spacing values used throughout the app.
/// Based on an 8px baseline grid system with intermediate steps.
class AppSpacing {
  AppSpacing._();

  static const double space0 = 0;
  static const double space1 = 1;
  static const double space2 = 2;
  static const double space4 = 4;
  static const double space8 = 8;
  static const double space12 = 12;
  static const double space16 = 16;
  static const double space20 = 20;
  static const double space24 = 24;
  static const double space28 = 28;
  static const double space32 = 32;
  static const double space36 = 36;
  static const double space40 = 40;
  static const double space44 = 44;
  static const double space48 = 48;
  static const double space52 = 52;
  static const double space64 = 64;
  static const double space72 = 72;
  static const double space80 = 80;
  static const double space96 = 96;
  static const double space128 = 128;
  static const double space256 = 256;

  /// Returns EdgeInsets with uniform padding
  static EdgeInsets all(double value) => EdgeInsets.all(value);

  /// Returns symmetric horizontal padding
  static EdgeInsets horizontal(double value) =>
      EdgeInsets.symmetric(horizontal: value);

  /// Returns symmetric vertical padding
  static EdgeInsets vertical(double value) =>
      EdgeInsets.symmetric(vertical: value);

  /// Returns individual padding
  static EdgeInsets only({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) =>
      EdgeInsets.only(
        left: left,
        top: top,
        right: right,
        bottom: bottom,
      );

  /// Scale factor for tablet (1.25) and desktop (1.25). Mobile stays 1.0.
  static double _scaleFactor(BuildContext context) {
    return context.isTablet || context.isDesktop ? 1.25 : 1.0;
  }

  /// Returns [value] scaled for tablet/desktop. Use for responsive spacing.
  static double scale(BuildContext context, double value) {
    return value * _scaleFactor(context);
  }

  /// Returns EdgeInsets.all with responsive scaling on tablet.
  static EdgeInsets allResponsive(BuildContext context, double value) {
    return EdgeInsets.all(scale(context, value));
  }

  /// Returns symmetric horizontal padding with responsive scaling.
  static EdgeInsets horizontalResponsive(BuildContext context, double value) {
    return EdgeInsets.symmetric(horizontal: scale(context, value));
  }

  /// Returns symmetric vertical padding with responsive scaling.
  static EdgeInsets verticalResponsive(BuildContext context, double value) {
    return EdgeInsets.symmetric(vertical: scale(context, value));
  }
}
