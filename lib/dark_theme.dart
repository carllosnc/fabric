import 'package:flutter/material.dart';
import 'colors.dart';

neutralDarkTheme({
  String? fontFamily,
}) {
  return ThemeData(
    colorSchemeSeed: neutralColor,
    scaffoldBackgroundColor: neutralColor.shade900,
    disabledColor: neutralColor.shade400,
    brightness: Brightness.dark,
    fontFamily: fontFamily,

    /*--- APP BAR ---*/

    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: neutralColor.shade50,
        size: 24,
      ),
      titleTextStyle: TextStyle(
        fontFamily: fontFamily,
        color: neutralColor.shade50,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      backgroundColor: neutralColor.shade900,
      surfaceTintColor: neutralColor.shade900,
      foregroundColor: neutralColor.shade50,
      elevation: 0,
    ),

    /*--- TEXT ---*/

    textTheme: TextTheme(
      displayLarge: TextStyle(color: neutralColor.shade50, fontFamily: fontFamily, fontSize: 40, fontWeight: FontWeight.bold),
      displayMedium: TextStyle(color: neutralColor.shade50, fontFamily: fontFamily, fontSize: 38, fontWeight: FontWeight.bold),
      displaySmall: TextStyle(color: neutralColor.shade50, fontFamily: fontFamily, fontSize: 36, fontWeight: FontWeight.bold),
      headlineLarge: TextStyle(color: neutralColor.shade50, fontFamily: fontFamily, fontSize: 32, fontWeight: FontWeight.bold),
      headlineMedium: TextStyle(color: neutralColor.shade50, fontFamily: fontFamily, fontSize: 28, fontWeight: FontWeight.bold),
      headlineSmall: TextStyle(color: neutralColor.shade50, fontFamily: fontFamily, fontSize: 24, fontWeight: FontWeight.bold),
      titleLarge: TextStyle(color: neutralColor.shade50, fontFamily: fontFamily, fontSize: 22, fontWeight: FontWeight.bold),
      titleMedium: TextStyle(color: neutralColor.shade50, fontFamily: fontFamily, fontSize: 16, fontWeight: FontWeight.bold),
      titleSmall: TextStyle(color: neutralColor.shade50, fontFamily: fontFamily, fontSize: 14, fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(color: neutralColor.shade50, fontFamily: fontFamily, fontSize: 16, fontWeight: FontWeight.normal),
      bodyMedium: TextStyle(color: neutralColor.shade50, fontFamily: fontFamily, fontSize: 14, fontWeight: FontWeight.normal),
      bodySmall: TextStyle(color: neutralColor.shade50, fontFamily: fontFamily, fontSize: 12, fontWeight: FontWeight.normal),
      labelLarge: TextStyle(color: neutralColor.shade50, fontFamily: fontFamily, fontSize: 14, fontWeight: FontWeight.bold),
      labelMedium: TextStyle(color: neutralColor.shade50, fontFamily: fontFamily, fontSize: 12, fontWeight: FontWeight.bold),
      labelSmall: TextStyle(color: neutralColor.shade50, fontFamily: fontFamily, fontSize: 11, fontWeight: FontWeight.bold),
    ),

    /*--- ELEVATED BUTTON ---*/

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStateProperty.resolveWith<TextStyle>((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return TextStyle(
              fontFamily: fontFamily,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.lineThrough,
              decorationColor: neutralColor.shade50,
            );
          }
          return TextStyle(
            fontFamily: fontFamily,
            fontWeight: FontWeight.bold,
          );
        }),
        overlayColor: WidgetStateProperty.all(neutralColor.shade500),
        foregroundColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return neutralColor.shade400;
          }

          return neutralColor.shade50;
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
            return TextStyle(
              fontFamily: fontFamily,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.lineThrough,
              decorationColor: neutralColor.shade50,
            );
          }
          return TextStyle(
            fontFamily: fontFamily,
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
          return neutralColor.shade50;
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
            return TextStyle(
              fontFamily: fontFamily,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.lineThrough,
              decorationColor: neutralColor.shade50,
            );
          }
          return TextStyle(
            fontFamily: fontFamily,
            fontWeight: FontWeight.bold,
          );
        }),
        foregroundColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return neutralColor.shade400;
          }
          return neutralColor.shade50;
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
            return TextStyle(
              fontFamily: fontFamily,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.lineThrough,
              decorationColor: neutralColor.shade50,
            );
          }
          return TextStyle(
            fontFamily: fontFamily,
            fontWeight: FontWeight.bold,
          );
        }),
        foregroundColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return neutralColor.shade400;
          }
          return neutralColor.shade50;
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
      titleTextStyle: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      textColor: neutralColor.shade50,
      iconColor: neutralColor.shade50,
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
      checkmarkColor: neutralColor.shade50,
      backgroundColor: neutralColor.shade900,
      brightness: Brightness.dark,
      deleteIconColor: neutralColor.shade50,
      disabledColor: neutralColor.shade600,
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      iconTheme: IconThemeData(
        color: neutralColor.shade50,
        size: 16,
      ),
      side: BorderSide(
        color: neutralColor.shade500,
        width: 1,
      ),
      elevation: 0,
      secondarySelectedColor: Colors.grey.shade800,
      selectedColor: Colors.grey.shade800,
      labelStyle: TextStyle(
        fontFamily: fontFamily,
        fontSize: 13,
        color: neutralColor.shade50,
      ),
    ),

    /*--- TOOLTIP ---*/

    tooltipTheme: TooltipThemeData(
      textStyle: TextStyle(
        fontFamily: fontFamily,
        color: Colors.black,
      ),
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
        TextStyle(
          fontFamily: fontFamily,
          fontWeight: FontWeight.bold,
          color: neutralColor.shade50,
          fontSize: 14,
        ),
      ),
      textStyle: TextStyle(
        fontFamily: fontFamily,
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

        return neutralColor.shade50;
      }),
      trackColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return neutralColor.shade900;
        }
        if (states.contains(WidgetState.selected)) {
          return neutralColor.shade50;
        }
        return neutralColor.shade900;
      }),
      trackOutlineColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return neutralColor.shade500;
        }
        if (states.contains(WidgetState.selected)) {
          return neutralColor.shade50;
        }
        return neutralColor.shade50;
      }),
    ),

    /*--- TEXT FIELD ---*/

    inputDecorationTheme: InputDecorationTheme(
      /* Label and hint */
      labelStyle: TextStyle(color: neutralColor.shade50, fontFamily: fontFamily),
      hintStyle: TextStyle(color: neutralColor.shade500, fontFamily: fontFamily),
      errorStyle: TextStyle(color: Colors.red.shade200, fontFamily: fontFamily),
      helperStyle: TextStyle(color: neutralColor.shade600, fontFamily: fontFamily),

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
        borderSide: BorderSide(color: neutralColor.shade50, width: 2),
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

    dialogTheme: DialogThemeData(
      barrierColor: neutralColor.shade600.withValues(alpha: 0.7),
      surfaceTintColor: neutralColor.shade900,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.bold,
        color: neutralColor.shade50,
        fontSize: 16,
      ),
      contentTextStyle: TextStyle(
        fontFamily: fontFamily,
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
      selectedItemColor: neutralColor.shade50,
      unselectedItemColor: neutralColor.shade500,
      showUnselectedLabels: true,
      showSelectedLabels: true,
      selectedLabelStyle: TextStyle(
        fontFamily: fontFamily,
        color: neutralColor.shade50,
        fontWeight: FontWeight.bold,
      ),
      selectedIconTheme: IconThemeData(
        color: neutralColor.shade50,
      ),
      unselectedLabelStyle: TextStyle(
        fontFamily: fontFamily,
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
      valueIndicatorColor: neutralColor.shade50,
      valueIndicatorTextStyle: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontSize: 12,
      ),
      activeTrackColor: neutralColor.shade50,
      inactiveTrackColor: neutralColor.shade700,
      thumbColor: neutralColor.shade50,
      overlayColor: neutralColor.shade50.withValues(alpha: 0.2),
      disabledActiveTrackColor: neutralColor.shade700,
      disabledInactiveTrackColor: neutralColor.shade800,
      disabledThumbColor: neutralColor.shade600,
      tickMarkShape: const RoundSliderTickMarkShape(),
      trackShape: const RectangularSliderTrackShape(),
    ),

    /*--- PROGRESS INDICATOR ---*/

    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: neutralColor.shade50,
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
          return neutralColor.shade50;
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

        return neutralColor.shade50;
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
        return neutralColor.shade50;
      }),
      overlayColor: WidgetStateProperty.all(neutralColor.shade400),
    ),

    /*--- TEXT SELECTION ---*/

    textSelectionTheme: TextSelectionThemeData(
      cursorColor: neutralColor.shade50,
      selectionColor: neutralColor.shade700,
      selectionHandleColor: neutralColor.shade50,
    ),

    /*--- TIMEPICKER ---*/

    timePickerTheme: TimePickerThemeData(
      backgroundColor: Colors.black,
      elevation: 0,
      dialHandColor: neutralColor.shade50,
      hourMinuteColor: neutralColor.shade700,
      dayPeriodColor: neutralColor.shade700,
      hourMinuteTextColor: neutralColor.shade50,
      dayPeriodTextColor: neutralColor.shade50,
      entryModeIconColor: neutralColor.shade50,
      helpTextStyle: TextStyle(color: neutralColor.shade50),
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
          borderSide: BorderSide(color: neutralColor.shade50, width: 2),
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
          return neutralColor.shade50;
        }
        return Colors.black;
      }),
      dayForegroundColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return Colors.black;
        }
        return neutralColor.shade50;
      }),
      elevation: 0,
      headerBackgroundColor: Colors.black,
      headerForegroundColor: neutralColor.shade50,
      headerHeadlineStyle: TextStyle(
        fontFamily: fontFamily,
        foreground: Paint()..color = neutralColor.shade50,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      headerHelpStyle: TextStyle(
        fontFamily: fontFamily,
        color: neutralColor.shade50,
      ),
      rangePickerBackgroundColor: Colors.black,
      rangePickerSurfaceTintColor: Colors.black,
      rangePickerHeaderHeadlineStyle: TextStyle(
        fontFamily: fontFamily,
        foreground: Paint()..color = neutralColor.shade50,
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
          return neutralColor.shade50;
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
        return neutralColor.shade50;
      }),
      weekdayStyle: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.bold,
        color: neutralColor.shade50,
      ),
    ),

    /*--- SEGMENTED BUTTON ---*/

    segmentedButtonTheme: SegmentedButtonThemeData(
      style: ButtonStyle(
        overlayColor: WidgetStateProperty.all(neutralColor.shade700),
        surfaceTintColor: WidgetStateProperty.all(Colors.black),
        textStyle: WidgetStateProperty.resolveWith<TextStyle>((Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return TextStyle(
              fontFamily: fontFamily,
              fontWeight: FontWeight.bold,
            );
          }
          return TextStyle(
            fontFamily: fontFamily,
            fontWeight: FontWeight.normal,
          );
        }),
        side: WidgetStateProperty.all(BorderSide(
          color: neutralColor.shade600,
          width: 1,
        )),
        foregroundColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return neutralColor.shade50;
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

    tabBarTheme: TabBarThemeData(
      dividerColor: neutralColor.shade700,
      dividerHeight: 3,
      indicatorColor: neutralColor.shade50,
      indicatorSize: TabBarIndicatorSize.label,
      indicator: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: neutralColor.shade50,
            width: 3,
          ),
        ),
      ),
      unselectedLabelColor: neutralColor.shade500,
      overlayColor: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return neutralColor.shade50;
        }
        return neutralColor.shade700;
      }),
      labelColor: neutralColor.shade50,
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
      collapsedIconColor: neutralColor.shade50,
      iconColor: neutralColor.shade50,
      backgroundColor: neutralColor.shade800,
      textColor: neutralColor.shade50,
      childrenPadding: const EdgeInsets.only(
        bottom: 15,
        top: 0,
        left: 20,
        right: 20,
      ),
    ),

    /*--- SNACKBAR ---*/

    snackBarTheme: SnackBarThemeData(
      backgroundColor: neutralColor.shade50,
      actionTextColor: Colors.black,
      disabledActionBackgroundColor: neutralColor.shade50,
      disabledActionTextColor: neutralColor.shade500,
      actionBackgroundColor: neutralColor.shade300,
      closeIconColor: Colors.black,
      contentTextStyle: TextStyle(
        fontFamily: fontFamily,
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
          return neutralColor.shade50;
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
      textColor: neutralColor.shade50,
    ),

    /*--- NAVIGATION RAIL ---*/

    navigationRailTheme: NavigationRailThemeData(
      backgroundColor: neutralColor.shade900,
      elevation: 0,
      selectedIconTheme: IconThemeData(
        color: neutralColor.shade50,
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

    cardTheme: CardThemeData(
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

    /*--- NAVIGATION BAR ---*/

    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: Colors.black,
      indicatorColor: neutralColor.shade700,
      surfaceTintColor: Colors.black,
      iconTheme: WidgetStateProperty.resolveWith(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return IconThemeData(
              color: neutralColor.shade50,
            );
          }

          return IconThemeData(
            color: neutralColor.shade500,
          );
        },
      ),
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      labelTextStyle: WidgetStateProperty.resolveWith(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return TextStyle(
              fontFamily: fontFamily,
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: neutralColor.shade50,
            );
          }
          return TextStyle(
            fontFamily: fontFamily,
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: neutralColor.shade500,
          );
        },
      ),
      elevation: 0,
    ),

    /*--- SEARCH ANCHOR ---*/

    searchViewTheme: SearchViewThemeData(
      backgroundColor: Colors.black,
      surfaceTintColor: Colors.black,
    ),

    /*--- BANNER ---*/

    bannerTheme: MaterialBannerThemeData(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      surfaceTintColor: neutralColor.shade800,
      dividerColor: neutralColor.shade800,
      contentTextStyle: TextStyle(
        fontFamily: fontFamily,
        color: neutralColor.shade50,
      ),
      backgroundColor: neutralColor.shade800,
      elevation: 0,
    ),

    /*--- DATA TABLE ---*/

    dataTableTheme: DataTableThemeData(
      dataRowColor: WidgetStateProperty.all(neutralColor.shade900),
      headingTextStyle: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.bold,
        color: neutralColor.shade50,
      ),
      dataTextStyle: TextStyle(
        fontFamily: fontFamily,
        color: neutralColor.shade50,
      ),
      dividerThickness: 1,
      columnSpacing: 20,
    ),
  );
}
