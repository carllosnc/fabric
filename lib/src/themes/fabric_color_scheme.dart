import 'package:flutter/material.dart';
import '../fabric_swatch.dart';

ColorScheme buildFabricLightColorScheme(FabricSwatch mainColor) {
  return ColorScheme(
    brightness: Brightness.light,

    // primary (softened from 950 to 800 for a rich charcoal / tinted dark in Light Mode)
    primary: mainColor.shade800,
    onPrimary: mainColor.shade00,
    primaryContainer: mainColor.shade200,
    onPrimaryContainer: mainColor.shade800,

    // secondary
    secondary: mainColor.shade500,
    onSecondary: mainColor.shade50,
    secondaryContainer: mainColor.shade100,
    onSecondaryContainer: mainColor.shade800,

    // tertiary
    tertiary: mainColor.shade600,
    onTertiary: mainColor.shade50,
    tertiaryContainer: mainColor.shade200,
    onTertiaryContainer: mainColor.shade800,

    // error
    error: const Color(0xFFBA1A1A),
    onError: mainColor.shade00,
    errorContainer: const Color(0xFFFFDAD6),
    onErrorContainer: const Color(0xFF410002),

    // surface & Material 3 surface containers
    surface: mainColor.shade50,
    onSurface: mainColor.shade800,
    surfaceDim: mainColor.shade200,
    surfaceBright: mainColor.shade00,
    surfaceContainerLowest: mainColor.shade00,
    surfaceContainerLow: mainColor.shade50,
    surfaceContainer: mainColor.shade50,
    surfaceContainerHigh: mainColor.shade100,
    surfaceContainerHighest: mainColor.shade100,
    onSurfaceVariant: mainColor.shade500,
    surfaceTint: mainColor.shade700,

    // outline
    outline: mainColor.shade300,
    outlineVariant: mainColor.shade100,

    // inverse
    inverseSurface: mainColor.shade800,
    onInverseSurface: mainColor.shade100,
    inversePrimary: mainColor.shade300,

    // shadow
    shadow: mainColor.shade800,
    scrim: mainColor.shade800,
  );
}

ColorScheme buildFabricDarkColorScheme(FabricSwatch mainColor) {
  return ColorScheme(
    brightness: Brightness.dark,

    // primary
    primary: mainColor.shade00,
    onPrimary: mainColor.shade900,
    primaryContainer: mainColor.shade700,
    onPrimaryContainer: mainColor.shade50,

    // secondary
    secondary: mainColor.shade500,
    onSecondary: mainColor.shade100,
    secondaryContainer: mainColor.shade700,
    onSecondaryContainer: mainColor.shade50,

    // tertiary
    tertiary: mainColor.shade400,
    onTertiary: mainColor.shade900,
    tertiaryContainer: mainColor.shade700,
    onTertiaryContainer: mainColor.shade50,

    // error
    error: const Color(0xFFFFB4AB),
    onError: const Color(0xFF690005),
    errorContainer: const Color(0xFF93000A),
    onErrorContainer: const Color(0xFFFFDAD6),

    // surface & Material 3 surface containers
    surface: mainColor.shade900,
    onSurface: mainColor.shade50,
    surfaceDim: mainColor.shade950,
    surfaceBright: mainColor.shade600,
    surfaceContainerLowest: mainColor.shade950,
    surfaceContainerLow: mainColor.shade900,
    surfaceContainer: mainColor.shade800,
    surfaceContainerHigh: mainColor.shade800,
    surfaceContainerHighest: mainColor.shade800,
    onSurfaceVariant: mainColor.shade400,
    surfaceTint: mainColor.shade400,

    // outline
    outline: mainColor.shade500,
    outlineVariant: mainColor.shade700,

    // inverse
    inverseSurface: mainColor.shade200,
    onInverseSurface: mainColor.shade800,
    inversePrimary: mainColor.shade700,

    // shadow
    shadow: mainColor.shade950,
    scrim: mainColor.shade950,
  );
}
