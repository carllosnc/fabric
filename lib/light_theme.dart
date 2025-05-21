import 'package:flutter/material.dart';
import './colors.dart';

neutralLightTheme() {
  return ThemeData(
    colorSchemeSeed: Colors.grey,
    scaffoldBackgroundColor: Colors.white,
    disabledColor: neutralColor.shade400,
    brightness: Brightness.light,

    /*--- APP BAR ---*/

    appBarTheme: AppBarTheme(
      iconTheme: const IconThemeData(
        color: Colors.black,
        size: 24,
      ),
      titleTextStyle: const TextStyle(
        fontStyle: FontStyle.normal,
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      surfaceTintColor: Colors.white,
      elevation: 0,
    ),

    /*--- TEXT ---*/

    textTheme: TextTheme(
      displayLarge: TextStyle(color: neutralColor.shade900),
      displayMedium: TextStyle(color: neutralColor.shade900),
      displaySmall: TextStyle(color: neutralColor.shade900),
      headlineLarge: TextStyle(color: neutralColor.shade900),
      headlineMedium: TextStyle(color: neutralColor.shade900),
      headlineSmall: TextStyle(color: neutralColor.shade900),
      titleLarge: TextStyle(color: neutralColor.shade900),
      titleMedium: TextStyle(color: neutralColor.shade900),
      titleSmall: TextStyle(color: neutralColor.shade900),
      bodyLarge: TextStyle(color: neutralColor.shade900),
      bodyMedium: TextStyle(color: neutralColor.shade900),
      labelLarge: TextStyle(color: neutralColor.shade900),
      bodySmall: TextStyle(color: neutralColor.shade900),
      labelMedium: TextStyle(color: neutralColor.shade900),
      labelSmall: TextStyle(color: neutralColor.shade900),
    ),

    /*--- ELEVATED BUTTON ---*/

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStateProperty.resolveWith<TextStyle>((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return const TextStyle(
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.lineThrough,
              decorationColor: Colors.black,
            );
          }
          return const TextStyle(
            fontWeight: FontWeight.bold,
          );
        }),
        overlayColor: WidgetStateProperty.all(neutralColor.shade400),
        foregroundColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return Colors.white;
          }

          return Colors.black;
        }),
        backgroundColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return neutralColor.shade400;
          }
          return neutralColor.shade200;
        }),
      ),
    ),

    /*--- FILLED BUTTON ---*/

    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStateProperty.resolveWith<TextStyle>((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return const TextStyle(
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.lineThrough,
              decorationColor: Colors.black,
            );
          }
          return const TextStyle(
            fontWeight: FontWeight.bold,
          );
        }),
        overlayColor: WidgetStateProperty.all(neutralColor.shade600),
        foregroundColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return Colors.white;
          }

          return Colors.white;
        }),
        backgroundColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return neutralColor.shade400;
          }
          return Colors.black;
        }),
      ),
    ),

    /*--- OUTLINED BUTTON ---*/

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        side: WidgetStateProperty.resolveWith<BorderSide>((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return BorderSide(
              color: neutralColor.shade300,
              width: 1,
            );
          }
          return BorderSide(
            color: neutralColor.shade500,
            width: 1,
          );
        }),
        overlayColor: WidgetStateProperty.all(
          neutralColor.shade200,
        ),
        textStyle: WidgetStateProperty.resolveWith<TextStyle>((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return const TextStyle(
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.lineThrough,
              decorationColor: Colors.black,
            );
          }
          return const TextStyle(
            fontWeight: FontWeight.bold,
          );
        }),
        foregroundColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return neutralColor.shade500;
          }
          return Colors.black;
        }),
        backgroundColor: WidgetStateProperty.all(Colors.white),
      ),
    ),

    /*--- TEXT BUTTON ---*/

    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        overlayColor: WidgetStateProperty.all(
          neutralColor.shade300,
        ),
        textStyle: WidgetStateProperty.resolveWith<TextStyle>((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return const TextStyle(
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.lineThrough,
              decorationColor: Colors.black,
            );
          }
          return const TextStyle(
            fontWeight: FontWeight.bold,
          );
        }),
        foregroundColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return neutralColor.shade500;
          }
          return Colors.black;
        }),
      ),
    ),

    /*--- DIVIDER ---*/

    dividerTheme: DividerThemeData(
      thickness: 1,
      space: 0,
      color: neutralColor.shade300,
    ),

    /*--- LIST TILE ---*/

    listTileTheme: ListTileThemeData(
      horizontalTitleGap: 20,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 0,
      ),
      titleTextStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      textColor: Colors.black,
      iconColor: Colors.black,
    ),

    /*--- DRAWER ---*/

    drawerTheme: DrawerThemeData(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(0),
        ),
      ),
    ),

    /*--- CHIP ---*/

    chipTheme: ChipThemeData(
      checkmarkColor: Colors.black,
      color: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return neutralColor.shade200;
        }

        return Colors.white;
      }),
      backgroundColor: Colors.white,
      brightness: Brightness.light,
      deleteIconColor: Colors.black,
      disabledColor: neutralColor.shade200,
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      iconTheme: const IconThemeData(
        color: Colors.black,
        size: 16,
      ),
      side: BorderSide(
        color: neutralColor.shade400,
        width: 1,
      ),
      elevation: 0,
      secondarySelectedColor: Colors.grey.shade300,
      selectedColor: Colors.grey.shade300,
      labelStyle: const TextStyle(
        fontSize: 13,
        color: Colors.black,
      ),
    ),

    /*--- TOOLTIP ---*/

    tooltipTheme: TooltipThemeData(
      textStyle: const TextStyle(color: Colors.white),
      decoration: BoxDecoration(
        color: Colors.grey.shade600,
        borderRadius: BorderRadius.circular(6),
      ),
    ),

    /*--- POPUP MENU ---*/

    popupMenuTheme: PopupMenuThemeData(
      color: Colors.grey.shade300,
      elevation: 0,
      labelTextStyle: WidgetStateProperty.all(
        const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 14,
        ),
      ),
      textStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontSize: 16,
      ),
      menuPadding: const EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),

    /*--- SWITCH ---*/

    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return neutralColor.shade400;
        }
        if (states.contains(WidgetState.selected)) {
          return Colors.white;
        }

        return Colors.black;
      }),
      trackColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return Colors.white;
        }
        if (states.contains(WidgetState.selected)) {
          return Colors.black;
        }
        return Colors.white;
      }),
      trackOutlineColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return neutralColor.shade400;
        }
        if (states.contains(WidgetState.selected)) {
          return Colors.black;
        }
        return Colors.black;
      }),
    ),

    /*--- TEXT FIELD ---*/

    inputDecorationTheme: InputDecorationTheme(
      /* Label and hint */
      labelStyle: TextStyle(color: neutralColor.shade900),
      hintStyle: TextStyle(color: neutralColor.shade500),
      errorStyle: TextStyle(color: Colors.red),
      helperStyle: TextStyle(color: neutralColor.shade500),

      /* padding */
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),

      /* Prefix and suffix */
      suffixIconColor: neutralColor.shade500,
      prefixIconColor: neutralColor.shade500,

      /* Border */
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: neutralColor.shade500),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: neutralColor.shade500),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.black, width: 2),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: neutralColor.shade300,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.red.shade600, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.red.shade600, width: 2),
      ),
      filled: false,
    ),

    /*--- DIALOG ---*/

    dialogTheme: DialogTheme(
      surfaceTintColor: Colors.white,
      elevation: 0,
      titleTextStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontSize: 16,
      ),
      contentTextStyle: TextStyle(
        fontWeight: FontWeight.normal,
        color: neutralColor.shade700,
        fontSize: 16,
      ),
      backgroundColor: Colors.white,
      insetPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),

    /*--- BOTTOM NAVIGATION BAR ---*/

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: neutralColor.shade200,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.black,
      unselectedItemColor: neutralColor.shade700,
      showUnselectedLabels: true,
      showSelectedLabels: true,
      selectedLabelStyle: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      selectedIconTheme: const IconThemeData(
        color: Colors.black,
      ),
      unselectedLabelStyle: TextStyle(
        color: neutralColor.shade500,
      ),
      unselectedIconTheme: IconThemeData(
        color: neutralColor.shade500,
      ),
      elevation: 0,
    ),

    /*--- BOTTOM SHEET ---*/

    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(0),
        ),
      ),
    ),

    /*--- SLIDER ---*/

    sliderTheme: SliderThemeData(
      valueIndicatorColor: Colors.black,
      valueIndicatorTextStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontSize: 12,
      ),
      activeTrackColor: Colors.black,
      inactiveTrackColor: neutralColor.shade300,
      thumbColor: Colors.black,
      overlayColor: neutralColor.shade500.withValues(alpha: 0.2),
      disabledActiveTrackColor: neutralColor.shade300,
      disabledInactiveTrackColor: neutralColor.shade200,
      disabledThumbColor: neutralColor.shade400,
      tickMarkShape: const RoundSliderTickMarkShape(),
      trackShape: const RectangularSliderTrackShape(),
    ),

    /*--- PROGRESS INDICATOR ---*/

    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: Colors.black,
      linearTrackColor: neutralColor.shade300,
      circularTrackPadding: const EdgeInsets.all(0),
    ),

    /*--- FLOATING ACTION BUTTON ---*/

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.black,
      shape: const StadiumBorder(),
      splashColor: neutralColor.shade700,
      foregroundColor: Colors.white,
    ),

    /*--- CHECKBOX ---*/

    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return Colors.black;
        }

        if (states.contains(WidgetState.disabled)) {
          return neutralColor.shade300;
        }

        return Colors.white;
      }),
      checkColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return Colors.white;
        }

        return Colors.white;
      }),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(3),
        side: BorderSide(
          color: neutralColor.shade500,
          width: 1,
        ),
      ),
      visualDensity: VisualDensity.standard,
      side: BorderSide(
        color: neutralColor.shade500,
        width: 1,
      ),
    ),

    /*--- RADIOBUTTON ---*/

    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return neutralColor.shade400;
        }

        return Colors.black;
      }),
      overlayColor: WidgetStateProperty.all(neutralColor.shade400),
    ),

    /*--- TEXT SELECTION ---*/

    textSelectionTheme: TextSelectionThemeData(
      cursorColor: neutralColor.shade900,
      selectionColor: neutralColor.shade200,
      selectionHandleColor: neutralColor.shade900,
    ),

    /*--- TIMEPICKER ---*/

    timePickerTheme: TimePickerThemeData(
      backgroundColor: Colors.white,
      elevation: 0,
      dialHandColor: neutralColor.shade900,
      hourMinuteColor: neutralColor.shade200,
      dayPeriodColor: neutralColor.shade200,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: neutralColor.shade500),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: neutralColor.shade500),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.black, width: 2),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: neutralColor.shade300,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.red.shade600, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.red.shade600, width: 2),
        ),
      ),
      dayPeriodBorderSide: BorderSide(
        color: neutralColor.shade400,
        width: 1,
      ),
      dialBackgroundColor: Colors.white,
    ),

    /*--- DATEPICKER ---*/

    datePickerTheme: DatePickerThemeData(
      backgroundColor: Colors.white,
      dayBackgroundColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return Colors.black;
        }
        return Colors.white;
      }),
      dayForegroundColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return Colors.white;
        }
        return Colors.black;
      }),
      elevation: 0,
      headerBackgroundColor: Colors.white,
      headerForegroundColor: Colors.black,
      headerHeadlineStyle: TextStyle(
        foreground: Paint()..color = Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      headerHelpStyle: TextStyle(
        color: Colors.black,
      ),
      rangePickerBackgroundColor: Colors.white,
      rangePickerSurfaceTintColor: Colors.white,
      rangePickerHeaderHeadlineStyle: TextStyle(
        foreground: Paint()..color = Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      rangeSelectionBackgroundColor: neutralColor.shade200,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      surfaceTintColor: Colors.white,
      todayBackgroundColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return Colors.black;
        }
        return Colors.white;
      }),
      todayBorder: BorderSide(
        width: 1,
      ),
      todayForegroundColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return Colors.white;
        }
        return Colors.black;
      }),
      weekdayStyle: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),

    /*--- SEGMENTED BUTTON ---*/

    segmentedButtonTheme: SegmentedButtonThemeData(
      style: ButtonStyle(
        overlayColor: WidgetStateProperty.all(neutralColor.shade300),
        surfaceTintColor: WidgetStateProperty.all(Colors.white),
        textStyle: WidgetStateProperty.resolveWith<TextStyle>((Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return const TextStyle(
              fontWeight: FontWeight.bold,
            );
          }
          return const TextStyle(
            fontWeight: FontWeight.normal,
          );
        }),
        side: WidgetStateProperty.all(BorderSide(
          color: neutralColor.shade400,
          width: 1,
        )),
        foregroundColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return Colors.black;
          }
          return Colors.black;
        }),
        backgroundColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return neutralColor.shade200;
          }
          return Colors.white;
        }),
      ),
    ),

    /*--- TAB BAR ---*/

    tabBarTheme: TabBarTheme(
      dividerColor: neutralColor.shade300,
      dividerHeight: 3,
      indicatorColor: Colors.black,
      indicatorSize: TabBarIndicatorSize.label,
      indicator: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black,
            width: 3,
          ),
        ),
      ),
      unselectedLabelColor: neutralColor.shade500,
      overlayColor: WidgetStateColor.resolveWith((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return Colors.black;
        }
        return neutralColor.shade200;
      }),
      labelColor: Colors.black,
    ),

    /*--- EXPANSION PANEL ---*/

    expansionTileTheme: ExpansionTileThemeData(
      expandedAlignment: Alignment.topLeft,
      expansionAnimationStyle: AnimationStyle(
        curve: Curves.fastOutSlowIn,
        duration: const Duration(milliseconds: 200),
        reverseDuration: const Duration(milliseconds: 200),
      ),
      collapsedShape: Border(
        bottom: BorderSide(
          color: Colors.white,
          width: 4,
        ),
      ),
      shape: Border(
        bottom: BorderSide(
          color: Colors.white,
          width: 4,
        ),
      ),
      clipBehavior: Clip.none,
      collapsedBackgroundColor: Colors.white,
      collapsedIconColor: Colors.black,
      iconColor: Colors.black,
      backgroundColor: neutralColor.shade200,
      textColor: Colors.black,
      childrenPadding: const EdgeInsets.only(
        bottom: 15,
        top: 0,
        left: 20,
        right: 20,
      ),
    ),

    /*--- SNACKBAR ---*/

    snackBarTheme: SnackBarThemeData(
      backgroundColor: neutralColor.shade800,
      actionTextColor: Colors.white,
      disabledActionBackgroundColor: neutralColor.shade800,
      disabledActionTextColor: neutralColor.shade400,
      actionBackgroundColor: neutralColor.shade700,
      closeIconColor: Colors.white,
      contentTextStyle: const TextStyle(
        color: Colors.white,
      ),
      elevation: 0,
    ),

    /*--- ICON BUTTON ---*/

    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        overlayColor: WidgetStateProperty.all(neutralColor.shade300),
        side: WidgetStateProperty.all(
          BorderSide(
            color: Colors.transparent,
            width: 0,
          ),
        ),
        foregroundColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return neutralColor.shade400;
          }
          return Colors.black;
        }),
        backgroundColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
          return Colors.transparent;
        }),
      ),
    ),

    /*--- ICON BUTTON ---*/

    badgeTheme: BadgeThemeData(
      alignment: Alignment.topCenter,
      offset: const Offset(0, -4),
      backgroundColor: Colors.red,
      textColor: Colors.white,
    ),

    /*--- NAVIGATION RAIL ---*/

    navigationRailTheme: NavigationRailThemeData(
      backgroundColor: Colors.white,
      elevation: 0,
      selectedIconTheme: IconThemeData(
        color: Colors.black,
      ),
      unselectedIconTheme: IconThemeData(
        color: Colors.black,
      ),
      indicatorColor: neutralColor.shade300,
      labelType: NavigationRailLabelType.none,
    ),

    /*--- NAVIGATION BAR ---*/

    menuBarTheme: MenuBarThemeData(
      style: MenuStyle(
        elevation: WidgetStateProperty.resolveWith<double>((Set<WidgetState> states) {
          return 0;
        }),
        backgroundColor: WidgetStateProperty.all(Colors.white),
      ),
    ),

    /*--- MENU ---*/

    menuTheme: MenuThemeData(
      style: MenuStyle(
        alignment: AlignmentDirectional.topEnd,
        surfaceTintColor: WidgetStateProperty.all(neutralColor.shade200),
        side: WidgetStateProperty.resolveWith<BorderSide>((Set<WidgetState> states) {
          return BorderSide(
            color: Colors.white,
            width: 2,
          );
        }),
        elevation: WidgetStateProperty.resolveWith<double>((Set<WidgetState> states) {
          return 0;
        }),
        backgroundColor: WidgetStateProperty.all(neutralColor.shade200),
        shape: WidgetStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        )),
      ),
    ),
  );
}
