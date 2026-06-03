import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:clean_architecture_template/common/styles/app_bar_themes.dart';
import 'package:clean_architecture_template/common/styles/app_colors.dart';
import 'package:clean_architecture_template/common/styles/bottom_app_bar_themes.dart';
import 'package:clean_architecture_template/common/styles/bottom_navigation_bar_themes.dart';
import 'package:clean_architecture_template/common/styles/app_text_styles.dart';
import 'package:clean_architecture_template/common/styles/color_schemes.dart';
import 'package:clean_architecture_template/common/styles/divider_themes.dart';
import 'package:clean_architecture_template/common/styles/dropdown_theme.dart';
import 'package:clean_architecture_template/common/styles/elevated_button_themes.dart';
import 'package:clean_architecture_template/common/styles/floating_action_button_themes.dart';
import 'package:clean_architecture_template/common/styles/icon_themes.dart';
import 'package:clean_architecture_template/common/styles/input_decoration_themes.dart';
import 'package:clean_architecture_template/common/styles/list_tile_themes.dart';
import 'package:clean_architecture_template/common/styles/text_themes.dart';

/// Builds a complete ThemeData with all dimensions scaled by [scale].
/// Use with ScaledThemeProvider for proportional UI across devices.
class ScaledThemeBuilder {
  ScaledThemeBuilder._();

  /// Builds light and dark themes with all dimensions scaled by [scale].
  static ScaledThemeSet buildScaledSet(double scale) {
    return ScaledThemeSet(light: _buildLight(scale), dark: _buildDark(scale));
  }

  /// Builds light theme with all dimensions scaled by [scale].
  static ThemeData buildScaled(double scale, {bool dark = false}) {
    if (dark) {
      return _buildDark(scale);
    }
    return _buildLight(scale);
  }

  static ThemeData _buildLight(double scale) {
    return ThemeData(
      brightness: Brightness.light,
      splashColor: CustomAppColors.primary.withAlpha(30),
      highlightColor: CustomAppColors.secondary.withAlpha(30),
      scaffoldBackgroundColor: CustomAppColors.primaryBackground,
      cupertinoOverrideTheme: const CupertinoThemeData(
        brightness: Brightness.light,
      ),
      fontFamily: 'Figtree',
      visualDensity: VisualDensity.standard,
      bannerTheme: const MaterialBannerThemeData(),
      dialogTheme: const DialogThemeData(),
      elevatedButtonTheme: ElevatedButtonThemes.scaled(scale),
      textTheme: TextThemes.scaled(scale),
      iconTheme: IconThemes.scaled(scale),
      appBarTheme: AppBarThemes.scaled(scale),
      dropdownMenuTheme: DropdownThemes.defaultStyle,
      colorScheme: ColorSchemes.defaultStyle,
      inputDecorationTheme: InputDecorationThemes.scaled(scale),
      floatingActionButtonTheme: FloatingActionButtonThemes.scaled(scale),
      listTileTheme: ListTileThemes.scaled(scale),
      dividerTheme: DividerThemes.scaled(scale),
      bottomNavigationBarTheme: BottomNavigationBarThemes.scaled(scale),
      bottomAppBarTheme: BottomAppBarThemes.scaled(scale),
      extensions: [AppColors.defaultStyle(), AppTextStyles.light(scale)],
    );
  }

  static ThemeData _buildDark(double scale) {
    return ThemeData(
      brightness: Brightness.dark,
      splashColor: CustomAppColors.secondary.withAlpha(30),
      primaryColor: CustomAppColors.darkPrimary,
      highlightColor: CustomAppColors.secondaryVariant.withAlpha(30),
      scaffoldBackgroundColor: CustomAppColors.darkScaffold,
      cardColor: CustomAppColors.darkCards,
      cupertinoOverrideTheme: const CupertinoThemeData(
        brightness: Brightness.dark,
      ),
      fontFamily: 'Figtree',
      visualDensity: VisualDensity.standard,
      bannerTheme: const MaterialBannerThemeData(),
      dialogTheme: DialogThemeData(
        backgroundColor: CustomAppColors.darkCards,
        titleTextStyle: TextThemes.darkScaled(scale).headlineSmall,
        contentTextStyle: TextThemes.darkScaled(scale).bodyMedium,
      ),
      elevatedButtonTheme: ElevatedButtonThemes.darkScaled(scale),
      textTheme: TextThemes.darkScaled(scale),
      iconTheme: IconThemes.darkScaled(scale),
      appBarTheme: AppBarThemes.darkScaled(scale),
      inputDecorationTheme: InputDecorationThemes.darkScaled(scale),
      floatingActionButtonTheme: FloatingActionButtonThemes.scaled(scale),
      listTileTheme: ListTileThemes.scaled(scale),
      dividerTheme: DividerThemes.darkScaled(scale),
      bottomNavigationBarTheme: BottomNavigationBarThemes.darkScaled(scale),
      bottomAppBarTheme: BottomAppBarThemes.scaled(scale),
      extensions: [AppColors.dark(), AppTextStyles.dark(scale)],
      colorScheme: ColorSchemes.darkStyle.copyWith(brightness: Brightness.dark),
    );
  }
}

class ScaledThemeSet {
  const ScaledThemeSet({required this.light, required this.dark});

  final ThemeData light;
  final ThemeData dark;
}
