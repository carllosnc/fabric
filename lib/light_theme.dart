import 'package:flutter/material.dart';
import './colors.dart';

neutralLightTheme({
  String? fontFamily,
}) {
  return ThemeData(
    colorSchemeSeed: neutralColor,
    scaffoldBackgroundColor: neutralColor.shade50,
    disabledColor: neutralColor.shade400,
    brightness: Brightness.light,
    fontFamily: fontFamily,

    /*--- APP BAR ---*/

    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: neutralColor.shade950,
        size: 24,
      ),
      titleTextStyle: TextStyle(
        fontFamily: fontFamily,
        color: neutralColor.shade950,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      backgroundColor: neutralColor.shade50,
      foregroundColor: neutralColor.shade950,
      surfaceTintColor: neutralColor.shade50,
      elevation: 0,
    ),

    /*--- TEXT ---*/

    textTheme: TextTheme(
      displayLarge: TextStyle(color: neutralColor.shade900, fontFamily: fontFamily, fontSize: 40, fontWeight: FontWeight.bold),
      displayMedium: TextStyle(color: neutralColor.shade900, fontFamily: fontFamily, fontSize: 38, fontWeight: FontWeight.bold),
      displaySmall: TextStyle(color: neutralColor.shade900, fontFamily: fontFamily, fontSize: 36, fontWeight: FontWeight.bold),
      headlineLarge: TextStyle(color: neutralColor.shade900, fontFamily: fontFamily, fontSize: 32, fontWeight: FontWeight.bold),
      headlineMedium: TextStyle(color: neutralColor.shade900, fontFamily: fontFamily, fontSize: 28, fontWeight: FontWeight.bold),
      headlineSmall: TextStyle(color: neutralColor.shade900, fontFamily: fontFamily, fontSize: 24, fontWeight: FontWeight.bold),
      titleLarge: TextStyle(color: neutralColor.shade900, fontFamily: fontFamily, fontSize: 22, fontWeight: FontWeight.bold),
      titleMedium: TextStyle(color: neutralColor.shade900, fontFamily: fontFamily, fontSize: 16, fontWeight: FontWeight.bold),
      titleSmall: TextStyle(color: neutralColor.shade900, fontFamily: fontFamily, fontSize: 14, fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(color: neutralColor.shade900, fontFamily: fontFamily, fontSize: 16, fontWeight: FontWeight.normal),
      bodyMedium: TextStyle(color: neutralColor.shade900, fontFamily: fontFamily, fontSize: 14, fontWeight: FontWeight.normal),
      bodySmall: TextStyle(color: neutralColor.shade900, fontFamily: fontFamily, fontSize: 12, fontWeight: FontWeight.normal),
      labelLarge: TextStyle(color: neutralColor.shade900, fontFamily: fontFamily, fontSize: 14, fontWeight: FontWeight.bold),
      labelMedium: TextStyle(color: neutralColor.shade900, fontFamily: fontFamily, fontSize: 12, fontWeight: FontWeight.bold),
      labelSmall: TextStyle(color: neutralColor.shade900, fontFamily: fontFamily, fontSize: 11, fontWeight: FontWeight.bold),
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
              decorationColor: neutralColor.shade950,
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
            return neutralColor.shade50;
          }

          return neutralColor.shade950;
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
            return TextStyle(
              fontFamily: fontFamily,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.lineThrough,
              decorationColor: neutralColor.shade950,
            );
          }
          return TextStyle(
            fontFamily: fontFamily,
            fontWeight: FontWeight.bold,
          );
        }),
        overlayColor: WidgetStateProperty.all(neutralColor.shade600),
        foregroundColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return neutralColor.shade50;
          }

          return neutralColor.shade50;
        }),
        backgroundColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return neutralColor.shade400;
          }
          return neutralColor.shade950;
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
            return TextStyle(
              fontFamily: fontFamily,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.lineThrough,
              decorationColor: neutralColor.shade950,
            );
          }
          return TextStyle(
            fontFamily: fontFamily,
            fontWeight: FontWeight.bold,
          );
        }),
        foregroundColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return neutralColor.shade500;
          }
          return neutralColor.shade950;
        }),
        backgroundColor: WidgetStateProperty.all(neutralColor.shade50),
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
            return TextStyle(
              fontFamily: fontFamily,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.lineThrough,
              decorationColor: neutralColor.shade950,
            );
          }
          return TextStyle(
            fontFamily: fontFamily,
            fontWeight: FontWeight.bold,
          );
        }),
        foregroundColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return neutralColor.shade500;
          }
          return neutralColor.shade950;
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
      titleTextStyle: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      textColor: neutralColor.shade950,
      iconColor: neutralColor.shade950,
    ),

    /*--- DRAWER ---*/

    drawerTheme: DrawerThemeData(
      backgroundColor: neutralColor.shade50,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(0),
        ),
      ),
    ),

    /*--- CHIP ---*/

    chipTheme: ChipThemeData(
      checkmarkColor: neutralColor.shade950,
      color: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return neutralColor.shade200;
        }

        return neutralColor.shade50;
      }),
      backgroundColor: neutralColor.shade50,
      brightness: Brightness.light,
      deleteIconColor: neutralColor.shade950,
      disabledColor: neutralColor.shade200,
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      iconTheme: IconThemeData(
        color: neutralColor.shade950,
        size: 16,
      ),
      side: BorderSide(
        color: neutralColor.shade400,
        width: 1,
      ),
      elevation: 0,
      secondarySelectedColor: Colors.grey.shade300,
      selectedColor: Colors.grey.shade300,
      labelStyle: TextStyle(
        fontFamily: fontFamily,
        fontSize: 13,
        color: neutralColor.shade950,
      ),
    ),

    /*--- TOOLTIP ---*/

    tooltipTheme: TooltipThemeData(
      textStyle: TextStyle(
        fontFamily: fontFamily,
        color: neutralColor.shade50,
      ),
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
        TextStyle(
          fontFamily: fontFamily,
          fontWeight: FontWeight.bold,
          color: neutralColor.shade950,
          fontSize: 14,
        ),
      ),
      textStyle: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.bold,
        color: neutralColor.shade50,
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
          return neutralColor.shade50;
        }

        return neutralColor.shade950;
      }),
      trackColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return neutralColor.shade50;
        }
        if (states.contains(WidgetState.selected)) {
          return neutralColor.shade950;
        }
        return neutralColor.shade50;
      }),
      trackOutlineColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return neutralColor.shade400;
        }
        if (states.contains(WidgetState.selected)) {
          return neutralColor.shade950;
        }
        return neutralColor.shade950;
      }),
    ),

    /*--- TEXT FIELD ---*/

    inputDecorationTheme: InputDecorationTheme(
      /* Label and hint */
      labelStyle: TextStyle(color: neutralColor.shade900, fontFamily: fontFamily),
      hintStyle: TextStyle(color: neutralColor.shade500, fontFamily: fontFamily),
      errorStyle: TextStyle(color: Colors.red, fontFamily: fontFamily),
      helperStyle: TextStyle(color: neutralColor.shade500, fontFamily: fontFamily),

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
        borderSide: BorderSide(color: neutralColor.shade950, width: 2),
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

    dialogTheme: DialogThemeData(
      surfaceTintColor: neutralColor.shade50,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.bold,
        color: neutralColor.shade950,
        fontSize: 16,
      ),
      contentTextStyle: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.normal,
        color: neutralColor.shade700,
        fontSize: 16,
      ),
      backgroundColor: neutralColor.shade50,
      insetPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),

    /*--- BOTTOM NAVIGATION BAR ---*/

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: neutralColor.shade200,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: neutralColor.shade950,
      unselectedItemColor: neutralColor.shade700,
      showUnselectedLabels: true,
      showSelectedLabels: true,
      selectedLabelStyle: TextStyle(
        fontFamily: fontFamily,
        color: neutralColor.shade950,
        fontWeight: FontWeight.bold,
      ),
      selectedIconTheme: IconThemeData(
        color: neutralColor.shade950,
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
      backgroundColor: neutralColor.shade50,
      surfaceTintColor: neutralColor.shade50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(0),
        ),
      ),
    ),

    /*--- SLIDER ---*/

    sliderTheme: SliderThemeData(
      valueIndicatorColor: neutralColor.shade950,
      valueIndicatorTextStyle: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.bold,
        color: neutralColor.shade50,
        fontSize: 12,
      ),
      activeTrackColor: neutralColor.shade950,
      inactiveTrackColor: neutralColor.shade300,
      thumbColor: neutralColor.shade950,
      overlayColor: neutralColor.shade500.withValues(alpha: 0.2),
      disabledActiveTrackColor: neutralColor.shade300,
      disabledInactiveTrackColor: neutralColor.shade200,
      disabledThumbColor: neutralColor.shade400,
      tickMarkShape: const RoundSliderTickMarkShape(),
      trackShape: const RectangularSliderTrackShape(),
    ),

    /*--- PROGRESS INDICATOR ---*/

    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: neutralColor.shade950,
      linearTrackColor: neutralColor.shade300,
      circularTrackPadding: const EdgeInsets.all(0),
    ),

    /*--- FLOATING ACTION BUTTON ---*/

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: neutralColor.shade950,
      shape: const StadiumBorder(),
      splashColor: neutralColor.shade700,
      foregroundColor: neutralColor.shade50,
    ),

    /*--- CHECKBOX ---*/

    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return neutralColor.shade950;
        }

        if (states.contains(WidgetState.disabled)) {
          return neutralColor.shade300;
        }

        return neutralColor.shade50;
      }),
      checkColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return neutralColor.shade50;
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
          return neutralColor.shade400;
        }

        return neutralColor.shade950;
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
      backgroundColor: neutralColor.shade50,
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
          borderSide: BorderSide(color: neutralColor.shade950, width: 2),
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
      dialBackgroundColor: neutralColor.shade50,
    ),

    /*--- DATEPICKER ---*/

    datePickerTheme: DatePickerThemeData(
      backgroundColor: neutralColor.shade50,
      dayBackgroundColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return neutralColor.shade950;
        }
        return neutralColor.shade50;
      }),
      dayForegroundColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return neutralColor.shade50;
        }
        return neutralColor.shade950;
      }),
      elevation: 0,
      headerBackgroundColor: neutralColor.shade50,
      headerForegroundColor: neutralColor.shade950,
      headerHeadlineStyle: TextStyle(
        fontFamily: fontFamily,
        foreground: Paint()..color = neutralColor.shade950,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      headerHelpStyle: TextStyle(
        fontFamily: fontFamily,
        color: neutralColor.shade950,
      ),
      rangePickerBackgroundColor: neutralColor.shade50,
      rangePickerSurfaceTintColor: neutralColor.shade50,
      rangePickerHeaderHeadlineStyle: TextStyle(
        fontFamily: fontFamily,
        foreground: Paint()..color = neutralColor.shade950,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      rangeSelectionBackgroundColor: neutralColor.shade200,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      surfaceTintColor: neutralColor.shade50,
      todayBackgroundColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return neutralColor.shade950;
        }
        return neutralColor.shade50;
      }),
      todayBorder: BorderSide(
        width: 1,
      ),
      todayForegroundColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return neutralColor.shade50;
        }
        return neutralColor.shade950;
      }),
      weekdayStyle: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.bold,
        color: neutralColor.shade950,
      ),
    ),

    /*--- SEGMENTED BUTTON ---*/

    segmentedButtonTheme: SegmentedButtonThemeData(
      style: ButtonStyle(
        overlayColor: WidgetStateProperty.all(neutralColor.shade300),
        surfaceTintColor: WidgetStateProperty.all(neutralColor.shade50),
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
          color: neutralColor.shade400,
          width: 1,
        )),
        foregroundColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return neutralColor.shade950;
          }
          return neutralColor.shade950;
        }),
        backgroundColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return neutralColor.shade200;
          }
          return neutralColor.shade50;
        }),
      ),
    ),

    /*--- TAB BAR ---*/

    tabBarTheme: TabBarThemeData(
      dividerColor: neutralColor.shade300,
      dividerHeight: 3,
      indicatorColor: neutralColor.shade950,
      indicatorSize: TabBarIndicatorSize.label,
      indicator: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: neutralColor.shade950,
            width: 3,
          ),
        ),
      ),
      unselectedLabelColor: neutralColor.shade500,
      overlayColor: WidgetStateColor.resolveWith((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return neutralColor.shade950;
        }
        return neutralColor.shade200;
      }),
      labelColor: neutralColor.shade950,
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
          color: neutralColor.shade50,
          width: 4,
        ),
      ),
      shape: Border(
        bottom: BorderSide(
          color: neutralColor.shade50,
          width: 4,
        ),
      ),
      clipBehavior: Clip.none,
      collapsedBackgroundColor: neutralColor.shade50,
      collapsedIconColor: neutralColor.shade950,
      iconColor: neutralColor.shade950,
      backgroundColor: neutralColor.shade200,
      textColor: neutralColor.shade950,
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
      actionTextColor: neutralColor.shade50,
      disabledActionBackgroundColor: neutralColor.shade800,
      disabledActionTextColor: neutralColor.shade400,
      actionBackgroundColor: neutralColor.shade700,
      closeIconColor: neutralColor.shade50,
      contentTextStyle: TextStyle(
        fontFamily: fontFamily,
        color: neutralColor.shade50,
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
          return neutralColor.shade950;
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
      backgroundColor: neutralColor.shade50,
      elevation: 0,
      selectedIconTheme: IconThemeData(
        color: neutralColor.shade950,
      ),
      unselectedIconTheme: IconThemeData(
        color: neutralColor.shade950,
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
        backgroundColor: WidgetStateProperty.all(neutralColor.shade50),
      ),
    ),

    /*--- MENU ---*/

    menuTheme: MenuThemeData(
      style: MenuStyle(
        alignment: AlignmentDirectional.topEnd,
        surfaceTintColor: WidgetStateProperty.all(neutralColor.shade200),
        side: WidgetStateProperty.resolveWith<BorderSide>((Set<WidgetState> states) {
          return BorderSide(
            color: neutralColor.shade50,
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

    /*--- CARD ---*/

    cardTheme: CardThemeData(
      surfaceTintColor: neutralColor.shade100,
      clipBehavior: Clip.none,
      color: neutralColor.shade100,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: neutralColor.shade300,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    ),

    /*--- NAVIGATION BAR ---*/

    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: neutralColor.shade200,
      indicatorColor: neutralColor.shade50,
      surfaceTintColor: neutralColor.shade200,
      iconTheme: WidgetStateProperty.resolveWith(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return IconThemeData(
              color: neutralColor.shade950,
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
              color: neutralColor.shade950,
            );
          }
          return TextStyle(
            fontFamily: fontFamily,
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: neutralColor.shade600,
          );
        },
      ),
      elevation: 0,
    ),

    /*--- SEARCH ANCHOR ---*/

    searchViewTheme: SearchViewThemeData(
      backgroundColor: neutralColor.shade50,
      surfaceTintColor: neutralColor.shade50,
    ),

    /*--- BANNER ---*/

    bannerTheme: MaterialBannerThemeData(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      surfaceTintColor: neutralColor.shade200,
      dividerColor: neutralColor.shade200,
      contentTextStyle: TextStyle(
        fontFamily: fontFamily,
        color: neutralColor.shade950,
      ),
      backgroundColor: neutralColor.shade200,
      elevation: 0,
    ),

    /*--- DATA TABLE ---*/

    dataTableTheme: DataTableThemeData(
      dataRowColor: WidgetStateProperty.all(neutralColor.shade50),
      headingTextStyle: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.bold,
        color: neutralColor.shade950,
      ),
      dataTextStyle: TextStyle(
        fontFamily: fontFamily,
        color: neutralColor.shade950,
      ),
      dividerThickness: 1,
      columnSpacing: 20,
    ),
  );
}
