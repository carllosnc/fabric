import 'package:flutter/material.dart';
import '../fabric_swatch.dart';
import '../fabric_theme_extension.dart';
import 'fabric_button_themes.dart';
import 'fabric_color_scheme.dart';
import 'fabric_input_themes.dart';
import 'fabric_navigation_themes.dart';
import 'fabric_surface_themes.dart';
import 'fabric_typography.dart';

typedef _ThemeCacheKey = ({
  FabricSwatch mainColor,
  bool isDark,
  String? fontFamily,
  TextTheme? baseTextTheme,
});

final Map<_ThemeCacheKey, ThemeData> _themeCache =
    <_ThemeCacheKey, ThemeData>{};

ThemeData fabricLightTheme({
  required FabricSwatch mainColor,
  String? fontFamily,
  TextTheme? textTheme,
}) {
  return _getCachedThemeData(
    mainColor: mainColor,
    isDark: false,
    fontFamily: fontFamily,
    baseTextTheme: textTheme,
  );
}

ThemeData fabricDarkTheme({
  required FabricSwatch mainColor,
  String? fontFamily,
  TextTheme? textTheme,
}) {
  return _getCachedThemeData(
    mainColor: mainColor,
    isDark: true,
    fontFamily: fontFamily,
    baseTextTheme: textTheme,
  );
}

ThemeData _getCachedThemeData({
  required FabricSwatch mainColor,
  required bool isDark,
  String? fontFamily,
  TextTheme? baseTextTheme,
}) {
  final _ThemeCacheKey key = (
    mainColor: mainColor,
    isDark: isDark,
    fontFamily: fontFamily,
    baseTextTheme: baseTextTheme,
  );
  return _themeCache.putIfAbsent(
    key,
    () => _buildFabricThemeData(
      mainColor: mainColor,
      isDark: isDark,
      fontFamily: fontFamily,
      baseTextTheme: baseTextTheme,
    ),
  );
}

