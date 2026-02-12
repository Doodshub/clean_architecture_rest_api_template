import 'package:clean_architecture_template/common/styles/divider_themes.dart';
import 'package:clean_architecture_template/common/styles/dropdown_theme.dart';
import 'package:clean_architecture_template/common/styles/floating_action_button_themes.dart';
import 'package:clean_architecture_template/common/styles/input_decoration_themes.dart';
import 'package:clean_architecture_template/common/styles/list_tile_themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clean_architecture_template/common/styles/app_bar_themes.dart';
import 'package:clean_architecture_template/common/styles/app_colors.dart';
import 'package:clean_architecture_template/common/styles/color_schemes.dart';
import 'package:clean_architecture_template/common/styles/elevated_button_themes.dart';
import 'package:clean_architecture_template/common/styles/icon_themes.dart';
import 'package:clean_architecture_template/common/styles/text_themes.dart';

class AppThemes {
  const AppThemes._();

  static final defaultStyle = ThemeData(
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
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(),
    dialogTheme: const DialogThemeData(),
    elevatedButtonTheme: ElevatedButtonThemes.defaultStyle,
    textTheme: TextThemes.defaultStyle,
    iconTheme: IconThemes.defaultStyle,
    appBarTheme: AppBarThemes.defaultStyle,
    dropdownMenuTheme: DropdownThemes.defaultStyle,
    colorScheme: ColorSchemes.defaultStyle,
    dividerTheme: DividerThemes.defaultStyle,

    // sliderTheme: SliderThemes.defaultStyle,
    // textButtonTheme: TextButtonThemes.defaultStyle,
    // outlinedButtonTheme: OutlinedButtonThemes.defaultStyle,
    // buttonTheme: ButtonThemes.defaultStyle,
    // cardTheme: CardThemes.defaultStyle,
    // chipTheme: ChipThemes.defaultStyle,
    inputDecorationTheme: InputDecorationThemes.defaultStyle,
    floatingActionButtonTheme: FloatingActionButtonThemes.defaultStyle,
    listTileTheme: ListTileThemes.defaultStyle,
    extensions: [AppColors.defaultStyle()],
    bottomAppBarTheme: const BottomAppBarThemeData(
      color: CustomAppColors.gray1,
    ),
  );

  static final darkTheme = ThemeData(
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
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: CustomAppColors.darkCards,
      selectedIconTheme: IconThemeData(color: CustomAppColors.gray6),
      unselectedIconTheme: IconThemeData(color: CustomAppColors.gray4),
    ),
    dialogTheme: DialogThemeData(
      backgroundColor: CustomAppColors.darkCards,
      titleTextStyle: TextThemes.darkStyle.headlineSmall,
      contentTextStyle: TextThemes.darkStyle.bodyMedium,
    ),
    elevatedButtonTheme: ElevatedButtonThemes.defaultStyle,
    textTheme: TextThemes.darkStyle,
    iconTheme: IconThemes.darkStyle,
    appBarTheme: AppBarThemes.darkStyle,
    inputDecorationTheme: InputDecorationThemes.darkStyle,
    extensions: [AppColors.dark()],
    colorScheme: ColorSchemes.darkStyle.copyWith(brightness: Brightness.dark),
  );
}
