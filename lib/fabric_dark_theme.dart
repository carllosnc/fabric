import 'package:flutter/material.dart';
import 'fabric_swatch.dart';

fabricDarkTheme({
  required FabricSwatch mainColor,
  String? fontFamily,
}) {
  return ThemeData(
    colorSchemeSeed: mainColor,
    scaffoldBackgroundColor: mainColor.shade900,
    disabledColor: mainColor.shade400,
    brightness: Brightness.dark,
    fontFamily: fontFamily,
    splashColor: mainColor.shade700,

    /*--- APP BAR ---*/

    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: mainColor.shade50,
        size: 24,
      ),
      titleTextStyle: TextStyle(
        fontFamily: fontFamily,
        color: mainColor.shade50,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      backgroundColor: mainColor.shade900,
      surfaceTintColor: mainColor.shade900,
      foregroundColor: mainColor.shade50,
      elevation: 0,
    ),

    /*--- TEXT ---*/

    textTheme: TextTheme(
      displayLarge: TextStyle(color: mainColor.shade50, fontFamily: fontFamily, fontSize: 40, fontWeight: FontWeight.bold),
      displayMedium: TextStyle(color: mainColor.shade50, fontFamily: fontFamily, fontSize: 38, fontWeight: FontWeight.bold),
      displaySmall: TextStyle(color: mainColor.shade50, fontFamily: fontFamily, fontSize: 36, fontWeight: FontWeight.bold),
      headlineLarge: TextStyle(color: mainColor.shade50, fontFamily: fontFamily, fontSize: 32, fontWeight: FontWeight.bold),
      headlineMedium: TextStyle(color: mainColor.shade50, fontFamily: fontFamily, fontSize: 28, fontWeight: FontWeight.bold),
      headlineSmall: TextStyle(color: mainColor.shade50, fontFamily: fontFamily, fontSize: 24, fontWeight: FontWeight.bold),
      titleLarge: TextStyle(color: mainColor.shade50, fontFamily: fontFamily, fontSize: 22, fontWeight: FontWeight.bold),
      titleMedium: TextStyle(color: mainColor.shade50, fontFamily: fontFamily, fontSize: 16, fontWeight: FontWeight.bold),
      titleSmall: TextStyle(color: mainColor.shade50, fontFamily: fontFamily, fontSize: 14, fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(color: mainColor.shade50, fontFamily: fontFamily, fontSize: 16, fontWeight: FontWeight.normal),
      bodyMedium: TextStyle(color: mainColor.shade50, fontFamily: fontFamily, fontSize: 14, fontWeight: FontWeight.normal),
      bodySmall: TextStyle(color: mainColor.shade50, fontFamily: fontFamily, fontSize: 12, fontWeight: FontWeight.normal),
      labelLarge: TextStyle(color: mainColor.shade50, fontFamily: fontFamily, fontSize: 14, fontWeight: FontWeight.bold),
      labelMedium: TextStyle(color: mainColor.shade50, fontFamily: fontFamily, fontSize: 12, fontWeight: FontWeight.bold),
      labelSmall: TextStyle(color: mainColor.shade50, fontFamily: fontFamily, fontSize: 11, fontWeight: FontWeight.bold),
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
              decorationColor: mainColor.shade50,
            );
          }
          return TextStyle(
            fontFamily: fontFamily,
            fontWeight: FontWeight.bold,
          );
        }),
        overlayColor: WidgetStateProperty.all(mainColor.shade500),
        foregroundColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return mainColor.shade400;
          }

          return mainColor.shade50;
        }),
        backgroundColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return mainColor.shade600;
          }
          return mainColor.shade700;
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
              decorationColor: mainColor.shade50,
            );
          }
          return TextStyle(
            fontFamily: fontFamily,
            fontWeight: FontWeight.bold,
          );
        }),
        overlayColor: WidgetStateProperty.all(mainColor.shade400),
        foregroundColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return mainColor.shade400;
          }

          return mainColor.shade950;
        }),
        backgroundColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return mainColor.shade600;
          }
          return mainColor.shade50;
        }),
      ),
    ),

    /*--- OUTLINED BUTTON ---*/

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        side: WidgetStateProperty.resolveWith<BorderSide>((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return BorderSide(
              color: mainColor.shade700,
              width: 1,
            );
          }
          return BorderSide(
            color: mainColor.shade400,
            width: 1,
          );
        }),
        overlayColor: WidgetStateProperty.all(
          mainColor.shade700,
        ),
        textStyle: WidgetStateProperty.resolveWith<TextStyle>((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return TextStyle(
              fontFamily: fontFamily,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.lineThrough,
              decorationColor: mainColor.shade50,
            );
          }
          return TextStyle(
            fontFamily: fontFamily,
            fontWeight: FontWeight.bold,
          );
        }),
        foregroundColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return mainColor.shade400;
          }
          return mainColor.shade50;
        }),
        backgroundColor: WidgetStateProperty.all(Colors.transparent),
      ),
    ),

    /*--- TEXT BUTTON ---*/

    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        overlayColor: WidgetStateProperty.all(
          mainColor.shade700,
        ),
        textStyle: WidgetStateProperty.resolveWith<TextStyle>((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return TextStyle(
              fontFamily: fontFamily,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.lineThrough,
              decorationColor: mainColor.shade50,
            );
          }
          return TextStyle(
            fontFamily: fontFamily,
            fontWeight: FontWeight.bold,
          );
        }),
        foregroundColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return mainColor.shade400;
          }
          return mainColor.shade50;
        }),
      ),
    ),

    /*--- DIVIDER ---*/

    dividerTheme: DividerThemeData(
      thickness: 1,
      space: 0,
      color: mainColor.shade700,
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
      textColor: mainColor.shade50,
      iconColor: mainColor.shade50,
    ),

    /*--- DRAWER ---*/

    drawerTheme: DrawerThemeData(
      backgroundColor: mainColor.shade950,
      scrimColor: mainColor.shade600.withValues(alpha: 0.7),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(0),
        ),
      ),
    ),

    /*--- CHIP ---*/

    chipTheme: ChipThemeData(
      checkmarkColor: mainColor.shade50,
      backgroundColor: mainColor.shade900,
      brightness: Brightness.dark,
      deleteIconColor: mainColor.shade50,
      disabledColor: mainColor.shade800,
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      iconTheme: IconThemeData(
        color: mainColor.shade50,
        size: 16,
      ),
      side: BorderSide(
        color: mainColor.shade500,
        width: 1,
      ),
      elevation: 0,
      secondarySelectedColor: mainColor.shade800,
      selectedColor: mainColor.shade700,
      labelStyle: TextStyle(
        fontFamily: fontFamily,
        fontSize: 13,
        color: mainColor.shade50,
      ),
    ),

    /*--- TOOLTIP ---*/

    tooltipTheme: TooltipThemeData(
      textStyle: TextStyle(
        fontFamily: fontFamily,
        color: mainColor.shade950,
      ),
      decoration: BoxDecoration(
        color: mainColor.shade300,
        borderRadius: BorderRadius.circular(6),
      ),
    ),

    /*--- POPUP MENU ---*/

    popupMenuTheme: PopupMenuThemeData(
      color: mainColor.shade700,
      elevation: 0,
      surfaceTintColor: mainColor.shade700,
      iconColor: mainColor.shade50,
      iconSize: 16,
      labelTextStyle: WidgetStateProperty.all(
        TextStyle(
          fontFamily: fontFamily,
          fontWeight: FontWeight.bold,
          color: mainColor.shade50,
          fontSize: 14,
        ),
      ),
      textStyle: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.bold,
        color: mainColor.shade950,
        fontSize: 15,
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
          return mainColor.shade500;
        }
        if (states.contains(WidgetState.selected)) {
          return mainColor.shade900;
        }

        return mainColor.shade50;
      }),
      trackColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return mainColor.shade900;
        }
        if (states.contains(WidgetState.selected)) {
          return mainColor.shade50;
        }
        return mainColor.shade900;
      }),
      trackOutlineColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return mainColor.shade500;
        }
        if (states.contains(WidgetState.selected)) {
          return mainColor.shade50;
        }
        return mainColor.shade50;
      }),
    ),

    /*--- TEXT FIELD ---*/

    inputDecorationTheme: InputDecorationTheme(
      /* Label and hint */
      labelStyle: TextStyle(color: mainColor.shade50, fontFamily: fontFamily),
      hintStyle: TextStyle(color: mainColor.shade500, fontFamily: fontFamily),
      errorStyle: TextStyle(color: Colors.red.shade200, fontFamily: fontFamily),
      helperStyle: TextStyle(color: mainColor.shade600, fontFamily: fontFamily),

      /* padding */
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),

      /* Prefix and suffix */
      suffixIconColor: mainColor.shade500,
      prefixIconColor: mainColor.shade500,

      /* Border */
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
        borderSide: BorderSide(color: mainColor.shade50, width: 2),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: mainColor.shade700),
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
      barrierColor: mainColor.shade600.withValues(alpha: 0.7),
      surfaceTintColor: mainColor.shade900,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.bold,
        color: mainColor.shade50,
        fontSize: 16,
      ),
      contentTextStyle: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.normal,
        color: mainColor.shade400,
        fontSize: 16,
      ),
      backgroundColor: mainColor.shade950,
      insetPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),

    /*--- BOTTOM NAVIGATION BAR ---*/

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: mainColor.shade950,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: mainColor.shade50,
      unselectedItemColor: mainColor.shade500,
      showUnselectedLabels: true,
      showSelectedLabels: true,
      selectedLabelStyle: TextStyle(
        fontFamily: fontFamily,
        color: mainColor.shade50,
        fontWeight: FontWeight.bold,
      ),
      selectedIconTheme: IconThemeData(
        color: mainColor.shade50,
      ),
      unselectedLabelStyle: TextStyle(
        fontFamily: fontFamily,
        color: mainColor.shade500,
      ),
      unselectedIconTheme: IconThemeData(
        color: mainColor.shade500,
      ),
      elevation: 0,
    ),

    /*--- BOTTOM SHEET ---*/

    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: mainColor.shade950,
      surfaceTintColor: mainColor.shade950,
      modalBarrierColor: mainColor.shade600.withValues(alpha: 0.7),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(0),
        ),
      ),
    ),

    /*--- SLIDER ---*/

    sliderTheme: SliderThemeData(
      valueIndicatorColor: mainColor.shade50,
      valueIndicatorTextStyle: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.bold,
        color: mainColor.shade950,
        fontSize: 12,
      ),
      activeTrackColor: mainColor.shade50,
      inactiveTrackColor: mainColor.shade700,
      thumbColor: mainColor.shade50,
      overlayColor: mainColor.shade50.withValues(alpha: 0.2),
      disabledActiveTrackColor: mainColor.shade700,
      disabledInactiveTrackColor: mainColor.shade800,
      disabledThumbColor: mainColor.shade600,
      tickMarkShape: const RoundSliderTickMarkShape(),
      trackShape: const RectangularSliderTrackShape(),
    ),

    /*--- PROGRESS INDICATOR ---*/

    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: mainColor.shade50,
      linearTrackColor: mainColor.shade700,
      circularTrackPadding: const EdgeInsets.all(0),
    ),

    /*--- FLOATING ACTION BUTTON ---*/

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: mainColor.shade50,
      shape: const StadiumBorder(),
      splashColor: mainColor.shade400,
      foregroundColor: mainColor.shade950,
    ),

    /*--- CHECKBOX ---*/

    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return mainColor.shade50;
        }

        if (states.contains(WidgetState.disabled)) {
          return mainColor.shade700;
        }

        return Colors.transparent;
      }),
      checkColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return mainColor.shade950;
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
    ),

    /*--- RADIOBUTTON ---*/

    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return mainColor.shade500;
        }
        return mainColor.shade50;
      }),
      overlayColor: WidgetStateProperty.all(mainColor.shade400),
    ),

    /*--- TEXT SELECTION ---*/

    textSelectionTheme: TextSelectionThemeData(
      cursorColor: mainColor.shade50,
      selectionColor: mainColor.shade700,
      selectionHandleColor: mainColor.shade50,
    ),

    /*--- TIMEPICKER ---*/

    timePickerTheme: TimePickerThemeData(
      backgroundColor: mainColor.shade950,
      elevation: 0,
      dialHandColor: mainColor.shade50,
      hourMinuteColor: mainColor.shade800,
      dayPeriodColor: mainColor.shade800,
      hourMinuteTextColor: mainColor.shade50,
      dayPeriodTextColor: mainColor.shade50,
      entryModeIconColor: mainColor.shade50,
      helpTextStyle: TextStyle(color: mainColor.shade50),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      inputDecorationTheme: InputDecorationTheme(
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
          borderSide: BorderSide(color: mainColor.shade50, width: 2),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: mainColor.shade700,
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
        color: mainColor.shade600,
        width: 1,
      ),
      dialBackgroundColor: mainColor.shade950,
    ),

    /*--- DATE PICKER ---*/

    datePickerTheme: DatePickerThemeData(
      backgroundColor: mainColor.shade950,
      rangePickerHeaderHelpStyle: TextStyle(
        fontFamily: fontFamily,
        foreground: Paint()..color = mainColor.shade950,
        fontWeight: FontWeight.bold,
      ),
      dayBackgroundColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return mainColor.shade50;
        }
        return mainColor.shade950;
      }),
      dayForegroundColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return mainColor.shade950;
        }
        return mainColor.shade50;
      }),
      elevation: 0,
      headerBackgroundColor: mainColor.shade950,
      headerForegroundColor: mainColor.shade50,
      headerHeadlineStyle: TextStyle(
        fontFamily: fontFamily,
        foreground: Paint()..color = mainColor.shade50,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      headerHelpStyle: TextStyle(
        fontFamily: fontFamily,
        color: mainColor.shade50,
      ),
      rangePickerBackgroundColor: mainColor.shade950,
      rangePickerSurfaceTintColor: mainColor.shade950,
      rangePickerHeaderHeadlineStyle: TextStyle(
        fontFamily: fontFamily,
        foreground: Paint()..color = mainColor.shade50,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      rangeSelectionBackgroundColor: mainColor.shade800,
      rangePickerHeaderForegroundColor: mainColor.shade300,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      surfaceTintColor: mainColor.shade950,
      todayBackgroundColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return mainColor.shade50;
        }
        return mainColor.shade950;
      }),
      todayBorder: BorderSide(
        color: mainColor.shade500,
        width: 1,
      ),
      todayForegroundColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return mainColor.shade950;
        }
        return mainColor.shade50;
      }),
      weekdayStyle: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.bold,
        color: mainColor.shade50,
      ),
    ),

    /*--- SEGMENTED BUTTON ---*/

    segmentedButtonTheme: SegmentedButtonThemeData(
      style: ButtonStyle(
        overlayColor: WidgetStateProperty.all(mainColor.shade700),
        surfaceTintColor: WidgetStateProperty.all(mainColor.shade950),
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
          color: mainColor.shade600,
          width: 1,
        )),
        foregroundColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return mainColor.shade50;
          }
          return mainColor.shade400;
        }),
        backgroundColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return mainColor.shade800;
          }
          return mainColor.shade950;
        }),
      ),
    ),

    /*--- TAB BAR ---*/

    tabBarTheme: TabBarThemeData(
      dividerColor: mainColor.shade700,
      dividerHeight: 3,
      indicatorColor: mainColor.shade50,
      indicatorSize: TabBarIndicatorSize.label,
      splashBorderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      indicator: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: mainColor.shade50,
            width: 3,
          ),
        ),
      ),
      unselectedLabelColor: mainColor.shade500,
      overlayColor: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return mainColor.shade50;
        }
        return mainColor.shade700;
      }),
      labelColor: mainColor.shade50,
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
          color: mainColor.shade900,
          width: 4,
        ),
      ),
      shape: Border(
        bottom: BorderSide(
          color: mainColor.shade900,
          width: 4,
        ),
      ),
      clipBehavior: Clip.none,
      collapsedBackgroundColor: mainColor.shade900,
      collapsedIconColor: mainColor.shade50,
      iconColor: mainColor.shade50,
      backgroundColor: mainColor.shade800,
      textColor: mainColor.shade50,
      childrenPadding: const EdgeInsets.only(
        bottom: 15,
        top: 0,
        left: 20,
        right: 20,
      ),
    ),

    /*--- SNACKBAR ---*/

    snackBarTheme: SnackBarThemeData(
      backgroundColor: mainColor.shade50,
      actionTextColor: mainColor.shade950,
      disabledActionBackgroundColor: mainColor.shade50,
      disabledActionTextColor: mainColor.shade500,
      actionBackgroundColor: mainColor.shade100,
      closeIconColor: mainColor.shade950,
      contentTextStyle: TextStyle(
        fontFamily: fontFamily,
        color: mainColor.shade950,
      ),
      elevation: 0,
    ),

    /*--- ICON BUTTON ---*/

    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        overlayColor: WidgetStateProperty.all(mainColor.shade700),
        side: WidgetStateProperty.all(
          BorderSide(
            color: Colors.transparent,
            width: 0,
          ),
        ),
        foregroundColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return mainColor.shade400;
          }
          return mainColor.shade50;
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
      textColor: mainColor.shade50,
    ),

    /*--- NAVIGATION RAIL ---*/

    navigationRailTheme: NavigationRailThemeData(
      backgroundColor: mainColor.shade900,
      elevation: 0,
      selectedIconTheme: IconThemeData(
        color: mainColor.shade50,
      ),
      unselectedIconTheme: IconThemeData(
        color: mainColor.shade500,
      ),
      indicatorColor: mainColor.shade700,
      labelType: NavigationRailLabelType.none,
    ),

    /*--- MENU BAR ---*/

    menuBarTheme: MenuBarThemeData(
      style: MenuStyle(
        elevation: WidgetStateProperty.resolveWith<double>((Set<WidgetState> states) {
          return 0;
        }),
        backgroundColor: WidgetStateProperty.all(mainColor.shade900),
      ),
    ),

    /*--- MENU ---*/

    menuTheme: MenuThemeData(
      style: MenuStyle(
        alignment: AlignmentDirectional.topEnd,
        surfaceTintColor: WidgetStateProperty.all(mainColor.shade950),
        side: WidgetStateProperty.resolveWith<BorderSide>((Set<WidgetState> states) {
          return BorderSide(
            color: mainColor.shade900,
            width: 2,
          );
        }),
        elevation: WidgetStateProperty.resolveWith<double>((Set<WidgetState> states) {
          return 0;
        }),
        backgroundColor: WidgetStateProperty.all(mainColor.shade700),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    ),

    /*--- CARD ---*/

    cardTheme: CardThemeData(
      surfaceTintColor: mainColor.shade800,
      clipBehavior: Clip.none,
      color: mainColor.shade800,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: mainColor.shade800,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    ),

    /*--- NAVIGATION BAR ---*/

    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: mainColor.shade950,
      indicatorColor: mainColor.shade700,
      surfaceTintColor: mainColor.shade950,
      overlayColor: WidgetStateProperty.all(mainColor.shade600),
      iconTheme: WidgetStateProperty.resolveWith(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return IconThemeData(
              color: mainColor.shade50,
            );
          }

          return IconThemeData(
            color: mainColor.shade500,
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
              color: mainColor.shade50,
            );
          }
          return TextStyle(
            fontFamily: fontFamily,
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: mainColor.shade500,
          );
        },
      ),
      elevation: 0,
    ),

    /*--- SEARCH ANCHOR ---*/

    searchViewTheme: SearchViewThemeData(
      backgroundColor: mainColor.shade950,
      surfaceTintColor: mainColor.shade950,
    ),

    /*--- BANNER ---*/

    bannerTheme: MaterialBannerThemeData(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      surfaceTintColor: mainColor.shade800,
      dividerColor: mainColor.shade800,
      contentTextStyle: TextStyle(
        fontFamily: fontFamily,
        color: mainColor.shade50,
      ),
      backgroundColor: mainColor.shade800,
      elevation: 0,
    ),

    /*--- DATA TABLE ---*/

    dataTableTheme: DataTableThemeData(
      dataRowColor: WidgetStateProperty.all(mainColor.shade900),
      headingTextStyle: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.bold,
        color: mainColor.shade50,
      ),
      dataTextStyle: TextStyle(
        fontFamily: fontFamily,
        color: mainColor.shade50,
      ),
      dividerThickness: 1,
      columnSpacing: 20,
    ),
  );
}