ThemeData _buildFabricThemeData({
  required FabricSwatch mainColor,
  required bool isDark,
  String? fontFamily,
  TextTheme? baseTextTheme,
}) {
  final String? effectiveFontFamily =
      fontFamily ?? baseTextTheme?.bodyMedium?.fontFamily;
  final IconThemeData iconTheme = buildFabricIconTheme(
    mainColor,
    isDark: isDark,
  );

  return ThemeData(
    useMaterial3: true,
    colorScheme: isDark
        ? buildFabricDarkColorScheme(mainColor)
        : buildFabricLightColorScheme(mainColor),
    scaffoldBackgroundColor: isDark ? mainColor.shade900 : mainColor.shade00,
    disabledColor: mainColor.shade400,
    dividerColor: isDark ? mainColor.shade800 : mainColor.shade100,
    fontFamily: effectiveFontFamily,
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    iconTheme: iconTheme,
    primaryIconTheme: iconTheme,
    splashColor: isDark ? mainColor.shade800 : mainColor.shade50,
    extensions: <ThemeExtension<dynamic>>[
      FabricThemeExtension(swatch: mainColor, isDark: isDark),
    ],
    pageTransitionsTheme: fabricPageTransitionsTheme,
    scrollbarTheme: buildFabricScrollbarTheme(mainColor, isDark: isDark),
    appBarTheme: buildFabricAppBarTheme(
      mainColor,
      isDark: isDark,
      fontFamily: effectiveFontFamily,
    ),
    textTheme: buildFabricTextTheme(
      textColor: isDark ? mainColor.shade50 : mainColor.shade800,
      fontFamily: effectiveFontFamily,
      baseTextTheme: baseTextTheme,
    ),
    dividerTheme: buildFabricDividerTheme(mainColor, isDark: isDark),
    listTileTheme: buildFabricListTileTheme(
      mainColor,
      isDark: isDark,
      fontFamily: effectiveFontFamily,
    ),
    drawerTheme: buildFabricDrawerTheme(mainColor, isDark: isDark),
    navigationDrawerTheme: buildFabricNavigationDrawerTheme(
      mainColor,
      isDark: isDark,
      fontFamily: effectiveFontFamily,
    ),
    chipTheme: buildFabricChipTheme(
      mainColor,
      isDark: isDark,
      fontFamily: effectiveFontFamily,
    ),
    tooltipTheme: buildFabricTooltipTheme(
      mainColor,
      isDark: isDark,
      fontFamily: effectiveFontFamily,
    ),
    popupMenuTheme: buildFabricPopupMenuTheme(
      mainColor,
      isDark: isDark,
      fontFamily: effectiveFontFamily,
    ),
    switchTheme: buildFabricSwitchTheme(mainColor, isDark: isDark),
    inputDecorationTheme: buildFabricInputDecorationTheme(
      mainColor,
      isDark: isDark,
      fontFamily: effectiveFontFamily,
    ),
    dropdownMenuTheme: buildFabricDropdownMenuTheme(
      mainColor,
      isDark: isDark,
      fontFamily: effectiveFontFamily,
    ),
    dialogTheme: buildFabricDialogTheme(
      mainColor,
      isDark: isDark,
      fontFamily: effectiveFontFamily,
    ),
    bottomNavigationBarTheme: buildFabricBottomNavigationBarTheme(
      mainColor,
      isDark: isDark,
      fontFamily: effectiveFontFamily,
    ),
    bottomSheetTheme: buildFabricBottomSheetTheme(mainColor, isDark: isDark),
    bottomAppBarTheme: buildFabricBottomAppBarTheme(mainColor, isDark: isDark),
    sliderTheme: buildFabricSliderTheme(
      mainColor,
      isDark: isDark,
      fontFamily: effectiveFontFamily,
    ),
    floatingActionButtonTheme: buildFabricFabTheme(mainColor, isDark: isDark),
    segmentedButtonTheme: buildFabricSegmentedButtonTheme(
      mainColor,
      isDark: isDark,
      fontFamily: effectiveFontFamily,
    ),
    filledButtonTheme: buildFabricFilledButtonTheme(mainColor, isDark: isDark),
    elevatedButtonTheme: buildFabricElevatedButtonTheme(
      mainColor,
      isDark: isDark,
    ),
    textButtonTheme: buildFabricTextButtonTheme(mainColor, isDark: isDark),
    iconButtonTheme: buildFabricIconButtonTheme(mainColor, isDark: isDark),
    outlinedButtonTheme: buildFabricOutlinedButtonTheme(
      mainColor,
      isDark: isDark,
    ),
    toggleButtonsTheme: buildFabricToggleButtonsTheme(
      mainColor,
      isDark: isDark,
      fontFamily: effectiveFontFamily,
    ),
    checkboxTheme: buildFabricCheckboxTheme(mainColor, isDark: isDark),
    radioTheme: buildFabricRadioTheme(mainColor, isDark: isDark),
    textSelectionTheme: buildFabricTextSelectionTheme(
      mainColor,
      isDark: isDark,
    ),
    timePickerTheme: buildFabricTimePickerTheme(
      mainColor,
      isDark: isDark,
      fontFamily: effectiveFontFamily,
    ),
    datePickerTheme: buildFabricDatePickerTheme(
      mainColor,
      isDark: isDark,
      fontFamily: effectiveFontFamily,
    ),
    tabBarTheme: buildFabricTabBarTheme(
      mainColor,
      isDark: isDark,
      fontFamily: effectiveFontFamily,
    ),
    expansionTileTheme: buildFabricExpansionTileTheme(
      mainColor,
      isDark: isDark,
    ),
    snackBarTheme: buildFabricSnackBarTheme(
      mainColor,
      isDark: isDark,
      fontFamily: effectiveFontFamily,
    ),
    badgeTheme: buildFabricBadgeTheme(
      mainColor,
      isDark: isDark,
      fontFamily: effectiveFontFamily,
    ),
    navigationRailTheme: buildFabricNavigationRailTheme(
      mainColor,
      isDark: isDark,
      fontFamily: effectiveFontFamily,
    ),
    menuBarTheme: buildFabricMenuBarTheme(mainColor, isDark: isDark),
    menuTheme: buildFabricMenuTheme(mainColor, isDark: isDark),
    menuButtonTheme: buildFabricMenuButtonTheme(
      mainColor,
      isDark: isDark,
      fontFamily: effectiveFontFamily,
    ),
    cardTheme: buildFabricCardTheme(mainColor, isDark: isDark),
    carouselViewTheme: buildFabricCarouselViewTheme(mainColor, isDark: isDark),
    navigationBarTheme: buildFabricNavigationBarTheme(
      mainColor,
      isDark: isDark,
      fontFamily: effectiveFontFamily,
    ),
    searchViewTheme: buildFabricSearchViewTheme(
      mainColor,
      isDark: isDark,
      fontFamily: effectiveFontFamily,
    ),
    searchBarTheme: buildFabricSearchBarTheme(
      mainColor,
      isDark: isDark,
      fontFamily: effectiveFontFamily,
    ),
    bannerTheme: buildFabricBannerTheme(
      mainColor,
      isDark: isDark,
      fontFamily: effectiveFontFamily,
    ),
    dataTableTheme: buildFabricDataTableTheme(
      mainColor,
      isDark: isDark,
      fontFamily: effectiveFontFamily,
    ),
    progressIndicatorTheme: buildFabricProgressIndicatorTheme(
      mainColor,
      isDark: isDark,
    ),
  );
}
