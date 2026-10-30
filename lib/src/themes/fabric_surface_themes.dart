import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../fabric_swatch.dart';

const PageTransitionsTheme fabricPageTransitionsTheme = PageTransitionsTheme(
  builders: <TargetPlatform, PageTransitionsBuilder>{
    TargetPlatform.android: CupertinoPageTransitionsBuilder(),
    TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
    TargetPlatform.windows: CupertinoPageTransitionsBuilder(),
    TargetPlatform.linux: CupertinoPageTransitionsBuilder(),
    TargetPlatform.fuchsia: CupertinoPageTransitionsBuilder(),
  },
);

const DividerThemeData fabricDividerTheme = DividerThemeData(
  thickness: 1,
  space: 0,
);

DividerThemeData buildFabricDividerTheme(
  FabricSwatch mainColor, {
  required bool isDark,
}) {
  return DividerThemeData(
    color: isDark ? mainColor.shade800 : mainColor.shade100,
    thickness: 1,
    space: 0,
  );
}

IconThemeData buildFabricIconTheme(
  FabricSwatch mainColor, {
  required bool isDark,
}) {
  return const IconThemeData(
    size: 24,
  );
}

ScrollbarThemeData buildFabricScrollbarTheme(
  FabricSwatch mainColor, {
  required bool isDark,
}) {
  return ScrollbarThemeData(
    radius: const Radius.circular(10),
    thickness: WidgetStateProperty.all(6),
    thumbColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
      if (states.contains(WidgetState.dragged) || states.contains(WidgetState.hovered)) {
        return isDark ? mainColor.shade300 : mainColor.shade700;
      }
      return mainColor.shade500.withValues(alpha: 0.6);
    }),
    trackColor: WidgetStateProperty.all(
      isDark ? mainColor.shade900 : mainColor.shade50,
    ),
    trackBorderColor: WidgetStateProperty.all(Colors.transparent),
  );
}

CarouselViewThemeData buildFabricCarouselViewTheme(
  FabricSwatch mainColor, {
  required bool isDark,
}) {
  final Color bg = isDark ? mainColor.shade800 : mainColor.shade50;
  final Color borderColor = isDark ? mainColor.shade700 : mainColor.shade200;
  return CarouselViewThemeData(
    backgroundColor: bg,
    elevation: 0,
    shape: RoundedRectangleBorder(
      side: BorderSide(color: borderColor, width: 1),
      borderRadius: BorderRadius.circular(10),
    ),
    padding: const EdgeInsets.all(8),
  );
}

ListTileThemeData buildFabricListTileTheme(
  FabricSwatch mainColor, {
  required bool isDark,
  String? fontFamily,
}) {
  final Color fg = isDark ? mainColor.shade50 : mainColor.shade800;
  final Color subtitleColor = isDark ? mainColor.shade400 : mainColor.shade500;
  return ListTileThemeData(
    horizontalTitleGap: 20,
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 0,
    ),
    titleTextStyle: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.bold,
      fontSize: 16,
      color: fg,
    ),
    subtitleTextStyle: TextStyle(
      fontFamily: fontFamily,
      fontSize: 14,
      color: subtitleColor,
    ),
    leadingAndTrailingTextStyle: TextStyle(
      fontFamily: fontFamily,
      fontSize: 12,
      color: subtitleColor,
    ),
    textColor: fg,
    iconColor: fg,
  );
}

ChipThemeData buildFabricChipTheme(
  FabricSwatch mainColor, {
  required bool isDark,
  String? fontFamily,
}) {
  final Color fg = isDark ? mainColor.shade50 : mainColor.shade800;
  final Color bg = isDark ? mainColor.shade900 : mainColor.shade00;
  final Color selectedBg = isDark ? mainColor.shade700 : mainColor.shade100;
  final Color disabledBg = isDark ? mainColor.shade900 : mainColor.shade200;

  return ChipThemeData(
    checkmarkColor: fg,
    color: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
      if (states.contains(WidgetState.disabled)) {
        return disabledBg;
      }
      if (states.contains(WidgetState.selected)) {
        return selectedBg;
      }
      return bg;
    }),
    backgroundColor: bg,
    surfaceTintColor: Colors.transparent,
    brightness: isDark ? Brightness.dark : Brightness.light,
    deleteIconColor: fg,
    disabledColor: disabledBg,
    padding: const EdgeInsets.symmetric(
      horizontal: 10,
      vertical: 5,
    ),
    iconTheme: IconThemeData(
      color: fg,
      size: 16,
    ),
    side: BorderSide(
      color: isDark ? mainColor.shade500 : mainColor.shade400,
      width: 1,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    elevation: 0,
    secondarySelectedColor: isDark ? mainColor.shade800 : mainColor.shade300,
    selectedColor: selectedBg,
    labelStyle: TextStyle(
      fontFamily: fontFamily,
      fontSize: 13,
      color: fg,
    ),
  );
}

