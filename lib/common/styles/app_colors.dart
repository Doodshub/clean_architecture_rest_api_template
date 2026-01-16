// Names tend to be determined from http://chir.ag/projects/name-that-color
import 'package:flutter/material.dart';

extension BuildContextColorExtension on BuildContext {
  AppColors get colors => Theme.of(this).extension<AppColors>()!;
}

class CustomAppColors {
  const CustomAppColors._();

  static const primary = Color(0xFF5C8D89);

  static const primaryVariant = Color(0xFF4A7471);

  static const secondary = Color(0xFF8BB5B1);

  static const secondaryVariant = Color(0xFF72A09C);

  static const white = Color(0xFFFFFFFF);

  static const primaryBackground = Color(0xFFF5F9F8);

  static const secondaryBackground = Color(0xFFEDF4F3);

  static const primaryText = Color(0xFF1F2D2C);

  static const secondaryText = Color(0xFF5A6665);

  static const gray1 = Color(0xFF2C3A39);

  static const gray2 = Color(0xFF778988);

  static const gray3 = Color(0xFF95A5A4);

  static const gray4 = Color(0xFFC4D0CF);

  static const gray5 = Color(0xFFE5EDED);

  static const gray6 = Color(0xFFF3F7F6);

  static const error = Color(0xFFD87676);

  static const alert = Color(0xFFC86868);

  static const success = Color(0xFF5C8D89);

  static const warning = Color(0xFFE8C488);

  static const darkScaffold = Color(0xFF1F2D2C);

  static const darkPrimary = Color(0xFF2C3A39);

  static const darkCards = Color(0xFF3A4847);
}

