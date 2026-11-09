import 'package:flutter/material.dart';
import '../fabric_swatch.dart';

SwitchThemeData buildFabricSwitchTheme(
  FabricSwatch mainColor, {
  required bool isDark,
}) {
  return SwitchThemeData(
    thumbColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
      if (states.contains(WidgetState.disabled)) {
        return isDark ? mainColor.shade500 : mainColor.shade400;
      }
      if (states.contains(WidgetState.selected)) {
        return isDark ? mainColor.shade900 : mainColor.shade00;
      }
      return isDark ? mainColor.shade400 : mainColor.shade500;
    }),
    trackColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
      if (states.contains(WidgetState.disabled)) {
        return isDark ? mainColor.shade900 : mainColor.shade50;
      }
      if (states.contains(WidgetState.selected)) {
        return isDark ? mainColor.shade50 : mainColor.shade800;
      }
      return isDark ? mainColor.shade900 : mainColor.shade00;
    }),
    trackOutlineColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
      if (states.contains(WidgetState.disabled)) {
        return isDark ? mainColor.shade500 : mainColor.shade400;
      }
      if (states.contains(WidgetState.selected)) {
        return isDark ? mainColor.shade50 : mainColor.shade800;
      }
      return isDark ? mainColor.shade500 : mainColor.shade400;
    }),
  );
}

InputDecorationThemeData buildFabricInputDecorationTheme(
  FabricSwatch mainColor, {
  required bool isDark,
  String? fontFamily,
}) {
  final Color borderColor = isDark ? mainColor.shade700 : mainColor.shade300;
  final Color focusedBorderColor = isDark ? mainColor.shade50 : mainColor.shade800;
  final Color disabledBorderColor = isDark ? mainColor.shade800 : mainColor.shade200;
  final Color mutedColor = isDark ? mainColor.shade400 : mainColor.shade500;
  final Color disabledFg = isDark ? mainColor.shade600 : mainColor.shade400;
  final Color errorColor = isDark ? const Color(0xFFFFB4AB) : const Color(0xFFBA1A1A);

  final Color iconStateColor = WidgetStateColor.resolveWith((Set<WidgetState> states) {
    if (states.contains(WidgetState.disabled)) {
      return disabledFg;
    }
    if (states.contains(WidgetState.error)) {
      return errorColor;
    }
    if (states.contains(WidgetState.focused)) {
      return focusedBorderColor;
    }
    return mutedColor;
  });

  return InputDecorationThemeData(
    isDense: true,
    filled: false,
    contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
    labelStyle: WidgetStateTextStyle.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.disabled)) {
        return TextStyle(
          color: disabledFg,
          fontFamily: fontFamily,
          fontSize: 14,
        );
      }
      if (states.contains(WidgetState.error)) {
        return TextStyle(
          color: errorColor,
          fontFamily: fontFamily,
          fontSize: 14,
        );
      }
      if (states.contains(WidgetState.focused)) {
        return TextStyle(
          color: focusedBorderColor,
          fontFamily: fontFamily,
          fontSize: 14,
        );
      }
      return TextStyle(
        color: mutedColor,
        fontFamily: fontFamily,
        fontSize: 14,
      );
    }),
    floatingLabelStyle: WidgetStateTextStyle.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.disabled)) {
        return TextStyle(
          color: disabledFg,
          fontFamily: fontFamily,
          fontWeight: FontWeight.w600,
          fontSize: 12,
        );
      }
      if (states.contains(WidgetState.error)) {
        return TextStyle(
          color: errorColor,
          fontFamily: fontFamily,
          fontWeight: FontWeight.w600,
          fontSize: 12,
        );
      }
      if (states.contains(WidgetState.focused)) {
        return TextStyle(
          color: focusedBorderColor,
          fontFamily: fontFamily,
          fontWeight: FontWeight.w600,
          fontSize: 12,
        );
      }
      return TextStyle(
        color: isDark ? mainColor.shade300 : mainColor.shade700,
        fontFamily: fontFamily,
        fontWeight: FontWeight.w600,
        fontSize: 12,
      );
    }),
    hintStyle: TextStyle(
      color: mutedColor,
      fontFamily: fontFamily,
      fontSize: 14,
    ),
    errorStyle: TextStyle(
      color: errorColor,
      fontFamily: fontFamily,
      fontSize: 12,
    ),
    helperStyle: TextStyle(
      color: mutedColor,
      fontFamily: fontFamily,
      fontSize: 12,
    ),
    suffixIconColor: iconStateColor,
    prefixIconColor: iconStateColor,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: borderColor),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: borderColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: focusedBorderColor, width: 1.5),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: disabledBorderColor),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: errorColor, width: 1),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: errorColor, width: 1.5),
    ),
  );
}