TooltipThemeData buildFabricTooltipTheme(
  FabricSwatch mainColor, {
  required bool isDark,
  String? fontFamily,
}) {
  return TooltipThemeData(
    textStyle: TextStyle(
      fontFamily: fontFamily,
      color: isDark ? mainColor.shade950 : mainColor.shade00,
    ),
    decoration: BoxDecoration(
      color: isDark ? mainColor.shade300 : mainColor.shade600,
      borderRadius: BorderRadius.circular(6),
    ),
  );
}

DialogThemeData buildFabricDialogTheme(
  FabricSwatch mainColor, {
  required bool isDark,
  String? fontFamily,
}) {
  return DialogThemeData(
    barrierColor: isDark
        ? mainColor.shade600.withValues(alpha: 0.7)
        : mainColor.shade900.withValues(alpha: 0.5),
    surfaceTintColor: isDark ? mainColor.shade950 : mainColor.shade00,
    elevation: 0,
    titleTextStyle: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.bold,
      color: isDark ? mainColor.shade50 : mainColor.shade800,
      fontSize: 16,
    ),
    contentTextStyle: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.normal,
      color: isDark ? mainColor.shade400 : mainColor.shade500,
      fontSize: 16,
    ),
    backgroundColor: isDark ? mainColor.shade950 : mainColor.shade00,
    insetPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    shape: RoundedRectangleBorder(
      side: BorderSide(
        color: isDark ? mainColor.shade800 : mainColor.shade200,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(10),
    ),
  );
}

BottomSheetThemeData buildFabricBottomSheetTheme(
  FabricSwatch mainColor, {
  required bool isDark,
}) {
  final Color bg = isDark ? mainColor.shade950 : mainColor.shade00;
  return BottomSheetThemeData(
    backgroundColor: bg,
    surfaceTintColor: bg,
    elevation: 0,
    modalElevation: 0,
    showDragHandle: true,
    dragHandleColor: isDark ? mainColor.shade600 : mainColor.shade300,
    dragHandleSize: const Size(36, 4),
    clipBehavior: Clip.antiAlias,
    modalBarrierColor: isDark
        ? mainColor.shade600.withValues(alpha: 0.7)
        : mainColor.shade900.withValues(alpha: 0.5),
    shape: RoundedRectangleBorder(
      side: BorderSide(
        color: isDark ? mainColor.shade800 : mainColor.shade200,
        width: 1,
      ),
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(16),
      ),
    ),
  );
}

ExpansionTileThemeData buildFabricExpansionTileTheme(
  FabricSwatch mainColor, {
  required bool isDark,
}) {
  final Color collapsedBg = isDark ? mainColor.shade900 : mainColor.shade00;
  final Color fg = isDark ? mainColor.shade50 : mainColor.shade800;

  return ExpansionTileThemeData(
    expandedAlignment: Alignment.topLeft,
    expansionAnimationStyle: const AnimationStyle(
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 200),
      reverseDuration: Duration(milliseconds: 200),
    ),
    collapsedShape: Border(
      bottom: BorderSide(
        color: collapsedBg,
        width: 4,
      ),
    ),
    shape: Border(
      bottom: BorderSide(
        color: collapsedBg,
        width: 4,
      ),
    ),
    clipBehavior: Clip.none,
    collapsedBackgroundColor: collapsedBg,
    collapsedIconColor: fg,
    collapsedTextColor: fg,
    iconColor: fg,
    backgroundColor: isDark ? mainColor.shade800 : mainColor.shade50,
    textColor: fg,
    childrenPadding: const EdgeInsets.only(
      bottom: 15,
      top: 0,
      left: 20,
      right: 20,
    ),
  );
}

