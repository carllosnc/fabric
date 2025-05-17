import 'package:flutter/material.dart';
import 'colors.dart';

neutralDarkTheme() {
  return ThemeData(
    colorSchemeSeed: Colors.grey,
    scaffoldBackgroundColor: neutralColor.shade900,

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

    /*--- BUTTONS ---*/

    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStateProperty.all(
          const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        overlayColor: WidgetStateProperty.all(neutralColor.shade400),
        foregroundColor: WidgetStateProperty.all(neutralColor.shade900),
        backgroundColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return Colors.white.withValues(alpha: 0.5);
          }
          return Colors.white;
        }),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        side: WidgetStateProperty.all(BorderSide(
          color: neutralColor.shade500,
          width: 1,
        )),
        overlayColor: WidgetStateProperty.all(
          neutralColor.shade700,
        ),
        textStyle: WidgetStateProperty.all(
          const TextStyle(fontWeight: FontWeight.bold),
        ),
        foregroundColor: WidgetStateProperty.all(Colors.white),
        backgroundColor: WidgetStateProperty.all(neutralColor.shade900),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        overlayColor: WidgetStateProperty.all(
          neutralColor.shade700,
        ),
        textStyle: WidgetStateProperty.all(
          const TextStyle(fontWeight: FontWeight.bold),
        ),
        foregroundColor: WidgetStateProperty.all(Colors.white),
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
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
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
  );
}