DropdownMenuThemeData buildFabricDropdownMenuTheme(
  FabricSwatch mainColor, {
  required bool isDark,
  String? fontFamily,
}) {
  final Color borderColor = isDark ? mainColor.shade700 : mainColor.shade300;
  final Color focusedBorderColor = isDark ? mainColor.shade50 : mainColor.shade800;
  final Color disabledBorderColor = isDark ? mainColor.shade800 : mainColor.shade200;
  final Color menuBg = isDark ? mainColor.shade800 : mainColor.shade50;

  return DropdownMenuThemeData(
    textStyle: TextStyle(
      fontFamily: fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: isDark ? mainColor.shade50 : mainColor.shade800,
    ),
    inputDecorationTheme: InputDecorationThemeData(
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      labelStyle: TextStyle(
        fontFamily: fontFamily,
        fontSize: 14,
        color: isDark ? mainColor.shade400 : mainColor.shade500,
      ),
      floatingLabelStyle: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w600,
        fontSize: 12,
        color: isDark ? mainColor.shade300 : mainColor.shade700,
      ),
      hintStyle: TextStyle(
        fontFamily: fontFamily,
        fontSize: 14,
        color: isDark ? mainColor.shade400 : mainColor.shade500,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: borderColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: borderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: focusedBorderColor, width: 1.5),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: disabledBorderColor),
      ),
    ),
    menuStyle: MenuStyle(
      backgroundColor: WidgetStateProperty.all(menuBg),
      surfaceTintColor: WidgetStateProperty.all(menuBg),
      elevation: WidgetStateProperty.all(0),
      side: WidgetStateProperty.all(
        BorderSide(
          color: isDark ? mainColor.shade700 : mainColor.shade200,
          width: 1,
        ),
      ),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
  );
}

SliderThemeData buildFabricSliderTheme(
  FabricSwatch mainColor, {
  required bool isDark,
  String? fontFamily,
}) {
  final Color activeColor = isDark ? mainColor.shade50 : mainColor.shade800;
  final Color inactiveColor = isDark ? mainColor.shade700 : mainColor.shade100;

  return SliderThemeData(
    valueIndicatorColor: activeColor,
    valueIndicatorTextStyle: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.bold,
      color: isDark ? mainColor.shade950 : mainColor.shade00,
      fontSize: 12,
    ),
    activeTrackColor: activeColor,
    inactiveTrackColor: inactiveColor,
    thumbColor: activeColor,
    overlayColor: (isDark ? mainColor.shade50 : mainColor.shade500)
        .withValues(alpha: 0.2),
    disabledActiveTrackColor: inactiveColor,
    disabledInactiveTrackColor: inactiveColor,
    disabledThumbColor: isDark ? mainColor.shade600 : mainColor.shade400,
    tickMarkShape: const RoundSliderTickMarkShape(),
    trackShape: const RectangularSliderTrackShape(),
    trackHeight: 2,
    rangeTrackShape: const RectangularRangeSliderTrackShape(),
    rangeValueIndicatorShape: const PaddleRangeSliderValueIndicatorShape(),
    trackGap: 0,
    minThumbSeparation: 0,
  );
}