SnackBarThemeData buildFabricSnackBarTheme(
  FabricSwatch mainColor, {
  required bool isDark,
  String? fontFamily,
}) {
  final Color bg = isDark ? mainColor.shade50 : mainColor.shade800;
  final Color fg = isDark ? mainColor.shade950 : mainColor.shade00;

  return SnackBarThemeData(
    backgroundColor: bg,
    behavior: SnackBarBehavior.floating,
    actionTextColor: fg,
    disabledActionBackgroundColor: bg,
    disabledActionTextColor: isDark ? mainColor.shade500 : mainColor.shade400,
    actionBackgroundColor: isDark ? mainColor.shade100 : mainColor.shade700,
    closeIconColor: fg,
    contentTextStyle: TextStyle(
      fontFamily: fontFamily,
      color: fg,
    ),
    shape: RoundedRectangleBorder(
      side: BorderSide(
        color: isDark ? mainColor.shade200 : mainColor.shade700,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(10),
    ),
    elevation: 0,
  );
}

BadgeThemeData buildFabricBadgeTheme(
  FabricSwatch mainColor, {
  required bool isDark,
}) {
  return BadgeThemeData(
    alignment: Alignment.topCenter,
    offset: const Offset(0, -4),
    backgroundColor: isDark ? const Color(0xFFFFB4AB) : const Color(0xFFBA1A1A),
    textColor: isDark ? mainColor.shade950 : mainColor.shade00,
  );
}

CardThemeData buildFabricCardTheme(
  FabricSwatch mainColor, {
  required bool isDark,
}) {
  final Color bg = isDark ? mainColor.shade800 : mainColor.shade50;
  final Color borderColor = isDark ? mainColor.shade700 : mainColor.shade200;
  return CardThemeData(
    surfaceTintColor: bg,
    clipBehavior: Clip.none,
    color: bg,
    elevation: 0,
    margin: EdgeInsets.zero,
    shape: RoundedRectangleBorder(
      side: BorderSide(
        color: borderColor,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(10),
    ),
  );
}

MaterialBannerThemeData buildFabricBannerTheme(
  FabricSwatch mainColor, {
  required bool isDark,
  String? fontFamily,
}) {
  final Color bg = isDark ? mainColor.shade800 : mainColor.shade50;
  return MaterialBannerThemeData(
    padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
    leadingPadding: const EdgeInsetsDirectional.only(end: 14),
    surfaceTintColor: bg,
    dividerColor: Colors.transparent,
    contentTextStyle: TextStyle(
      fontFamily: fontFamily,
      fontSize: 14,
      height: 1.45,
      color: isDark ? mainColor.shade50 : mainColor.shade800,
    ),
    backgroundColor: bg,
    elevation: 0,
  );
}

DataTableThemeData buildFabricDataTableTheme(
  FabricSwatch mainColor, {
  required bool isDark,
  String? fontFamily,
}) {
  final Color fg = isDark ? mainColor.shade50 : mainColor.shade800;
  return DataTableThemeData(
    dataRowColor: WidgetStateProperty.all(
      isDark ? mainColor.shade900 : mainColor.shade00,
    ),
    headingTextStyle: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.bold,
      color: fg,
    ),
    dataTextStyle: TextStyle(
      fontFamily: fontFamily,
      color: fg,
    ),
    dividerThickness: 1,
    columnSpacing: 20,
  );
}

ProgressIndicatorThemeData buildFabricProgressIndicatorTheme(
  FabricSwatch mainColor, {
  required bool isDark,
}) {
  final Color trackColor = isDark ? mainColor.shade800 : mainColor.shade100;
  return ProgressIndicatorThemeData(
    color: isDark ? mainColor.shade50 : mainColor.shade800,
    linearTrackColor: trackColor,
    circularTrackColor: trackColor,
    refreshBackgroundColor: isDark ? mainColor.shade800 : mainColor.shade50,
    strokeWidth: 2,
    circularTrackPadding: EdgeInsets.zero,
    linearMinHeight: 2,
  );
}
