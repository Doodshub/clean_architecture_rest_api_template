import 'package:flutter/material.dart';

import 'package:clean_architecture_template/common/scaling/scale_calculator.dart';
import 'package:clean_architecture_template/common/scaling/scaled_theme_builder.dart';
import 'package:clean_architecture_template/common/styles/app_themes.dart';

/// Builds [MaterialApp] (or similar) with a theme scaled by screen size.
/// Rebuilds when the window is resized or rotated.
///
/// Usage:
/// ```dart
/// ScaledThemeProvider(
///   builder: (theme) => MaterialApp(
///     theme: theme,
///     home: HomePage(),
///   ),
/// )
/// ```
class ScaledThemeProvider extends StatelessWidget {
  const ScaledThemeProvider({
    super.key,
    this.builder,
    this.themeSetBuilder,
    this.dark = false,
  }) : assert(
         builder != null || themeSetBuilder != null,
         'Provide either builder or themeSetBuilder.',
       );

  final Widget Function(ThemeData theme)? builder;
  final Widget Function(ScaledThemeSet themes)? themeSetBuilder;
  final bool dark;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final size = MediaQuery.sizeOf(context);
        final scale = ScaleCalculator.scaleFactor(size);
        final themeSetBuilder = this.themeSetBuilder;
        if (themeSetBuilder != null) {
          return themeSetBuilder(AppThemes.buildScaledSet(scale));
        }
        final theme = AppThemes.buildScaled(scale, dark: dark);
        return builder!(theme);
      },
    );
  }
}
