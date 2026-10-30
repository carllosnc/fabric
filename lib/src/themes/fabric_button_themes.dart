import 'package:flutter/material.dart';
import '../fabric_swatch.dart';

FloatingActionButtonThemeData buildFabricFabTheme(
  FabricSwatch mainColor, {
  required bool isDark,
}) {
  return FloatingActionButtonThemeData(
    backgroundColor: isDark ? mainColor.shade50 : mainColor.shade800,
    foregroundColor: isDark ? mainColor.shade950 : mainColor.shade00,
    splashColor: isDark ? mainColor.shade300 : mainColor.shade700,
    elevation: 0,
    focusElevation: 0,
    hoverElevation: 0,
    highlightElevation: 0,
    disabledElevation: 0,
    shape: const StadiumBorder(),
  );
}

SegmentedButtonThemeData buildFabricSegmentedButtonTheme(
  FabricSwatch mainColor, {
  required bool isDark,
}) {
  return SegmentedButtonThemeData(
    style: SegmentedButton.styleFrom(
      backgroundColor: isDark ? mainColor.shade800 : mainColor.shade50,
      foregroundColor: isDark ? mainColor.shade50 : mainColor.shade800,
      selectedBackgroundColor: isDark ? mainColor.shade50 : mainColor.shade800,
      selectedForegroundColor: isDark ? mainColor.shade950 : mainColor.shade00,
      disabledBackgroundColor: isDark
          ? mainColor.shade800.withValues(alpha: 0.45)
          : mainColor.shade100,
      disabledForegroundColor: isDark ? mainColor.shade500 : mainColor.shade400,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ).copyWith(
      side: WidgetStateProperty.resolveWith<BorderSide?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return BorderSide(
            color: isDark ? mainColor.shade800 : mainColor.shade200,
            width: 1,
          );
        }
        return BorderSide(
          color: isDark ? mainColor.shade700 : mainColor.shade200,
          width: 1,
        );
      }),
    ),
  );
}

FilledButtonThemeData buildFabricFilledButtonTheme(
  FabricSwatch mainColor, {
  required bool isDark,
}) {
  return FilledButtonThemeData(
    style: FilledButton.styleFrom(
      disabledBackgroundColor: isDark ? mainColor.shade800 : mainColor.shade200,
      disabledForegroundColor: isDark ? mainColor.shade500 : mainColor.shade400,
      elevation: 0,
      shape: const StadiumBorder(),
    ),
  );
}

ElevatedButtonThemeData buildFabricElevatedButtonTheme(
  FabricSwatch mainColor, {
  required bool isDark,
}) {
  final Color bg = isDark ? mainColor.shade800 : mainColor.shade50;
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: bg,
      foregroundColor: isDark ? mainColor.shade50 : mainColor.shade800,
      surfaceTintColor: bg,
      shadowColor: isDark ? Colors.black : mainColor.shade900,
      elevation: isDark ? 2 : 1,
      disabledBackgroundColor: isDark
          ? mainColor.shade800.withValues(alpha: 0.45)
          : mainColor.shade100,
      disabledForegroundColor: isDark ? mainColor.shade500 : mainColor.shade400,
      shape: const StadiumBorder(),
    ).copyWith(
      side: WidgetStateProperty.resolveWith<BorderSide?>((Set<WidgetState> states) {
        if (!isDark) {
          return BorderSide.none;
        }
        if (states.contains(WidgetState.disabled)) {
          return BorderSide(
            color: mainColor.shade800,
            width: 1,
          );
        }
        return BorderSide(
          color: mainColor.shade700,
          width: 1,
        );
      }),
    ),
  );
}

TextButtonThemeData buildFabricTextButtonTheme(
  FabricSwatch mainColor, {
  required bool isDark,
}) {
  return TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: isDark ? mainColor.shade50 : mainColor.shade800,
      disabledForegroundColor: isDark ? mainColor.shade500 : mainColor.shade400,
      shape: const StadiumBorder(),
    ),
  );
}

IconButtonThemeData buildFabricIconButtonTheme(
  FabricSwatch mainColor, {
  required bool isDark,
}) {
  return IconButtonThemeData(
    style: IconButton.styleFrom(
      disabledForegroundColor: isDark ? mainColor.shade500 : mainColor.shade400,
      shape: const StadiumBorder(),
    ),
  );
}

OutlinedButtonThemeData buildFabricOutlinedButtonTheme(
  FabricSwatch mainColor, {
  required bool isDark,
}) {
  return OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: isDark ? mainColor.shade50 : mainColor.shade800,
      disabledForegroundColor: isDark ? mainColor.shade500 : mainColor.shade400,
      shape: const StadiumBorder(),
    ).copyWith(
      side: WidgetStateProperty.resolveWith<BorderSide?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return BorderSide(
            color: isDark ? mainColor.shade800 : mainColor.shade200,
            width: 1,
          );
        }
        return BorderSide(
          color: isDark ? mainColor.shade600 : mainColor.shade300,
          width: 1,
        );
      }),
    ),
  );
}

ToggleButtonsThemeData buildFabricToggleButtonsTheme(
  FabricSwatch mainColor, {
  required bool isDark,
  String? fontFamily,
}) {
  final Color activeBg = isDark ? mainColor.shade50 : mainColor.shade800;
  final Color activeFg = isDark ? mainColor.shade950 : mainColor.shade00;
  final Color defaultFg = isDark ? mainColor.shade50 : mainColor.shade800;
  final Color disabledFg = isDark ? mainColor.shade500 : mainColor.shade400;

  return ToggleButtonsThemeData(
    color: defaultFg,
    selectedColor: activeFg,
    disabledColor: disabledFg,
    fillColor: activeBg,
    borderColor: isDark ? mainColor.shade500 : mainColor.shade400,
    selectedBorderColor: activeBg,
    disabledBorderColor: isDark ? mainColor.shade700 : mainColor.shade200,
    borderRadius: BorderRadius.circular(10),
    borderWidth: 1,
    textStyle: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    ),
  );
}
