import 'package:flutter/material.dart';
import '../fabric_swatch.dart';

AppBarThemeData buildFabricAppBarTheme(
  FabricSwatch mainColor, {
  required bool isDark,
  String? fontFamily,
}) {
  final Color fg = isDark ? mainColor.shade50 : mainColor.shade800;
  final Color bg = isDark ? mainColor.shade900 : mainColor.shade00;

  return AppBarThemeData(
    iconTheme: IconThemeData(
      color: fg,
      size: 24,
    ),
    actionsIconTheme: IconThemeData(
      color: fg,
      size: 24,
    ),
    titleTextStyle: TextStyle(
      fontFamily: fontFamily,
      color: fg,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.1,
    ),
    backgroundColor: bg,
    surfaceTintColor: bg,
    foregroundColor: fg,
    elevation: 0,
    scrolledUnderElevation: 0,
  );
}

DrawerThemeData buildFabricDrawerTheme(
  FabricSwatch mainColor, {
  required bool isDark,
}) {
  final Color bg = isDark ? mainColor.shade950 : mainColor.shade00;
  return DrawerThemeData(
    backgroundColor: bg,
    surfaceTintColor: bg,
    elevation: 0,
    scrimColor: isDark
        ? mainColor.shade600.withValues(alpha: 0.7)
        : mainColor.shade900.withValues(alpha: 0.5),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(0),
        topRight: Radius.circular(0),
      ),
    ),
  );
}

NavigationDrawerThemeData buildFabricNavigationDrawerTheme(
  FabricSwatch mainColor, {
  required bool isDark,
  String? fontFamily,
}) {
  final Color bg = isDark ? mainColor.shade950 : mainColor.shade00;
  final Color selectedFg = isDark ? mainColor.shade50 : mainColor.shade800;
  final Color unselectedFg = mainColor.shade500;

  return NavigationDrawerThemeData(
    backgroundColor: bg,
    surfaceTintColor: bg,
    elevation: 0,
    indicatorColor: isDark ? mainColor.shade800 : mainColor.shade50,
    indicatorShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    iconTheme: WidgetStateProperty.resolveWith<IconThemeData?>((Set<WidgetState> states) {
      if (states.contains(WidgetState.selected)) {
        return IconThemeData(color: selectedFg, size: 24);
      }
      return IconThemeData(color: unselectedFg, size: 24);
    }),
    labelTextStyle: WidgetStateProperty.resolveWith<TextStyle?>((Set<WidgetState> states) {
      if (states.contains(WidgetState.selected)) {
        return TextStyle(
          fontFamily: fontFamily,
          fontWeight: FontWeight.bold,
          fontSize: 14,
          color: selectedFg,
        );
      }
      return TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.normal,
        fontSize: 14,
        color: unselectedFg,
      );
    }),
  );
}

PopupMenuThemeData buildFabricPopupMenuTheme(
  FabricSwatch mainColor, {
  required bool isDark,
  String? fontFamily,
}) {
  final Color bg = isDark ? mainColor.shade700 : mainColor.shade50;
  final Color fg = isDark ? mainColor.shade50 : mainColor.shade800;

  return PopupMenuThemeData(
    color: bg,
    elevation: 0,
    surfaceTintColor: bg,
    iconColor: fg,
    iconSize: 16,
    labelTextStyle: WidgetStateProperty.all(
      TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.normal,
        color: fg,
        fontSize: 14,
      ),
    ),
    textStyle: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.normal,
      color: fg,
      fontSize: 15,
    ),
    menuPadding: EdgeInsets.zero,
    shape: RoundedRectangleBorder(
      side: BorderSide(
        color: isDark ? mainColor.shade600 : mainColor.shade200,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(10),
    ),
  );
}

BottomNavigationBarThemeData buildFabricBottomNavigationBarTheme(
  FabricSwatch mainColor, {
  required bool isDark,
  String? fontFamily,
}) {
  final Color selectedColor = isDark ? mainColor.shade50 : mainColor.shade800;
  final Color unselectedColor = isDark ? mainColor.shade400 : mainColor.shade500;

  return BottomNavigationBarThemeData(
    backgroundColor: isDark ? mainColor.shade950 : mainColor.shade50,
    enableFeedback: true,
    type: BottomNavigationBarType.fixed,
    selectedItemColor: selectedColor,
    unselectedItemColor: unselectedColor,
    showUnselectedLabels: true,
    showSelectedLabels: true,
    selectedLabelStyle: TextStyle(
      fontFamily: fontFamily,
      color: selectedColor,
      fontWeight: FontWeight.bold,
    ),
    selectedIconTheme: IconThemeData(
      color: selectedColor,
    ),
    unselectedLabelStyle: TextStyle(
      fontFamily: fontFamily,
      color: unselectedColor,
    ),
    unselectedIconTheme: IconThemeData(
      color: unselectedColor,
    ),
    elevation: 0,
  );
}

