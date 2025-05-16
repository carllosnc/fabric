import 'package:flutter/material.dart';

var ligthTheme = ThemeData(
  colorSchemeSeed: Colors.blue,
  scaffoldBackgroundColor: Colors.white,
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
    elevation: 0,
  ),
  filledButtonTheme: FilledButtonThemeData(
    style: ButtonStyle(
      textStyle: WidgetStateProperty.all(
        const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      foregroundColor: WidgetStateProperty.all(Colors.white),
      backgroundColor: WidgetStateProperty.all(Colors.black),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      overlayColor: WidgetStateProperty.all(
        Colors.black.withValues(alpha: 0.03),
      ),
      textStyle: WidgetStateProperty.all(
        const TextStyle(fontWeight: FontWeight.bold),
      ),
      foregroundColor: WidgetStateProperty.all(Colors.black),
      backgroundColor: WidgetStateProperty.all(Colors.white),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      overlayColor: WidgetStateProperty.all(
        Colors.black.withValues(alpha: 0.03),
      ),
      textStyle: WidgetStateProperty.all(
        const TextStyle(fontWeight: FontWeight.bold),
      ),
      foregroundColor: WidgetStateProperty.all(Colors.black),
    ),
  ),
  dividerTheme: DividerThemeData(
    thickness: 1,
    space: 0,
    color: Colors.black.withValues(alpha: 0.15),
  ),
  listTileTheme: ListTileThemeData(
    horizontalTitleGap: 20,
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 5,
    ),
    titleTextStyle: const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    ),
    textColor: Colors.black,
    iconColor: Colors.black,
  ),
  drawerTheme: DrawerThemeData(
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(0),
        topRight: Radius.circular(0),
      ),
    ),
  ),
  chipTheme: ChipThemeData(
    backgroundColor: Colors.white,
    brightness: Brightness.light,
    deleteIconColor: Colors.black,
    disabledColor: Colors.black.withValues(alpha: 31),
    padding: const EdgeInsets.symmetric(
      horizontal: 10,
      vertical: 5,
    ),
    iconTheme: const IconThemeData(
      color: Colors.black,
      size: 16,
    ),
    side: BorderSide(
      color: Colors.black.withValues(alpha: 0.1),
      width: 1,
    ),
    secondaryLabelStyle: const TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    elevation: 0,
    secondarySelectedColor: Colors.grey.shade300,
    selectedColor: Colors.grey.shade300,
    shape: const StadiumBorder(),
    labelStyle: const TextStyle(
      fontSize: 13,
      color: Colors.black,
    ),
  ),
  tooltipTheme: TooltipThemeData(
    textStyle: const TextStyle(color: Colors.white),
    decoration: BoxDecoration(
      color: Colors.grey.shade600,
      borderRadius: BorderRadius.circular(6),
    ),
  ),
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
);
