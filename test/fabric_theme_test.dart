import 'package:fabric/fabric.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const swatch = fabricGrey;

  group('fabricLightTheme', () {
    test('has light brightness', () {
      final theme = fabricLightTheme(mainColor: swatch);
      expect(theme.colorScheme.brightness, Brightness.light);
    });

    test('scaffold background is shade00 (white)', () {
      final theme = fabricLightTheme(mainColor: swatch);
      expect(theme.scaffoldBackgroundColor, swatch.shade00);
    });

    test('colorScheme primary is shade800', () {
      final theme = fabricLightTheme(mainColor: swatch);
      expect(theme.colorScheme.primary, swatch.shade800);
    });

    test('colorScheme onPrimary is shade00', () {
      final theme = fabricLightTheme(mainColor: swatch);
      expect(theme.colorScheme.onPrimary, swatch.shade00);
    });

    test('colorScheme surface and surfaceContainer roles are configured', () {
      final theme = fabricLightTheme(mainColor: swatch);
      expect(theme.colorScheme.surface, swatch.shade50);
      expect(theme.colorScheme.surfaceBright, swatch.shade00);
      expect(theme.colorScheme.surfaceDim, swatch.shade200);
      expect(theme.colorScheme.surfaceContainerLowest, swatch.shade00);
      expect(theme.colorScheme.surfaceContainerLow, swatch.shade50);
      expect(theme.colorScheme.surfaceContainer, swatch.shade50);
      expect(theme.colorScheme.surfaceContainerHigh, swatch.shade100);
      expect(theme.colorScheme.surfaceContainerHighest, swatch.shade100);
    });

    test('colorScheme onSurface is shade800', () {
      final theme = fabricLightTheme(mainColor: swatch);
      expect(theme.colorScheme.onSurface, swatch.shade800);
    });

    test('colorScheme error is Color(0xFFBA1A1A) and onError is shade00', () {
      final theme = fabricLightTheme(mainColor: swatch);
      expect(theme.colorScheme.error, const Color(0xFFBA1A1A));
      expect(theme.colorScheme.onError, swatch.shade00);
    });

    test('fontFamily propagates to textTheme', () {
      final theme = fabricLightTheme(mainColor: swatch, fontFamily: 'Roboto');
      expect(theme.textTheme.bodyLarge?.fontFamily, 'Roboto');
      expect(theme.textTheme.titleMedium?.fontFamily, 'Roboto');
      expect(theme.textTheme.labelSmall?.fontFamily, 'Roboto');
    });

    test('custom textTheme merges with Fabric typography scale', () {
      const customTextTheme = TextTheme(
        bodyLarge: TextStyle(fontFamily: 'CustomFont', letterSpacing: 1.5),
      );
      final theme = fabricLightTheme(
        mainColor: swatch,
        textTheme: customTextTheme,
      );
      expect(theme.textTheme.bodyLarge?.fontFamily, 'CustomFont');
      expect(theme.textTheme.bodyLarge?.letterSpacing, 1.5);
      expect(theme.textTheme.bodyLarge?.fontSize, 16);
      expect(theme.textTheme.bodyLarge?.color, swatch.shade800);
    });

    test('custom swatch changes colors and registers FabricThemeExtension', () {
      final theme = fabricLightTheme(mainColor: fabricBlue);
      expect(theme.colorScheme.primary, fabricBlue.shade800);
      expect(theme.colorScheme.onPrimary, fabricBlue.shade00);
      expect(
        theme.extension<FabricThemeExtension>()?.swatch,
        fabricBlue,
      );
    });

    test('disabled color is shade400', () {
      final theme = fabricLightTheme(mainColor: swatch);
      expect(theme.disabledColor, swatch.shade400);
    });

    test('text selection color is shade200 for good contrast', () {
      final theme = fabricLightTheme(mainColor: swatch);
      expect(theme.textSelectionTheme.selectionColor, swatch.shade200);
    });

    test('navigationRail unselected icon is shade500', () {
      final theme = fabricLightTheme(mainColor: swatch);
      expect(theme.navigationRailTheme.unselectedIconTheme?.color, swatch.shade500);
    });

    test('popupMenu textStyle color is shade800', () {
      final theme = fabricLightTheme(mainColor: swatch);
      expect(theme.popupMenuTheme.textStyle?.color, swatch.shade800);
    });

    test('drawer scrimColor and dialog barrierColor are defined', () {
      final theme = fabricLightTheme(mainColor: swatch);
      expect(theme.drawerTheme.scrimColor, isNotNull);
      expect(theme.dialogTheme.barrierColor, isNotNull);
      expect(theme.bottomSheetTheme.modalBarrierColor, isNotNull);
    });

    test('timePicker colors are configured', () {
      final theme = fabricLightTheme(mainColor: swatch);
      expect(theme.timePickerTheme.hourMinuteTextColor, swatch.shade800);
    });

    test('all component themes are configured in light mode', () {
      final theme = fabricLightTheme(mainColor: swatch);
      expect(theme.elevatedButtonTheme.style, isNotNull);
      expect(theme.textButtonTheme.style, isNotNull);
      expect(theme.iconButtonTheme.style, isNotNull);
      expect(theme.toggleButtonsTheme.fillColor, swatch.shade800);
      expect(theme.searchBarTheme.backgroundColor?.resolve(<WidgetState>{}), swatch.shade50);
      expect(theme.bottomAppBarTheme.color, swatch.shade50);
      expect(theme.navigationDrawerTheme.backgroundColor, swatch.shade00);
      expect(theme.carouselViewTheme.backgroundColor, swatch.shade50);
      expect(theme.menuButtonTheme.style, isNotNull);
      expect(theme.scrollbarTheme.radius, const Radius.circular(10));
      expect(theme.iconTheme.size, 24);
      expect(theme.iconTheme.color, isNull);
      expect(theme.inputDecorationTheme.enabledBorder, isA<OutlineInputBorder>());
      expect(theme.floatingActionButtonTheme.elevation, 0);
    });
  });

  group('fabricDarkTheme', () {
    test('has dark brightness', () {
      final theme = fabricDarkTheme(mainColor: swatch);
      expect(theme.colorScheme.brightness, Brightness.dark);
    });

    test('scaffold background is shade900', () {
      final theme = fabricDarkTheme(mainColor: swatch);
      expect(theme.scaffoldBackgroundColor, swatch.shade900);
    });

    test('colorScheme primary is shade00', () {
      final theme = fabricDarkTheme(mainColor: swatch);
      expect(theme.colorScheme.primary, swatch.shade00);
    });

    test('colorScheme onPrimary is shade900', () {
      final theme = fabricDarkTheme(mainColor: swatch);
      expect(theme.colorScheme.onPrimary, swatch.shade900);
    });

    test('colorScheme surface and surfaceContainer roles are configured', () {
      final theme = fabricDarkTheme(mainColor: swatch);
      expect(theme.colorScheme.surface, swatch.shade900);
      expect(theme.colorScheme.surfaceDim, swatch.shade950);
      expect(theme.colorScheme.surfaceBright, swatch.shade600);
      expect(theme.colorScheme.surfaceContainerLowest, swatch.shade950);
      expect(theme.colorScheme.surfaceContainerLow, swatch.shade900);
      expect(theme.colorScheme.surfaceContainer, swatch.shade800);
      expect(theme.colorScheme.surfaceContainerHigh, swatch.shade800);
      expect(theme.colorScheme.surfaceContainerHighest, swatch.shade800);
    });

    test('colorScheme onSurface is shade50', () {
      final theme = fabricDarkTheme(mainColor: swatch);
      expect(theme.colorScheme.onSurface, swatch.shade50);
    });

    test('colorScheme error is Color(0xFFFFB4AB)', () {
      final theme = fabricDarkTheme(mainColor: swatch);
      expect(theme.colorScheme.error, const Color(0xFFFFB4AB));
    });

    test('fontFamily propagates to textTheme', () {
      final theme = fabricDarkTheme(mainColor: swatch, fontFamily: 'Roboto');
      expect(theme.textTheme.bodyLarge?.fontFamily, 'Roboto');
      expect(theme.textTheme.titleMedium?.fontFamily, 'Roboto');
      expect(theme.textTheme.labelSmall?.fontFamily, 'Roboto');
    });

    test('custom swatch changes colors and registers FabricThemeExtension', () {
      final theme = fabricDarkTheme(mainColor: fabricBlue);
      expect(theme.colorScheme.primary, fabricBlue.shade00);
      expect(theme.colorScheme.onPrimary, fabricBlue.shade900);
      expect(
        theme.extension<FabricThemeExtension>()?.swatch,
        fabricBlue,
      );
    });

    test('disabled color is shade400', () {
      final theme = fabricDarkTheme(mainColor: swatch);
      expect(theme.disabledColor, swatch.shade400);
    });

    test('dataTable dataRowColor is shade900', () {
      final theme = fabricDarkTheme(mainColor: swatch);
      expect(theme.dataTableTheme.dataRowColor?.resolve(<WidgetState>{}), swatch.shade900);
    });

    test('popupMenu textStyle color is shade50 in dark mode', () {
      final theme = fabricDarkTheme(mainColor: swatch);
      expect(theme.popupMenuTheme.textStyle?.color, swatch.shade50);
    });

    test('navigationRail unselectedLabelTextStyle is shade500 in dark mode', () {
      final theme = fabricDarkTheme(mainColor: swatch);
      expect(theme.navigationRailTheme.unselectedLabelTextStyle?.color, swatch.shade500);
    });

    test('timePicker helpTextStyle propagates fontFamily', () {
      final lightTheme = fabricLightTheme(mainColor: swatch, fontFamily: 'Roboto');
      final darkTheme = fabricDarkTheme(mainColor: swatch, fontFamily: 'Roboto');
      expect(lightTheme.timePickerTheme.helpTextStyle?.fontFamily, 'Roboto');
      expect(darkTheme.timePickerTheme.helpTextStyle?.fontFamily, 'Roboto');
    });

    test('all component themes are configured in dark mode', () {
      final theme = fabricDarkTheme(mainColor: swatch);
      expect(theme.elevatedButtonTheme.style, isNotNull);
      expect(theme.textButtonTheme.style, isNotNull);
      expect(theme.iconButtonTheme.style, isNotNull);
      expect(theme.toggleButtonsTheme.fillColor, swatch.shade50);
      expect(theme.searchBarTheme.backgroundColor?.resolve(<WidgetState>{}), swatch.shade800);
      expect(theme.bottomAppBarTheme.color, swatch.shade950);
      expect(theme.navigationDrawerTheme.backgroundColor, swatch.shade950);
      expect(theme.carouselViewTheme.backgroundColor, swatch.shade800);
      expect(theme.menuButtonTheme.style, isNotNull);
      expect(theme.scrollbarTheme.radius, const Radius.circular(10));
      expect(theme.iconTheme.size, 24);
      expect(theme.iconTheme.color, isNull);
      expect(theme.inputDecorationTheme.enabledBorder, isA<OutlineInputBorder>());
      expect(theme.floatingActionButtonTheme.elevation, 0);
    });
  });

  group('FabricTheme', () {
    test('creates immutable light and dark themes', () {
      const fabricTheme = FabricTheme(
        color: fabricTeal,
        fontFamily: 'Inter',
      );
      expect(fabricTheme.lightTheme.colorScheme.brightness, Brightness.light);
      expect(fabricTheme.lightTheme.colorScheme.primary, fabricTeal.shade800);
      expect(fabricTheme.darkTheme.colorScheme.brightness, Brightness.dark);
      expect(fabricTheme.darkTheme.colorScheme.primary, fabricTeal.shade00);
    });

    test('static light and dark helpers work with default values and cache instances', () {
      final light = FabricTheme.light();
      final dark = FabricTheme.dark();
      expect(light.colorScheme.primary, fabricGrey.shade800);
      expect(dark.colorScheme.primary, fabricGrey.shade00);
      expect(identical(light, FabricTheme.light()), isTrue);
      expect(identical(dark, FabricTheme.dark()), isTrue);
    });

    test('copyWith and equality work properly', () {
      const base = FabricTheme(color: fabricGrey, fontFamily: 'Roboto');
      final updated = base.copyWith(color: fabricRed);
      expect(updated.color, fabricRed);
      expect(updated.fontFamily, 'Roboto');
      expect(base == const FabricTheme(color: fabricGrey, fontFamily: 'Roboto'), isTrue);
      expect(base == updated, isFalse);
    });
  });

  group('FabricThemeExtension', () {
    test('copyWith and lerp work properly', () {
      const extA = FabricThemeExtension(swatch: fabricGrey);
      const extB = FabricThemeExtension(swatch: fabricBlue);

      expect(extA.copyWith(swatch: fabricRed).swatch, fabricRed);
      expect(extA.lerp(extB, 0.0).swatch.toARGB32(), fabricGrey.toARGB32());
      expect(extA.lerp(extB, 1.0).swatch.toARGB32(), fabricBlue.toARGB32());
    });

    testWidgets('context.fabricSwatch and context.fabricTokens read active tokens from Theme', (WidgetTester tester) async {
      late FabricSwatch resolvedSwatch;
      late FabricThemeExtension resolvedTokens;
      await tester.pumpWidget(
        MaterialApp(
          theme: FabricTheme.light(color: fabricPurple),
          home: Builder(
            builder: (BuildContext context) {
              resolvedSwatch = context.fabricSwatch;
              resolvedTokens = context.fabricTokens;
              return const SizedBox.shrink();
            },
          ),
        ),
      );
      expect(resolvedSwatch, fabricPurple);
      expect(resolvedTokens.mutedForeground, fabricPurple.shade500);
      expect(resolvedTokens.borderColor, fabricPurple.shade200);
      expect(resolvedTokens.surfaceElevated, fabricPurple.shade50);
    });
  });
}