CheckboxThemeData buildFabricCheckboxTheme(
  FabricSwatch mainColor, {
  required bool isDark,
}) {
  return CheckboxThemeData(
    fillColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
      if (states.contains(WidgetState.disabled)) {
        if (states.contains(WidgetState.selected)) {
          return isDark ? mainColor.shade600 : mainColor.shade300;
        }
        return isDark ? mainColor.shade700 : mainColor.shade100;
      }
      if (states.contains(WidgetState.selected)) {
        return isDark ? mainColor.shade50 : mainColor.shade800;
      }
      return isDark ? Colors.transparent : mainColor.shade00;
    }),
    checkColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
      if (states.contains(WidgetState.disabled)) {
        return isDark ? mainColor.shade400 : mainColor.shade500;
      }
      if (states.contains(WidgetState.selected)) {
        return isDark ? mainColor.shade950 : mainColor.shade50;
      }
      return mainColor.shade50;
    }),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(3),
      side: BorderSide(
        color: mainColor.shade500,
        width: 1,
      ),
    ),
    visualDensity: VisualDensity.standard,
    side: BorderSide(
      color: mainColor.shade500,
      width: 1,
    ),
  );
}

RadioThemeData buildFabricRadioTheme(
  FabricSwatch mainColor, {
  required bool isDark,
}) {
  return RadioThemeData(
    fillColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
      if (states.contains(WidgetState.disabled)) {
        return isDark ? mainColor.shade500 : mainColor.shade400;
      }
      if (states.contains(WidgetState.selected)) {
        return isDark ? mainColor.shade50 : mainColor.shade800;
      }
      return mainColor.shade500;
    }),
    overlayColor: WidgetStateProperty.all(
      mainColor.shade400.withValues(alpha: 0.2),
    ),
  );
}

TextSelectionThemeData buildFabricTextSelectionTheme(
  FabricSwatch mainColor, {
  required bool isDark,
}) {
  final Color handleAndCursor = isDark ? mainColor.shade50 : mainColor.shade800;
  return TextSelectionThemeData(
    cursorColor: handleAndCursor,
    selectionColor: isDark ? mainColor.shade700 : mainColor.shade200,
    selectionHandleColor: handleAndCursor,
  );
}

TimePickerThemeData buildFabricTimePickerTheme(
  FabricSwatch mainColor, {
  required bool isDark,
  String? fontFamily,
}) {
  final Color bg = isDark ? mainColor.shade950 : mainColor.shade00;
  final Color fg = isDark ? mainColor.shade50 : mainColor.shade800;
  final Color containerColor = isDark ? mainColor.shade800 : mainColor.shade50;
  final Color errorColor = isDark ? const Color(0xFFFFB4AB) : const Color(0xFFBA1A1A);

  return TimePickerThemeData(
    backgroundColor: bg,
    elevation: 0,
    dialHandColor: isDark ? mainColor.shade50 : mainColor.shade800,
    hourMinuteColor: containerColor,
    dayPeriodColor: containerColor,
    hourMinuteTextColor: fg,
    dayPeriodTextColor: fg,
    entryModeIconColor: fg,
    helpTextStyle: TextStyle(fontFamily: fontFamily, color: fg),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    inputDecorationTheme: InputDecorationThemeData(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: mainColor.shade500),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: mainColor.shade500),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: fg, width: 2),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: isDark ? mainColor.shade700 : mainColor.shade200,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: errorColor, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: errorColor, width: 2),
      ),
    ),
    dayPeriodBorderSide: BorderSide(
      color: isDark ? mainColor.shade600 : mainColor.shade200,
      width: 1,
    ),
    dialBackgroundColor: bg,
  );
}