class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    this.text,
    this.secondaryText,
    this.accentText,
    this.textOnColour,
    this.link,
    this.secondaryTextOnColour,
    this.placeholder,
    this.disabledText,
    this.successText,
    this.attentionText,
    this.warningText,
    this.neutralText,
    this.tappable,
    this.accent,
    this.foreground,
    this.background,
    this.divider,
    this.disabled,
    this.success,
    this.attention,
    this.warning,
    this.neutral,
    this.information,
    this.scrim,
  });

  factory AppColors.defaultStyle() {
    return const AppColors(
      text: Color(0xFF1F2D2C),
      secondaryText: Color(0xFF5A6665),
      accentText: Color(0xFFC4D0CF),
      textOnColour: Color(0xFFFFFFFF),
      link: Color(0xFF5C8D89),
      secondaryTextOnColour: Color(0xFFF5F9F8),
      placeholder: Color(0xFF95A5A4),
      disabledText: Color(0xFFC4D0CF),
      successText: Color(0xFF4A7471),
      attentionText: Color(0xFFCA9A6A),
      warningText: Color(0xFFD87676),
      neutralText: Color(0xFF778988),
      tappable: Color(0xFF5C8D89),
      accent: Color(0xFFE5EDED),
      foreground: Color(0xFFFFFFFF),
      background: Color(0xFFF5F9F8),
      divider: Color(0xFFC4D0CF),
      disabled: Color(0xFFE5EDED),
      success: Color(0xFF5C8D89),
      attention: Color(0xFFE8C488),
      warning: Color(0xFFD87676),
      neutral: Color(0xFF95A5A4),
      information: Color(0xFF5C8D89),
      scrim: Color(0x99000000),
    );
  }

  factory AppColors.dark() {
    return const AppColors(
      text: Color(0xFFEDF4F3),
      secondaryText: Color(0xFFB4C5C4),
      accentText: Color(0xFFD0E0DF),
      textOnColour: Color(0xFF1F2D2C),
      link: Color(0xFF8BB5B1),
      secondaryTextOnColour: Color(0xFF2C3A39),
      placeholder: Color(0xFF778988),
      disabledText: Color(0xFF5A6665),
      successText: Color(0xFF8BB5B1),
      attentionText: Color(0xFFE6D4A8),
      warningText: Color(0xFFE89C9C),
      neutralText: Color(0xFFB4C5C4),
      tappable: Color(0xFF8BB5B1),
      accent: Color(0xFF5A6665),
      foreground: Color(0xFF3A4847),
      background: Color(0xFF1F2D2C),
      divider: Color(0xFF5A6665),
      disabled: Color(0xFF3A4847),
      success: Color(0xFF8BB5B1),
      attention: Color(0xFFE6D4A8),
      warning: Color(0xFFE89C9C),
      neutral: Color(0xFF95A5A4),
      information: Color(0xFF8BB5B1),
      scrim: Color(0xB3000000),
    );
  }

  final Color? text;
  final Color? secondaryText;
  final Color? accentText;
  final Color? textOnColour;
  final Color? link;
  final Color? secondaryTextOnColour;
  final Color? placeholder;
  final Color? disabledText;
  final Color? successText;
  final Color? attentionText;
  final Color? warningText;
  final Color? neutralText;
  final Color? tappable;
  final Color? accent;
  final Color? foreground;
  final Color? background;
  final Color? divider;
  final Color? disabled;
  final Color? success;
  final Color? attention;
  final Color? warning;
  final Color? neutral;
  final Color? information;
  final Color? scrim;

  @override
  ThemeExtension<AppColors> lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }
    return AppColors(
      text: Color.lerp(text, other.text, t),
      secondaryText: Color.lerp(secondaryText, other.secondaryText, t),
      accentText: Color.lerp(accentText, other.accentText, t),
      textOnColour: Color.lerp(textOnColour, other.textOnColour, t),
      link: Color.lerp(link, other.link, t),
      secondaryTextOnColour: Color.lerp(
        secondaryTextOnColour,
        other.secondaryTextOnColour,
        t,
      ),
      placeholder: Color.lerp(placeholder, other.placeholder, t),
      disabledText: Color.lerp(disabledText, other.disabledText, t),
      successText: Color.lerp(successText, other.successText, t),
      attentionText: Color.lerp(attentionText, other.attentionText, t),
      warningText: Color.lerp(warningText, other.warningText, t),
      neutralText: Color.lerp(neutralText, other.neutralText, t),
      tappable: Color.lerp(tappable, other.tappable, t),
      accent: Color.lerp(accent, other.accent, t),
      foreground: Color.lerp(foreground, other.foreground, t),
      background: Color.lerp(background, other.background, t),
      divider: Color.lerp(divider, other.divider, t),
      disabled: Color.lerp(disabled, other.disabled, t),
      success: Color.lerp(success, other.success, t),
      attention: Color.lerp(attention, other.attention, t),
      warning: Color.lerp(warning, other.warning, t),
      neutral: Color.lerp(neutral, other.neutral, t),
      information: Color.lerp(information, other.information, t),
      scrim: Color.lerp(scrim, other.scrim, t),
    );
  }

  @override
  AppColors copyWith({
    Color? text,
    Color? secondaryText,
    Color? accentText,
    Color? textOnColour,
    Color? link,
    Color? secondaryTextOnColour,
    Color? placeholder,
    Color? disabledText,
    Color? successText,
    Color? attentionText,
    Color? warningText,
    Color? neutralText,
    Color? tappable,
    Color? accent,
    Color? foreground,
    Color? background,
    Color? divider,
    Color? disabled,
    Color? success,
    Color? attention,
    Color? warning,
    Color? neutral,
    Color? information,
    Color? scrim,
  }) {
    return AppColors(
      text: text ?? this.text,
      secondaryText: secondaryText ?? this.secondaryText,
      accentText: accentText ?? this.accentText,
      textOnColour: textOnColour ?? this.textOnColour,
      link: link ?? this.link,
      secondaryTextOnColour:
          secondaryTextOnColour ?? this.secondaryTextOnColour,
      placeholder: placeholder ?? this.placeholder,
      disabledText: disabledText ?? this.disabledText,
      successText: successText ?? this.successText,
      attentionText: attentionText ?? this.attentionText,
      warningText: warningText ?? this.warningText,
      neutralText: neutralText ?? this.neutralText,
      tappable: tappable ?? this.tappable,
      accent: accent ?? this.accent,
      foreground: foreground ?? this.foreground,
      background: background ?? this.background,
      divider: divider ?? this.divider,
      disabled: disabled ?? this.disabled,
      success: success ?? this.success,
      attention: attention ?? this.attention,
      warning: warning ?? this.warning,
      neutral: neutral ?? this.neutral,
      information: information ?? this.information,
      scrim: scrim ?? this.scrim,
    );
  }
}
