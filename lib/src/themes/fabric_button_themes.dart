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
  String? fontFamily,
}) {
  final Color borderColor = isDark ? mainColor.shade700 : mainColor.shade300;
  final Color disabledBorderColor =
      isDark ? mainColor.shade800 : mainColor.shade200;
  final Color selectedBg = isDark ? mainColor.shade700 : mainColor.shade200;
  final Color selectedFg = isDark ? mainColor.shade50 : mainColor.shade900;
  final Color unselectedFg = isDark ? mainColor.shade400 : mainColor.shade600;
  final Color disabledFg = isDark ? mainColor.shade600 : mainColor.shade400;
  final Color disabledBg = isDark
      ? mainColor.shade800.withValues(alpha: 0.45)
      : mainColor.shade100;

  return SegmentedButtonThemeData(
    style: SegmentedButton.styleFrom(
      backgroundColor: Colors.transparent,
      foregroundColor: unselectedFg,
      selectedBackgroundColor: selectedBg,
      selectedForegroundColor: selectedFg,
      disabledBackgroundColor: disabledBg,
      disabledForegroundColor: disabledFg,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      side: BorderSide(
        color: borderColor,
        width: 1,
      ),
      textStyle: TextStyle(
        fontFamily: fontFamily,
        fontSize: 12.5,
        fontWeight: FontWeight.w500,
      ),
      visualDensity: const VisualDensity(horizontal: -1, vertical: -2),
    ).copyWith(
      side: WidgetStateProperty.resolveWith<BorderSide?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return BorderSide(
            color: disabledBorderColor,
            width: 1,
          );
        }
        return BorderSide(
          color: borderColor,
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
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
  final Color activeBg = isDark ? mainColor.shade700 : mainColor.shade200;
  final Color activeFg = isDark ? mainColor.shade50 : mainColor.shade900;
  final Color defaultFg = isDark ? mainColor.shade400 : mainColor.shade600;
  final Color disabledFg = isDark ? mainColor.shade600 : mainColor.shade400;
  final Color borderColor = isDark ? mainColor.shade700 : mainColor.shade300;
  final Color selectedBorderColor =
      isDark ? mainColor.shade600 : mainColor.shade400;
  final Color disabledBorderColor =
      isDark ? mainColor.shade800 : mainColor.shade200;

  return ToggleButtonsThemeData(
    color: defaultFg,
    selectedColor: activeFg,
    disabledColor: disabledFg,
    fillColor: activeBg,
    borderColor: borderColor,
    selectedBorderColor: selectedBorderColor,
    disabledBorderColor: disabledBorderColor,
    borderRadius: BorderRadius.circular(8),
    borderWidth: 1,
    constraints: const BoxConstraints(minWidth: 36, minHeight: 34),
    textStyle: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
      fontSize: 12.5,
    ),
  );
}