DatePickerThemeData buildFabricDatePickerTheme(
  FabricSwatch mainColor, {
  required bool isDark,
  String? fontFamily,
}) {
  final Color bg = isDark ? mainColor.shade950 : mainColor.shade00;
  final Color fg = isDark ? mainColor.shade50 : mainColor.shade800;

  return DatePickerThemeData(
    backgroundColor: bg,
    rangePickerHeaderHelpStyle: TextStyle(
      fontFamily: fontFamily,
      color: isDark ? mainColor.shade00 : mainColor.shade800,
      fontSize: 12,
      height: 1.1,
      fontWeight: FontWeight.bold,
    ),
    dayBackgroundColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
      if (states.contains(WidgetState.selected)) {
        return fg;
      }
      return bg;
    }),
    dayForegroundColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
      if (states.contains(WidgetState.disabled)) {
        return isDark ? mainColor.shade600 : mainColor.shade400;
      }
      if (states.contains(WidgetState.selected)) {
        return bg;
      }
      return fg;
    }),
    elevation: 0,
    headerBackgroundColor: bg,
    headerForegroundColor: fg,
    headerHeadlineStyle: TextStyle(
      fontFamily: fontFamily,
      color: fg,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    headerHelpStyle: TextStyle(
      fontFamily: fontFamily,
      color: fg,
    ),
    rangePickerBackgroundColor: bg,
    rangePickerElevation: 0,
    rangePickerHeaderBackgroundColor: bg,
    rangePickerSurfaceTintColor: bg,
    rangePickerHeaderHeadlineStyle: TextStyle(
      fontFamily: fontFamily,
      color: fg,
      fontSize: 20,
      height: 1.2,
      fontWeight: FontWeight.bold,
    ),
    rangeSelectionBackgroundColor: isDark ? mainColor.shade800 : mainColor.shade50,
    rangePickerHeaderForegroundColor: isDark ? mainColor.shade300 : mainColor.shade700,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    surfaceTintColor: bg,
    todayBackgroundColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
      if (states.contains(WidgetState.selected)) {
        return fg;
      }
      return bg;
    }),
    todayBorder: isDark
        ? BorderSide(color: mainColor.shade500, width: 1)
        : const BorderSide(width: 1),
    todayForegroundColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
      if (states.contains(WidgetState.selected)) {
        return isDark ? mainColor.shade950 : mainColor.shade50;
      }
      return fg;
    }),
    weekdayStyle: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.bold,
      color: fg,
    ),
  );
}

SearchViewThemeData buildFabricSearchViewTheme(
  FabricSwatch mainColor, {
  required bool isDark,
  String? fontFamily,
}) {
  final Color bg = isDark ? mainColor.shade900 : mainColor.shade00;
  final Color fg = isDark ? mainColor.shade50 : mainColor.shade800;
  final Color muted = isDark ? mainColor.shade400 : mainColor.shade500;

  return SearchViewThemeData(
    backgroundColor: bg,
    surfaceTintColor: bg,
    elevation: 0,
    side: BorderSide.none,
    dividerColor: isDark ? mainColor.shade800 : mainColor.shade100,
    headerTextStyle: TextStyle(
      fontFamily: fontFamily,
      fontSize: 14,
      color: fg,
    ),
    headerHintStyle: TextStyle(
      fontFamily: fontFamily,
      fontSize: 14,
      color: muted,
    ),
  );
}

SearchBarThemeData buildFabricSearchBarTheme(
  FabricSwatch mainColor, {
  required bool isDark,
  String? fontFamily,
}) {
  final Color bg = isDark ? mainColor.shade800 : mainColor.shade50;
  return SearchBarThemeData(
    backgroundColor: WidgetStateProperty.all(bg),
    surfaceTintColor: WidgetStateProperty.all(bg),
    elevation: WidgetStateProperty.all(0),
    constraints: const BoxConstraints(
      minWidth: 240.0,
      maxWidth: 800.0,
      minHeight: 40.0,
      maxHeight: 42.0,
    ),
    padding: WidgetStateProperty.all(
      const EdgeInsets.symmetric(horizontal: 12.0),
    ),
    textStyle: WidgetStateProperty.all(
      TextStyle(
        fontFamily: fontFamily,
        fontSize: 14,
        color: isDark ? mainColor.shade50 : mainColor.shade800,
      ),
    ),
    hintStyle: WidgetStateProperty.all(
      TextStyle(
        fontFamily: fontFamily,
        fontSize: 14,
        color: isDark ? mainColor.shade400 : mainColor.shade500,
      ),
    ),
    shape: WidgetStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );
}
