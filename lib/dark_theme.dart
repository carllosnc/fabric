import 'package:flutter/material.dart';
import 'colors.dart';

neutralDarkTheme() {
  return ThemeData(
    colorSchemeSeed: Colors.grey,
    scaffoldBackgroundColor: neutralColor.shade900,
    disabledColor: neutralColor.shade400,
    brightness: Brightness.dark,

    /*--- APP BAR ---*/

    appBarTheme: AppBarTheme(
      iconTheme: const IconThemeData(
        color: Colors.white,
        size: 24,
      ),
      titleTextStyle: const TextStyle(
        fontStyle: FontStyle.normal,
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      backgroundColor: neutralColor.shade900,
      surfaceTintColor: neutralColor.shade900,
      foregroundColor: Colors.white,
      elevation: 0,
    ),

    /*--- TEXT ---*/

    textTheme: TextTheme(
      displayLarge: TextStyle(color: neutralColor.shade100),
      displayMedium: TextStyle(color: neutralColor.shade100),
      displaySmall: TextStyle(color: neutralColor.shade100),
      headlineLarge: TextStyle(color: neutralColor.shade100),
      headlineMedium: TextStyle(color: neutralColor.shade100),
      headlineSmall: TextStyle(color: neutralColor.shade100),
      titleLarge: TextStyle(color: neutralColor.shade100),
      titleMedium: TextStyle(color: neutralColor.shade100),
      titleSmall: TextStyle(color: neutralColor.shade100),
      bodyLarge: TextStyle(color: neutralColor.shade100),
      bodyMedium: TextStyle(color: neutralColor.shade100),
      labelLarge: TextStyle(color: neutralColor.shade100),
      bodySmall: TextStyle(color: neutralColor.shade100),
      labelMedium: TextStyle(color: neutralColor.shade100),
      labelSmall: TextStyle(color: neutralColor.shade100),
    ),

    /*--- ELEVATED BUTTON ---*/

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStateProperty.resolveWith<TextStyle>((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return const TextStyle(
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.lineThrough,
              decorationColor: Colors.white,
            );
          }
          return const TextStyle(
            fontWeight: FontWeight.bold,
          );
        }),
        overlayColor: WidgetStateProperty.all(neutralColor.shade500),
        foregroundColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return neutralColor.shade400;
          }

          return Colors.white;
        }),
        backgroundColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return neutralColor.shade600;
          }
          return neutralColor.shade700;
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
              decorationColor: Colors.white,
            );
          }
          return const TextStyle(
            fontWeight: FontWeight.bold,
          );
        }),
        overlayColor: WidgetStateProperty.all(neutralColor.shade400),
        foregroundColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return neutralColor.shade400;
          }

          return Colors.black;
        }),
        backgroundColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return neutralColor.shade600;
          }
          return Colors.white;
        }),
      ),
    ),

    /*--- OUTLINED BUTTON ---*/

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        side: WidgetStateProperty.resolveWith<BorderSide>((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return BorderSide(
              color: neutralColor.shade700,
              width: 1,
            );
          }
          return BorderSide(
            color: neutralColor.shade400,
            width: 1,
          );
        }),
        overlayColor: WidgetStateProperty.all(
          neutralColor.shade700,
        ),
        textStyle: WidgetStateProperty.resolveWith<TextStyle>((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return const TextStyle(
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.lineThrough,
              decorationColor: Colors.white,
            );
          }
          return const TextStyle(
            fontWeight: FontWeight.bold,
          );
        }),
        foregroundColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return neutralColor.shade400;
          }
          return Colors.white;
        }),
        backgroundColor: WidgetStateProperty.all(Colors.transparent),
      ),
    ),

    /*--- TEXT BUTTON ---*/

    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        overlayColor: WidgetStateProperty.all(
          neutralColor.shade700,
        ),
        textStyle: WidgetStateProperty.resolveWith<TextStyle>((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return const TextStyle(
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.lineThrough,
              decorationColor: Colors.white,
            );
          }
          return const TextStyle(
            fontWeight: FontWeight.bold,
          );
        }),
        foregroundColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return neutralColor.shade400;
          }
          return Colors.white;
        }),
      ),
    ),

    /*--- DIVIDER ---*/

    dividerTheme: DividerThemeData(
      thickness: 1,
      space: 0,
      color: neutralColor.shade700,
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
      textColor: Colors.white,
      iconColor: Colors.white,
    ),

    /*--- DRAWER ---*/

    drawerTheme: DrawerThemeData(
      backgroundColor: Colors.black,
      scrimColor: neutralColor.shade600.withValues(alpha: 0.7),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(0),
        ),
      ),
    ),

    /*--- CHIP ---*/

    chipTheme: ChipThemeData(
      checkmarkColor: Colors.white,
      backgroundColor: neutralColor.shade900,
      brightness: Brightness.dark,
      deleteIconColor: Colors.white,
      disabledColor: neutralColor.shade600,
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      iconTheme: const IconThemeData(
        color: Colors.white,
        size: 16,
      ),
      side: BorderSide(
        color: neutralColor.shade500,
        width: 1,
      ),
      elevation: 0,
      secondarySelectedColor: Colors.grey.shade800,
      secondaryLabelStyle: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      selectedColor: Colors.grey.shade800,
      labelStyle: const TextStyle(
        fontSize: 13,
        color: Colors.white,
      ),
    ),

    /*--- TOOLTIP ---*/

    tooltipTheme: TooltipThemeData(
      textStyle: TextStyle(color: neutralColor.shade900),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(6),
      ),
    ),

    /*--- POPUP MENU ---*/

    popupMenuTheme: PopupMenuThemeData(
      color: Colors.grey.shade800,
      elevation: 0,
      labelTextStyle: WidgetStateProperty.all(
        const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 14,
        ),
      ),
      textStyle: TextStyle(
        fontWeight: FontWeight.bold,
        color: neutralColor.shade900,
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
          return neutralColor.shade500;
        }
        if (states.contains(WidgetState.selected)) {
          return neutralColor.shade900;
        }

        return Colors.white;
      }),
      trackColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return neutralColor.shade900;
        }
        if (states.contains(WidgetState.selected)) {
          return Colors.white;
        }
        return neutralColor.shade900;
      }),
      trackOutlineColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return neutralColor.shade500;
        }
        if (states.contains(WidgetState.selected)) {
          return Colors.white;
        }
        return Colors.white;
      }),
    ),

    /*--- TEXT FIELD ---*/

    inputDecorationTheme: InputDecorationTheme(
      /* Label and hint */
      labelStyle: TextStyle(color: Colors.white),
      hintStyle: TextStyle(color: neutralColor.shade500),
      errorStyle: TextStyle(color: Colors.red.shade200),
      helperStyle: TextStyle(color: neutralColor.shade600),

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
        borderSide: BorderSide(color: Colors.white, width: 2),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: neutralColor.shade700),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.red.shade200, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.red.shade200, width: 2),
      ),
    ),

    /*--- DIALOG ---*/

    dialogTheme: DialogTheme(
      barrierColor: neutralColor.shade600.withValues(alpha: 0.7),
      surfaceTintColor: neutralColor.shade900,
      elevation: 0,
      titleTextStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontSize: 16,
      ),
      contentTextStyle: TextStyle(
        fontWeight: FontWeight.normal,
        color: neutralColor.shade400,
        fontSize: 16,
      ),
      backgroundColor: Colors.black,
      insetPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),

    /*--- BOTTOM NAVIGATION BAR ---*/

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.white,
      unselectedItemColor: neutralColor.shade500,
      showUnselectedLabels: true,
      showSelectedLabels: true,
      selectedLabelStyle: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      selectedIconTheme: const IconThemeData(
        color: Colors.white,
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
      backgroundColor: Colors.black,
      surfaceTintColor: Colors.black,
      modalBarrierColor: neutralColor.shade600.withValues(alpha: 0.7),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(0),
        ),
      ),
    ),

    /*--- SLIDER ---*/

    sliderTheme: SliderThemeData(
      valueIndicatorColor: Colors.white,
      valueIndicatorTextStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontSize: 12,
      ),
      activeTrackColor: Colors.white,
      inactiveTrackColor: neutralColor.shade700,
      thumbColor: Colors.white,
      overlayColor: Colors.white.withValues(alpha: 0.2),
      disabledActiveTrackColor: neutralColor.shade700,
      disabledInactiveTrackColor: neutralColor.shade800,
      disabledThumbColor: neutralColor.shade600,
      tickMarkShape: const RoundSliderTickMarkShape(),
      trackShape: const RectangularSliderTrackShape(),
    ),

    /*--- PROGRESS INDICATOR ---*/

    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: Colors.white,
      linearTrackColor: neutralColor.shade700,
      circularTrackPadding: const EdgeInsets.all(0),
    ),

    /*--- FLOATING ACTION BUTTON ---*/

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: neutralColor.shade200,
      shape: const StadiumBorder(),
      splashColor: neutralColor.shade400,
      foregroundColor: Colors.black,
    ),

    /*--- CHECKBOX ---*/

    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return Colors.white;
        }

        if (states.contains(WidgetState.disabled)) {
          return neutralColor.shade700;
        }

        return Colors.transparent;
      }),
      checkColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return Colors.black;
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
          return neutralColor.shade500;
        }
        return Colors.white;
      }),
      overlayColor: WidgetStateProperty.all(neutralColor.shade400),
    ),

    /*--- TEXT SELECTION ---*/

    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Colors.white,
      selectionColor: neutralColor.shade700,
      selectionHandleColor: Colors.white,
    ),

    /*--- TIMEPICKER ---*/

    timePickerTheme: TimePickerThemeData(
      backgroundColor: Colors.black,
      elevation: 0,
      dialHandColor: Colors.white,
      hourMinuteColor: neutralColor.shade700,
      dayPeriodColor: neutralColor.shade700,
      hourMinuteTextColor: Colors.white,
      dayPeriodTextColor: Colors.white,
      entryModeIconColor: Colors.white,
      helpTextStyle: TextStyle(color: Colors.white),
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
          borderSide: BorderSide(color: Colors.white, width: 2),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: neutralColor.shade700,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.red.shade200, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.red.shade200, width: 2),
        ),
      ),
      dayPeriodBorderSide: BorderSide(
        color: neutralColor.shade600,
        width: 1,
      ),
      dialBackgroundColor: Colors.black,
    ),

    /*--- DATE PICKER ---*/

    datePickerTheme: DatePickerThemeData(
      backgroundColor: Colors.black,
      dayBackgroundColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return Colors.white;
        }
        return Colors.black;
      }),
      dayForegroundColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return Colors.black;
        }
        return Colors.white;
      }),
      elevation: 0,
      headerBackgroundColor: Colors.black,
      headerForegroundColor: Colors.white,
      headerHeadlineStyle: TextStyle(
        foreground: Paint()..color = Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      headerHelpStyle: TextStyle(
        color: Colors.white,
      ),
      rangePickerBackgroundColor: Colors.black,
      rangePickerSurfaceTintColor: Colors.black,
      rangePickerHeaderHeadlineStyle: TextStyle(
        foreground: Paint()..color = Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      rangeSelectionBackgroundColor: neutralColor.shade800,
      rangePickerHeaderForegroundColor: neutralColor.shade300,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      surfaceTintColor: Colors.black,
      todayBackgroundColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return Colors.white;
        }
        return Colors.black;
      }),
      todayBorder: BorderSide(
        color: neutralColor.shade500,
        width: 1,
      ),
      todayForegroundColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return Colors.black;
        }
        return Colors.white;
      }),
      weekdayStyle: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),

    /*--- SEGMENTEDBUTTON ---*/

    segmentedButtonTheme: SegmentedButtonThemeData(
      style: ButtonStyle(
        overlayColor: WidgetStateProperty.all(neutralColor.shade700),
        surfaceTintColor: WidgetStateProperty.all(Colors.black),
        textStyle: WidgetStateProperty.resolveWith<TextStyle>((Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return const TextStyle(
              fontWeight: FontWeight.bold,
            );
          }
          return TextStyle(
            fontWeight: FontWeight.normal,
          );
        }),
        side: WidgetStateProperty.all(BorderSide(
          color: neutralColor.shade600,
          width: 1,
        )),
        foregroundColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return Colors.white;
          }
          return neutralColor.shade400;
        }),
        backgroundColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return neutralColor.shade800;
          }
          return Colors.black;
        }),
      ),
    ),

    /*--- TAB BAR ---*/

    tabBarTheme: TabBarTheme(
      dividerColor: neutralColor.shade700,
      dividerHeight: 3,
      indicatorColor: Colors.white,
      indicatorSize: TabBarIndicatorSize.label,
      indicator: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.white,
            width: 3,
          ),
        ),
      ),
      unselectedLabelColor: neutralColor.shade500,
      overlayColor: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return Colors.white;
        }
        return neutralColor.shade700;
      }),
      labelColor: Colors.white,
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
          color: neutralColor.shade900,
          width: 4,
        ),
      ),
      shape: Border(
        bottom: BorderSide(
          color: neutralColor.shade900,
          width: 4,
        ),
      ),
      clipBehavior: Clip.none,
      collapsedBackgroundColor: neutralColor.shade900,
      collapsedIconColor: Colors.white,
      iconColor: Colors.white,
      backgroundColor: neutralColor.shade800,
      textColor: Colors.white,
      childrenPadding: const EdgeInsets.only(
        bottom: 15,
        top: 0,
        left: 20,
        right: 20,
      ),
    ),

    /*--- SNACKBAR ---*/

    snackBarTheme: SnackBarThemeData(
      backgroundColor: Colors.white,
      actionTextColor: Colors.black,
      disabledActionBackgroundColor: Colors.white,
      disabledActionTextColor: neutralColor.shade500,
      actionBackgroundColor: neutralColor.shade300,
      closeIconColor: Colors.black,
      contentTextStyle: const TextStyle(
        color: Colors.black,
      ),
      elevation: 0,
    ),

    /*--- ICON BUTTON ---*/

    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        overlayColor: WidgetStateProperty.all(neutralColor.shade700),
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
          return Colors.white;
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
      backgroundColor: neutralColor.shade900,
      elevation: 0,
      selectedIconTheme: const IconThemeData(
        color: Colors.white,
      ),
      unselectedIconTheme: IconThemeData(
        color: neutralColor.shade500,
      ),
      indicatorColor: neutralColor.shade700,
      labelType: NavigationRailLabelType.none,
    ),

    /*--- NAVIGATION BAR ---*/

    menuBarTheme: MenuBarThemeData(
      style: MenuStyle(
        elevation: WidgetStateProperty.resolveWith<double>((Set<WidgetState> states) {
          return 0;
        }),
        backgroundColor: WidgetStateProperty.all(neutralColor.shade900),
      ),
    ),

    /*--- MENU ---*/

    menuTheme: MenuThemeData(
      style: MenuStyle(
        alignment: AlignmentDirectional.topEnd,
        surfaceTintColor: WidgetStateProperty.all(Colors.black),
        side: WidgetStateProperty.resolveWith<BorderSide>((Set<WidgetState> states) {
          return BorderSide(
            color: neutralColor.shade900,
            width: 2,
          );
        }),
        elevation: WidgetStateProperty.resolveWith<double>((Set<WidgetState> states) {
          return 0;
        }),
        backgroundColor: WidgetStateProperty.all(neutralColor.shade700),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    ),

    /*--- CARD ---*/

    cardTheme: CardTheme(
      surfaceTintColor: Colors.black,
      clipBehavior: Clip.none,
      color: Colors.black,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: neutralColor.shade700,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}