BottomAppBarThemeData buildFabricBottomAppBarTheme(
  FabricSwatch mainColor, {
  required bool isDark,
}) {
  final Color bg = isDark ? mainColor.shade950 : mainColor.shade50;
  return BottomAppBarThemeData(
    color: bg,
    surfaceTintColor: bg,
    elevation: 0,
  );
}

TabBarThemeData buildFabricTabBarTheme(
  FabricSwatch mainColor, {
  required bool isDark,
  String? fontFamily,
}) {
  final Color fg = isDark ? mainColor.shade50 : mainColor.shade800;
  final Color unselectedFg = isDark ? mainColor.shade400 : mainColor.shade500;

  return TabBarThemeData(
    dividerHeight: 1,
    dividerColor: isDark ? mainColor.shade800 : mainColor.shade200,
    indicatorColor: fg,
    labelColor: fg,
    unselectedLabelColor: unselectedFg,
    labelStyle: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w600,
      fontSize: 13,
    ),
    unselectedLabelStyle: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.normal,
      fontSize: 13,
    ),
    indicatorSize: TabBarIndicatorSize.label,
    splashBorderRadius: const BorderRadius.only(
      topLeft: Radius.circular(8),
      topRight: Radius.circular(8),
    ),
    indicator: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: fg,
          width: 2.5,
        ),
      ),
    ),
  );
}

NavigationRailThemeData buildFabricNavigationRailTheme(
  FabricSwatch mainColor, {
  required bool isDark,
  String? fontFamily,
}) {
  final Color selectedColor = isDark ? mainColor.shade00 : mainColor.shade800;

  return NavigationRailThemeData(
    backgroundColor: isDark ? mainColor.shade900 : mainColor.shade00,
    elevation: 0,
    selectedLabelTextStyle: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.bold,
      fontSize: 13,
      color: selectedColor,
    ),
    unselectedLabelTextStyle: TextStyle(
      fontFamily: fontFamily,
      fontSize: 13,
      color: mainColor.shade500,
    ),
    selectedIconTheme: IconThemeData(
      color: selectedColor,
    ),
    unselectedIconTheme: IconThemeData(
      color: mainColor.shade500,
    ),
    indicatorColor: isDark ? mainColor.shade800 : mainColor.shade50,
    labelType: NavigationRailLabelType.none,
  );
}

MenuBarThemeData buildFabricMenuBarTheme(
  FabricSwatch mainColor, {
  required bool isDark,
}) {
  final Color bg = isDark ? mainColor.shade900 : mainColor.shade00;
  return MenuBarThemeData(
    style: MenuStyle(
      elevation: WidgetStateProperty.all(0),
      backgroundColor: WidgetStateProperty.all(bg),
      surfaceTintColor: WidgetStateProperty.all(bg),
    ),
  );
}

MenuThemeData buildFabricMenuTheme(
  FabricSwatch mainColor, {
  required bool isDark,
}) {
  final Color bg = isDark ? mainColor.shade700 : mainColor.shade50;
  return MenuThemeData(
    style: MenuStyle(
      alignment: AlignmentDirectional.topEnd,
      backgroundColor: WidgetStateProperty.all(bg),
      surfaceTintColor: WidgetStateProperty.all(bg),
      side: WidgetStateProperty.all(
        BorderSide(
          strokeAlign: BorderSide.strokeAlignCenter,
          color: isDark ? mainColor.shade600 : mainColor.shade200,
          width: 1,
        ),
      ),
      elevation: WidgetStateProperty.all(0),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  );
}

MenuButtonThemeData buildFabricMenuButtonTheme(
  FabricSwatch mainColor, {
  required bool isDark,
  String? fontFamily,
}) {
  final Color fg = isDark ? mainColor.shade50 : mainColor.shade800;
  return MenuButtonThemeData(
    style: MenuItemButton.styleFrom(
      foregroundColor: fg,
      iconColor: fg,
      disabledForegroundColor: isDark ? mainColor.shade500 : mainColor.shade400,
      textStyle: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.normal,
        fontSize: 14,
      ),
    ),
  );
}

NavigationBarThemeData buildFabricNavigationBarTheme(
  FabricSwatch mainColor, {
  required bool isDark,
  String? fontFamily,
}) {
  final Color bg = isDark ? mainColor.shade950 : mainColor.shade50;
  final Color selectedColor = isDark ? mainColor.shade50 : mainColor.shade800;

  return NavigationBarThemeData(
    backgroundColor: bg,
    indicatorColor: isDark ? mainColor.shade700 : mainColor.shade00,
    surfaceTintColor: bg,
    overlayColor: WidgetStateProperty.all(
      isDark ? mainColor.shade600 : mainColor.shade00,
    ),
    iconTheme: WidgetStateProperty.resolveWith(
      (Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return IconThemeData(color: selectedColor);
        }
        return IconThemeData(
          color: isDark ? mainColor.shade400 : mainColor.shade500,
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
            color: selectedColor,
          );
        }
        return TextStyle(
          fontFamily: fontFamily,
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: isDark ? mainColor.shade400 : mainColor.shade500,
        );
      },
    ),
    elevation: 0,
  );
}
