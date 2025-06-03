import 'package:flutter/material.dart';
import 'fabric_swatch.dart';

fabricLightTheme({
  required FabricSwatch mainColor,
  String? fontFamily,
}) {
  return ThemeData(
    colorSchemeSeed: mainColor,
    scaffoldBackgroundColor: mainColor.shade50,
    disabledColor: mainColor.shade400,
    brightness: Brightness.light,
    fontFamily: fontFamily,
    splashColor: mainColor.shade100,

    /*--- APP BAR ---*/

    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: mainColor.shade950,
        size: 24,
      ),
      titleTextStyle: TextStyle(
        fontFamily: fontFamily,
        color: mainColor.shade950,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      backgroundColor: mainColor.shade50,
      foregroundColor: mainColor.shade950,
      surfaceTintColor: mainColor.shade50,
      elevation: 0,
    ),

    /*--- TEXT ---*/

    textTheme: TextTheme(
      displayLarge: TextStyle(color: mainColor.shade900, fontFamily: fontFamily, fontSize: 40, fontWeight: FontWeight.bold),
      displayMedium: TextStyle(color: mainColor.shade900, fontFamily: fontFamily, fontSize: 38, fontWeight: FontWeight.bold),
      displaySmall: TextStyle(color: mainColor.shade900, fontFamily: fontFamily, fontSize: 36, fontWeight: FontWeight.bold),
      headlineLarge: TextStyle(color: mainColor.shade900, fontFamily: fontFamily, fontSize: 32, fontWeight: FontWeight.bold),
      headlineMedium: TextStyle(color: mainColor.shade900, fontFamily: fontFamily, fontSize: 28, fontWeight: FontWeight.bold),
      headlineSmall: TextStyle(color: mainColor.shade900, fontFamily: fontFamily, fontSize: 24, fontWeight: FontWeight.bold),
      titleLarge: TextStyle(color: mainColor.shade900, fontFamily: fontFamily, fontSize: 22, fontWeight: FontWeight.bold),
      titleMedium: TextStyle(color: mainColor.shade900, fontFamily: fontFamily, fontSize: 16, fontWeight: FontWeight.bold),
      titleSmall: TextStyle(color: mainColor.shade900, fontFamily: fontFamily, fontSize: 14, fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(color: mainColor.shade900, fontFamily: fontFamily, fontSize: 16, fontWeight: FontWeight.normal),
      bodyMedium: TextStyle(color: mainColor.shade900, fontFamily: fontFamily, fontSize: 14, fontWeight: FontWeight.normal),
      bodySmall: TextStyle(color: mainColor.shade900, fontFamily: fontFamily, fontSize: 12, fontWeight: FontWeight.normal),
      labelLarge: TextStyle(color: mainColor.shade900, fontFamily: fontFamily, fontSize: 14, fontWeight: FontWeight.bold),
      labelMedium: TextStyle(color: mainColor.shade900, fontFamily: fontFamily, fontSize: 12, fontWeight: FontWeight.bold),
      labelSmall: TextStyle(color: mainColor.shade900, fontFamily: fontFamily, fontSize: 11, fontWeight: FontWeight.bold),
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
              decorationColor: mainColor.shade950,
            );
          }
          return TextStyle(
            fontFamily: fontFamily,
            fontWeight: FontWeight.bold,
          );
        }),
        overlayColor: WidgetStateProperty.all(mainColor.shade300),
        foregroundColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return mainColor.shade50;
          }

          return mainColor.shade950;
        }),
        backgroundColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return mainColor.shade300;
          }
          return mainColor.shade200;
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
              decorationColor: mainColor.shade950,
            );
          }
          return TextStyle(
            fontFamily: fontFamily,
            fontWeight: FontWeight.bold,
          );
        }),
        overlayColor: WidgetStateProperty.all(mainColor.shade600),
        foregroundColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return mainColor.shade50;
          }

          return mainColor.shade50;
        }),
        backgroundColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return mainColor.shade300;
          }
          return mainColor.shade950;
        }),
      ),
    ),

    /*--- OUTLINED BUTTON ---*/

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        side: WidgetStateProperty.resolveWith<BorderSide>((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return BorderSide(
              color: mainColor.shade300,
              width: 1,
            );
          }
          return BorderSide(
            color: mainColor.shade500,
            width: 1,
          );
        }),
        overlayColor: WidgetStateProperty.all(
          mainColor.shade200,
        ),
        textStyle: WidgetStateProperty.resolveWith<TextStyle>((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return TextStyle(
              fontFamily: fontFamily,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.lineThrough,
              decorationColor: mainColor.shade950,
            );
          }
          return TextStyle(
            fontFamily: fontFamily,
            fontWeight: FontWeight.bold,
          );
        }),
        foregroundColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return mainColor.shade500;
          }
          return mainColor.shade950;
        }),
        backgroundColor: WidgetStateProperty.all(mainColor.shade50),
      ),
    ),

    /*--- TEXT BUTTON ---*/

    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        overlayColor: WidgetStateProperty.all(
          mainColor.shade200,
        ),
        textStyle: WidgetStateProperty.resolveWith<TextStyle>((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return TextStyle(
              fontFamily: fontFamily,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.lineThrough,
              decorationColor: mainColor.shade950,
            );
          }
          return TextStyle(
            fontFamily: fontFamily,
            fontWeight: FontWeight.bold,
          );
        }),
        foregroundColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return mainColor.shade500;
          }
          return mainColor.shade950;
        }),
      ),
    ),

    /*--- DIVIDER ---*/

    dividerTheme: DividerThemeData(
      thickness: 1,
      space: 0,
      color: mainColor.shade200,
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
      textColor: mainColor.shade950,
      iconColor: mainColor.shade950,
    ),

    /*--- DRAWER ---*/

    drawerTheme: DrawerThemeData(
      backgroundColor: mainColor.shade50,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(0),
        ),
      ),
    ),

    /*--- CHIP ---*/

    chipTheme: ChipThemeData(
      checkmarkColor: mainColor.shade950,
      color: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return mainColor.shade100;
        }

        return mainColor.shade50;
      }),
      backgroundColor: mainColor.shade50,
      brightness: Brightness.light,
      deleteIconColor: mainColor.shade950,
      disabledColor: mainColor.shade200,
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      iconTheme: IconThemeData(
        color: mainColor.shade950,
        size: 16,
      ),
      side: BorderSide(
        color: mainColor.shade400,
        width: 1,
      ),
      elevation: 0,
      secondarySelectedColor: mainColor.shade300,
      selectedColor: mainColor.shade300,
      labelStyle: TextStyle(
        fontFamily: fontFamily,
        fontSize: 13,
        color: mainColor.shade950,
      ),
    ),

    /*--- TOOLTIP ---*/

    tooltipTheme: TooltipThemeData(
      textStyle: TextStyle(
        fontFamily: fontFamily,
        color: mainColor.shade50,
      ),
      decoration: BoxDecoration(
        color: mainColor.shade600,
        borderRadius: BorderRadius.circular(6),
      ),
    ),

    /*--- POPUP MENU ---*/

    popupMenuTheme: PopupMenuThemeData(
      color: mainColor.shade200,
      elevation: 0,
      surfaceTintColor: mainColor.shade300,
      iconColor: mainColor.shade950,
      iconSize: 16,
      labelTextStyle: WidgetStateProperty.all(
        TextStyle(
          fontFamily: fontFamily,
          fontWeight: FontWeight.bold,
          color: mainColor.shade950,
          fontSize: 14,
        ),
      ),
      textStyle: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.bold,
        color: mainColor.shade50,
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
          return mainColor.shade400;
        }
        if (states.contains(WidgetState.selected)) {
          return mainColor.shade50;
        }

        return mainColor.shade950;
      }),
      trackColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return mainColor.shade50;
        }
        if (states.contains(WidgetState.selected)) {
          return mainColor.shade950;
        }
        return mainColor.shade50;
      }),
      trackOutlineColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return mainColor.shade400;
        }
        if (states.contains(WidgetState.selected)) {
          return mainColor.shade950;
        }
        return mainColor.shade950;
      }),
    ),

    /*--- TEXT FIELD ---*/

    inputDecorationTheme: InputDecorationTheme(
      /* Label and hint */
      labelStyle: TextStyle(color: mainColor.shade900, fontFamily: fontFamily),
      hintStyle: TextStyle(color: mainColor.shade500, fontFamily: fontFamily),
      errorStyle: TextStyle(color: Colors.red, fontFamily: fontFamily),
      helperStyle: TextStyle(color: mainColor.shade500, fontFamily: fontFamily),

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
        borderSide: BorderSide(color: mainColor.shade950, width: 2),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: mainColor.shade300,
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
      surfaceTintColor: mainColor.shade50,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.bold,
        color: mainColor.shade950,
        fontSize: 16,
      ),
      contentTextStyle: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.normal,
        color: mainColor.shade700,
        fontSize: 16,
      ),
      backgroundColor: mainColor.shade50,
      insetPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),

    /*--- BOTTOM NAVIGATION BAR ---*/

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: mainColor.shade200,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: mainColor.shade950,
      unselectedItemColor: mainColor.shade700,
      showUnselectedLabels: true,
      showSelectedLabels: true,
      selectedLabelStyle: TextStyle(
        fontFamily: fontFamily,
        color: mainColor.shade950,
        fontWeight: FontWeight.bold,
      ),
      selectedIconTheme: IconThemeData(
        color: mainColor.shade950,
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
      backgroundColor: mainColor.shade50,
      surfaceTintColor: mainColor.shade50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(0),
        ),
      ),
    ),

    /*--- SLIDER ---*/

    sliderTheme: SliderThemeData(
      valueIndicatorColor: mainColor.shade950,
      valueIndicatorTextStyle: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.bold,
        color: mainColor.shade50,
        fontSize: 12,
      ),
      activeTrackColor: mainColor.shade950,
      inactiveTrackColor: mainColor.shade200,
      thumbColor: mainColor.shade950,
      overlayColor: mainColor.shade500.withValues(alpha: 0.2),
      disabledActiveTrackColor: mainColor.shade200,
      disabledInactiveTrackColor: mainColor.shade200,
      disabledThumbColor: mainColor.shade400,
      tickMarkShape: const RoundSliderTickMarkShape(),
      trackShape: const RectangularSliderTrackShape(),
    ),

    /*--- PROGRESS INDICATOR ---*/

    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: mainColor.shade950,
      linearTrackColor: mainColor.shade200,
      circularTrackPadding: const EdgeInsets.all(0),
    ),

    /*--- FLOATING ACTION BUTTON ---*/

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: mainColor.shade950,
      shape: const StadiumBorder(),
      splashColor: mainColor.shade700,
      foregroundColor: mainColor.shade50,
    ),

    /*--- CHECKBOX ---*/

    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return mainColor.shade950;
        }

        if (states.contains(WidgetState.disabled)) {
          return mainColor.shade300;
        }

        return mainColor.shade50;
      }),
      checkColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return mainColor.shade50;
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
          return mainColor.shade400;
        }

        return mainColor.shade950;
      }),
      overlayColor: WidgetStateProperty.all(mainColor.shade400),
    ),

    /*--- TEXT SELECTION ---*/

    textSelectionTheme: TextSelectionThemeData(
      cursorColor: mainColor.shade900,
      selectionColor: mainColor.shade200,
      selectionHandleColor: mainColor.shade900,
    ),

    /*--- TIMEPICKER ---*/

    timePickerTheme: TimePickerThemeData(
      backgroundColor: mainColor.shade50,
      elevation: 0,
      dialHandColor: mainColor.shade900,
      hourMinuteColor: mainColor.shade100,
      dayPeriodColor: mainColor.shade100,
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
          borderSide: BorderSide(color: mainColor.shade950, width: 2),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: mainColor.shade300,
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
        color: mainColor.shade400,
        width: 1,
      ),
      dialBackgroundColor: mainColor.shade50,
    ),

    /*--- DATEPICKER ---*/

    datePickerTheme: DatePickerThemeData(
      backgroundColor: mainColor.shade50,
      rangePickerHeaderHelpStyle: TextStyle(
        fontFamily: fontFamily,
        foreground: Paint()..color = mainColor.shade950,
        fontWeight: FontWeight.bold,
      ),
      dayBackgroundColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return mainColor.shade950;
        }
        return mainColor.shade50;
      }),
      dayForegroundColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return mainColor.shade50;
        }
        return mainColor.shade950;
      }),
      elevation: 0,
      headerBackgroundColor: mainColor.shade50,
      headerForegroundColor: mainColor.shade950,
      headerHeadlineStyle: TextStyle(
        fontFamily: fontFamily,
        foreground: Paint()..color = mainColor.shade950,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      headerHelpStyle: TextStyle(
        fontFamily: fontFamily,
        color: mainColor.shade950,
      ),
      rangePickerBackgroundColor: mainColor.shade50,
      rangePickerSurfaceTintColor: mainColor.shade50,
      rangePickerHeaderHeadlineStyle: TextStyle(
        fontFamily: fontFamily,
        foreground: Paint()..color = mainColor.shade950,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      rangeSelectionBackgroundColor: mainColor.shade100,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      surfaceTintColor: mainColor.shade50,
      todayBackgroundColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return mainColor.shade950;
        }
        return mainColor.shade50;
      }),
      todayBorder: BorderSide(
        width: 1,
      ),
      todayForegroundColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return mainColor.shade50;
        }
        return mainColor.shade950;
      }),
      weekdayStyle: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.bold,
        color: mainColor.shade950,
      ),
    ),

    /*--- SEGMENTED BUTTON ---*/

    segmentedButtonTheme: SegmentedButtonThemeData(
      style: ButtonStyle(
        overlayColor: WidgetStateProperty.all(mainColor.shade300),
        surfaceTintColor: WidgetStateProperty.all(mainColor.shade50),
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
          color: mainColor.shade400,
          width: 1,
        )),
        foregroundColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return mainColor.shade950;
          }
          return mainColor.shade950;
        }),
        backgroundColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return mainColor.shade100;
          }
          return mainColor.shade50;
        }),
      ),
    ),

    /*--- TAB BAR ---*/

    tabBarTheme: TabBarThemeData(
      dividerColor: mainColor.shade200,
      dividerHeight: 3,
      indicatorColor: mainColor.shade950,
      indicatorSize: TabBarIndicatorSize.label,
      indicator: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: mainColor.shade950,
            width: 3,
          ),
        ),
      ),
      unselectedLabelColor: mainColor.shade500,
      overlayColor: WidgetStateColor.resolveWith((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return mainColor.shade950;
        }
        return mainColor.shade200;
      }),
      labelColor: mainColor.shade950,
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
          color: mainColor.shade50,
          width: 4,
        ),
      ),
      shape: Border(
        bottom: BorderSide(
          color: mainColor.shade50,
          width: 4,
        ),
      ),
      clipBehavior: Clip.none,
      collapsedBackgroundColor: mainColor.shade50,
      collapsedIconColor: mainColor.shade950,
      iconColor: mainColor.shade950,
      backgroundColor: mainColor.shade100,
      textColor: mainColor.shade950,
      childrenPadding: const EdgeInsets.only(
        bottom: 15,
        top: 0,
        left: 20,
        right: 20,
      ),
    ),

    /*--- SNACKBAR ---*/

    snackBarTheme: SnackBarThemeData(
      backgroundColor: mainColor.shade800,
      actionTextColor: mainColor.shade50,
      disabledActionBackgroundColor: mainColor.shade800,
      disabledActionTextColor: mainColor.shade400,
      actionBackgroundColor: mainColor.shade700,
      closeIconColor: mainColor.shade50,
      contentTextStyle: TextStyle(
        fontFamily: fontFamily,
        color: mainColor.shade50,
      ),
      elevation: 0,
    ),

    /*--- ICON BUTTON ---*/

    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        overlayColor: WidgetStateProperty.all(mainColor.shade300),
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
          return mainColor.shade950;
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
      backgroundColor: mainColor.shade50,
      elevation: 0,
      selectedIconTheme: IconThemeData(
        color: mainColor.shade950,
      ),
      unselectedIconTheme: IconThemeData(
        color: mainColor.shade950,
      ),
      indicatorColor: mainColor.shade200,
      labelType: NavigationRailLabelType.none,
    ),

    /*--- MENU BAR ---*/

    menuBarTheme: MenuBarThemeData(
      style: MenuStyle(
        elevation: WidgetStateProperty.resolveWith<double>((Set<WidgetState> states) {
          return 0;
        }),
        backgroundColor: WidgetStateProperty.all(mainColor.shade50),
      ),
    ),

    /*--- MENU ---*/

    menuTheme: MenuThemeData(
      style: MenuStyle(
        alignment: AlignmentDirectional.topEnd,
        surfaceTintColor: WidgetStateProperty.all(mainColor.shade200),
        side: WidgetStateProperty.resolveWith<BorderSide>((Set<WidgetState> states) {
          return BorderSide(
            color: mainColor.shade50,
            width: 2,
          );
        }),
        elevation: WidgetStateProperty.resolveWith<double>((Set<WidgetState> states) {
          return 0;
        }),
        backgroundColor: WidgetStateProperty.all(mainColor.shade200),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    ),

    /*--- CARD ---*/

    cardTheme: CardThemeData(
      surfaceTintColor: Colors.white,
      clipBehavior: Clip.none,
      color: Colors.white,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Colors.white,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    ),

    /*--- NAVIGATION BAR ---*/

    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: mainColor.shade100,
      indicatorColor: mainColor.shade50,
      surfaceTintColor: mainColor.shade200,
      overlayColor: WidgetStateProperty.all(mainColor.shade50),
      iconTheme: WidgetStateProperty.resolveWith(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return IconThemeData(
              color: mainColor.shade950,
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
              color: mainColor.shade950,
            );
          }
          return TextStyle(
            fontFamily: fontFamily,
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: mainColor.shade600,
          );
        },
      ),
      elevation: 0,
    ),

    /*--- SEARCH ANCHOR ---*/

    searchViewTheme: SearchViewThemeData(
      backgroundColor: mainColor.shade50,
      surfaceTintColor: mainColor.shade50,
    ),

    /*--- BANNER ---*/

    bannerTheme: MaterialBannerThemeData(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      surfaceTintColor: mainColor.shade100,
      dividerColor: mainColor.shade100,
      contentTextStyle: TextStyle(
        fontFamily: fontFamily,
        color: mainColor.shade950,
      ),
      backgroundColor: mainColor.shade100,
      elevation: 0,
    ),

    /*--- DATA TABLE ---*/

    dataTableTheme: DataTableThemeData(
      dataRowColor: WidgetStateProperty.all(mainColor.shade50),
      headingTextStyle: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.bold,
        color: mainColor.shade950,
      ),
      dataTextStyle: TextStyle(
        fontFamily: fontFamily,
        color: mainColor.shade950,
      ),
      dividerThickness: 1,
      columnSpacing: 20,
    ),
  );
}
