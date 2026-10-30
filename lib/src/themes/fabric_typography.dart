import 'package:flutter/material.dart';

TextTheme buildFabricTextTheme({
  required Color textColor,
  String? fontFamily,
  TextTheme? baseTextTheme,
}) {
  TextStyle style(
    TextStyle? base, {
    required double fontSize,
    required FontWeight fontWeight,
    double? letterSpacing,
    double? height,
  }) {
    final TextStyle defaultStyle = TextStyle(
      color: textColor,
      fontFamily: fontFamily,
      fontSize: fontSize,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
      height: height,
    );
    if (base == null) {
      return defaultStyle;
    }
    return base.copyWith(
      color: textColor,
      fontFamily: fontFamily ?? base.fontFamily,
      fontSize: fontSize,
      fontWeight: fontWeight,
      letterSpacing: base.letterSpacing ?? letterSpacing,
      height: base.height ?? height,
    );
  }

  return TextTheme(
    displayLarge: style(
      baseTextTheme?.displayLarge,
      fontSize: 40,
      fontWeight: FontWeight.w700,
      letterSpacing: -1.0,
      height: 1.15,
    ),
    displayMedium: style(
      baseTextTheme?.displayMedium,
      fontSize: 38,
      fontWeight: FontWeight.w700,
      letterSpacing: -0.8,
      height: 1.18,
    ),
    displaySmall: style(
      baseTextTheme?.displaySmall,
      fontSize: 36,
      fontWeight: FontWeight.w700,
      letterSpacing: -0.6,
      height: 1.2,
    ),
    headlineLarge: style(
      baseTextTheme?.headlineLarge,
      fontSize: 32,
      fontWeight: FontWeight.w700,
      letterSpacing: -0.5,
      height: 1.25,
    ),
    headlineMedium: style(
      baseTextTheme?.headlineMedium,
      fontSize: 28,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.4,
      height: 1.28,
    ),
    headlineSmall: style(
      baseTextTheme?.headlineSmall,
      fontSize: 24,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.3,
      height: 1.3,
    ),
    titleLarge: style(
      baseTextTheme?.titleLarge,
      fontSize: 22,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.2,
      height: 1.35,
    ),
    titleMedium: style(
      baseTextTheme?.titleMedium,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.1,
      height: 1.4,
    ),
    titleSmall: style(
      baseTextTheme?.titleSmall,
      fontSize: 14,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
      height: 1.4,
    ),
    bodyLarge: style(
      baseTextTheme?.bodyLarge,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
      height: 1.5,
    ),
    bodyMedium: style(
      baseTextTheme?.bodyMedium,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
      height: 1.5,
    ),
    bodySmall: style(
      baseTextTheme?.bodySmall,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
      height: 1.45,
    ),
    labelLarge: style(
      baseTextTheme?.labelLarge,
      fontSize: 14,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
      height: 1.4,
    ),
    labelMedium: style(
      baseTextTheme?.labelMedium,
      fontSize: 12,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
      height: 1.35,
    ),
    labelSmall: style(
      baseTextTheme?.labelSmall,
      fontSize: 11,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.2,
      height: 1.3,
    ),
  );
}
