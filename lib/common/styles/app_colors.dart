// Names tend to be determined from http://chir.ag/projects/name-that-color
import 'package:flutter/material.dart';

extension BuildContextColorExtension on BuildContext {
  AppColors get colors => Theme.of(this).extension<AppColors>()!;
}

class CustomAppColors {
  const CustomAppColors._();

  static const primary = Color(0xFF3498DB);

  static const primaryVariant = Color(0xFF2C3E50);

  static const secondary = Color(0xFF03DAC6);

  static const secondaryVariant = Color(0xFF018786);

  static const white = Color(0xFFFFFFFF);

  static const primaryBackground = Color(0xFFFFFFFF);

  static const secondaryBackground = Color(0xFFf2f2f2);

  static const primaryText = Color(0xFF12151c);

  static const secondaryText = Color(0xFF5a5c60);

  static const gray1 = Color(0xFF222222);

  static const gray2 = Color(0xFF7E7F80);

  static const gray3 = Color(0xFF828282);

  static const gray4 = Color(0xFFBDBDBD);

  static const gray5 = Color(0xFFE0E0E0);

  static const gray6 = Color(0xFFF2F2F2);

  static const error = Color(0xFFE65454);

  static const alert = Color(0xFFDE1F42);

  static const success = Color(0xFF02CA79);

  static const warning = Color(0xFFF1C40F);

  static const darkScaffold = Color(0xff111827);

  static const darkPrimary = Color(0xFF1C1C1C);

  static const darkCards = Color(0xFF1C1C1C);
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
      text: Color.fromRGBO(0, 0, 0, .85),
      secondaryText: Color.fromRGBO(0, 0, 0, .65),
      accentText: Color(0xFFBDBDBD),
      textOnColour: Color(0xFFFFFFFF),
      link: Color(0xFF563095),
      secondaryTextOnColour: Color(0xFFFFFFFF),
      placeholder: Color.fromRGBO(0, 0, 0, .45),
      disabledText: Color(0xFFD9D9D9),
      successText: Color(0xFF1E622F),
      attentionText: Color(0xFFB36205),
      warningText: Color(0xFFD41D16),
      neutralText: Color(0xFF625B71),
      tappable: Color(0xFF77216f),
      accent: Color(0xFFD9D9D9),
      foreground: Color(0xFFFFFFFF),
      background: Color(0xFFFAFAFA),
      divider: Color.fromRGBO(0, 0, 0, .25),
      disabled: Colors.black12,
      success: Color(0xFF35783C),
      attention: Color(0xFFE49318),
      warning: Color(0xFFD41D16),
      neutral: Color(0xFF625B71),
      information: Color(0xFF563095),
      scrim: Color.fromRGBO(0, 0, 0, .65),
    );
  }

  factory AppColors.dark() {
    return const AppColors(
      text: Color(0xFFFFFFFF),
      secondaryText: Color.fromRGBO(255, 255, 255, 0.65),
      accentText: Color(0xFFE8DEF8),
      textOnColour: Color(0xFFFFFFFF),
      link: Color(0xFFD0BCFF),
      secondaryTextOnColour: Color(0xFFB3AEBC),
      placeholder: Color.fromRGBO(255, 255, 255, 0.35),
      disabledText: Color(0xFF49454F),
      successText: Color(0xFFB7F397),
      attentionText: Color(0xFFEFBE74),
      warningText: Color(0xFFFF827B),
      neutralText: Color(0xFFD9D9D9),
      tappable: Color(0xFFeb3d1e),
      accent: Color(0xFFD9D9D9),
      foreground: Color(0xFFD9D9D9),
      background: Color(0xFFD9D9D9),
      divider: Color.fromRGBO(255, 255, 255, 0.25),
      disabled: Color.fromRGBO(255, 255, 255, 0.12),
      success: Color(0xFFD9D9D9),
      attention: Color(0xFFD9D9D9),
      warning: Color(0xFFFF827B),
      neutral: Color(0xFFCAC4D0),
      information: Color(0xFFD0BCFF),
      scrim: Color.fromRGBO(255, 255, 255, 0.35),
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
