import 'package:flutter/material.dart';
import 'fabric_swatch.dart';

fabricLightTheme({
  required FabricSwatch mainColor,
  String? fontFamily,
}) {
  return ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.light,

      //primary
      primary: mainColor.shade950,
      onPrimary: mainColor.shade00,
      primaryContainer: mainColor.shade200,
      onPrimaryContainer: mainColor.shade800,

      //secondary
      secondary: mainColor.shade500,
      onSecondary: mainColor.shade50,
      secondaryContainer: mainColor.shade50,
      onSecondaryContainer: mainColor.shade700,

      //tertiary
      tertiary: mainColor.shade600,
      onTertiary: mainColor.shade50,
      tertiaryContainer: mainColor.shade200,
      onTertiaryContainer: mainColor.shade800,

      //error
      error: Color(0xFFBA1A1A),
      onError: mainColor.shade50,
      errorContainer: Color(0xFFFFDAD6),
      onErrorContainer: Color(0xFF410002),

      //surface
      surface: mainColor.shade50,
      onSurface: mainColor.shade900,
      surfaceContainerHighest: mainColor.shade100,
      onSurfaceVariant: mainColor.shade700,
      surfaceTint: mainColor.shade700,

      //outline
      outline: mainColor.shade300,
      outlineVariant: mainColor.shade100,

      //inverse
      inverseSurface: mainColor.shade800,
      onInverseSurface: mainColor.shade100,
      inversePrimary: mainColor.shade300,

      //shadow
      shadow: mainColor.shade900,
      scrim: mainColor.shade900,
    ),
    scaffoldBackgroundColor: mainColor.shade00,
    disabledColor: mainColor.shade400,
    fontFamily: fontFamily,
    splashColor: mainColor.shade50,

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
      backgroundColor: mainColor.shade00,
      foregroundColor: mainColor.shade950,
      surfaceTintColor: mainColor.shade00,
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

    /*--- DIVIDER ---*/

    dividerTheme: DividerThemeData(
      thickness: 1,
      space: 0,
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
      backgroundColor: mainColor.shade00,
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
          return mainColor.shade50;
        }

        return mainColor.shade00;
      }),
      backgroundColor: mainColor.shade00,
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
        color: mainColor.shade00,
      ),
      decoration: BoxDecoration(
        color: mainColor.shade600,
        borderRadius: BorderRadius.circular(6),
      ),
    ),

    /*--- POPUP MENU ---*/

    popupMenuTheme: PopupMenuThemeData(
      // color: mainColor.shade50,
      elevation: 0,
      // surfaceTintColor: mainColor.shade50,
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
        color: mainColor.shade00,
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
          return mainColor.shade00;
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
        return mainColor.shade00;
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
      surfaceTintColor: mainColor.shade00,
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
      backgroundColor: mainColor.shade00,
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
      backgroundColor: mainColor.shade00,
      surfaceTintColor: mainColor.shade00,
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
        color: mainColor.shade00,
        fontSize: 12,
      ),
      activeTrackColor: mainColor.shade950,
      inactiveTrackColor: mainColor.shade100,
      thumbColor: mainColor.shade950,
      overlayColor: mainColor.shade500.withValues(alpha: 0.2),
      disabledActiveTrackColor: mainColor.shade100,
      disabledInactiveTrackColor: mainColor.shade100,
      disabledThumbColor: mainColor.shade400,
      tickMarkShape: const RoundSliderTickMarkShape(),
      trackShape: const RectangularSliderTrackShape(),
    ),

    /*--- FLOATING ACTION BUTTON ---*/

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: mainColor.shade950,
      shape: const StadiumBorder(),
      splashColor: mainColor.shade700,
      foregroundColor: mainColor.shade00,
    ),

    /*--- CHECKBOX ---*/

    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return mainColor.shade950;
        }

        if (states.contains(WidgetState.disabled)) {
          return mainColor.shade100;
        }

        return mainColor.shade00;
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
      cursorColor: mainColor.shade950,
      selectionColor: mainColor.shade50,
      selectionHandleColor: mainColor.shade950,
    ),

    /*--- TIMEPICKER ---*/

    timePickerTheme: TimePickerThemeData(
      backgroundColor: mainColor.shade00,
      elevation: 0,
      dialHandColor: mainColor.shade900,
      hourMinuteColor: mainColor.shade50,
      dayPeriodColor: mainColor.shade50,
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
            color: mainColor.shade200,
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
        color: mainColor.shade200,
        width: 1,
      ),
      dialBackgroundColor: mainColor.shade00,
    ),

    /*--- DATEPICKER ---*/

    datePickerTheme: DatePickerThemeData(
      backgroundColor: mainColor.shade00,
      rangePickerHeaderHelpStyle: TextStyle(
        fontFamily: fontFamily,
        foreground: Paint()..color = mainColor.shade950,
        fontWeight: FontWeight.bold,
      ),
      dayBackgroundColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return mainColor.shade950;
        }
        return mainColor.shade00;
      }),
      dayForegroundColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return mainColor.shade00;
        }
        return mainColor.shade950;
      }),
      elevation: 0,
      headerBackgroundColor: mainColor.shade00,
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
      rangePickerBackgroundColor: mainColor.shade00,
      rangePickerSurfaceTintColor: mainColor.shade00,
      rangePickerHeaderHeadlineStyle: TextStyle(
        fontFamily: fontFamily,
        foreground: Paint()..color = mainColor.shade950,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      rangeSelectionBackgroundColor: mainColor.shade50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      surfaceTintColor: mainColor.shade00,
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

    /*--- TAB BAR ---*/

    tabBarTheme: TabBarThemeData(
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
      //set splash color
      splashBorderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
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
          color: mainColor.shade00,
          width: 4,
        ),
      ),
      shape: Border(
        bottom: BorderSide(
          color: mainColor.shade00,
          width: 4,
        ),
      ),
      clipBehavior: Clip.none,
      collapsedBackgroundColor: mainColor.shade00,
      collapsedIconColor: mainColor.shade950,
      iconColor: mainColor.shade950,
      backgroundColor: mainColor.shade50,
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
      actionTextColor: mainColor.shade00,
      disabledActionBackgroundColor: mainColor.shade800,
      disabledActionTextColor: mainColor.shade400,
      actionBackgroundColor: mainColor.shade700,
      closeIconColor: mainColor.shade00,
      contentTextStyle: TextStyle(
        fontFamily: fontFamily,
        color: mainColor.shade00,
      ),
      elevation: 0,
    ),

    /*--- BADGE ---*/

    badgeTheme: BadgeThemeData(
      alignment: Alignment.topCenter,
      offset: const Offset(0, -4),
      backgroundColor: Colors.red,
      textColor: mainColor.shade00,
    ),

    /*--- NAVIGATION RAIL ---*/

    navigationRailTheme: NavigationRailThemeData(
      backgroundColor: mainColor.shade00,
      elevation: 0,
      selectedIconTheme: IconThemeData(
        color: mainColor.shade950,
      ),
      unselectedIconTheme: IconThemeData(
        color: mainColor.shade950,
      ),
      indicatorColor: mainColor.shade50,
      labelType: NavigationRailLabelType.none,
    ),

    /*--- MENU BAR ---*/

    menuBarTheme: MenuBarThemeData(
      style: MenuStyle(
        elevation: WidgetStateProperty.resolveWith<double>((Set<WidgetState> states) {
          return 0;
        }),
        backgroundColor: WidgetStateProperty.all(mainColor.shade00),
      ),
    ),

    /*--- MENU ---*/

    menuTheme: MenuThemeData(
      style: MenuStyle(
        alignment: AlignmentDirectional.topEnd,
        side: WidgetStateProperty.resolveWith<BorderSide>((Set<WidgetState> states) {
          return BorderSide(
            color: mainColor.shade00,
            width: 2,
          );
        }),
        elevation: WidgetStateProperty.resolveWith<double>((Set<WidgetState> states) {
          return 0;
        }),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    ),

    /*--- CARD ---*/

    cardTheme: CardThemeData(
      surfaceTintColor: mainColor.shade50,
      clipBehavior: Clip.none,
      color: mainColor.shade50,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: mainColor.shade50,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    ),

    /*--- NAVIGATION BAR ---*/

    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: mainColor.shade50,
      indicatorColor: mainColor.shade00,
      surfaceTintColor: mainColor.shade50,
      overlayColor: WidgetStateProperty.all(mainColor.shade00),
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
      backgroundColor: mainColor.shade00,
      surfaceTintColor: mainColor.shade00,
    ),

    /*--- BANNER ---*/

    bannerTheme: MaterialBannerThemeData(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      surfaceTintColor: mainColor.shade50,
      dividerColor: mainColor.shade50,
      contentTextStyle: TextStyle(
        fontFamily: fontFamily,
        color: mainColor.shade950,
      ),
      backgroundColor: mainColor.shade50,
      elevation: 0,
    ),

    /*--- DATA TABLE ---*/

    dataTableTheme: DataTableThemeData(
      dataRowColor: WidgetStateProperty.all(mainColor.shade00),
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
