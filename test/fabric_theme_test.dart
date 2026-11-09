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
      expect(theme.badgeTheme.textStyle?.fontFamily, 'Roboto');
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

    test('fabric typography scale has balanced compact sizes', () {
      final theme = fabricLightTheme(mainColor: swatch);
      final textTheme = theme.textTheme;

      expect(textTheme.displayLarge?.fontSize, 40);
      expect(textTheme.displayMedium?.fontSize, 34);
      expect(textTheme.displaySmall?.fontSize, 28);

      expect(textTheme.headlineLarge?.fontSize, 24);
      expect(textTheme.headlineMedium?.fontSize, 22);
      expect(textTheme.headlineSmall?.fontSize, 20);

      expect(textTheme.titleLarge?.fontSize, 18);
      expect(textTheme.titleMedium?.fontSize, 16);
      expect(textTheme.titleSmall?.fontSize, 14);

      expect(textTheme.bodyLarge?.fontSize, 16);
      expect(textTheme.bodyMedium?.fontSize, 14);
      expect(textTheme.bodySmall?.fontSize, 12);

      expect(textTheme.labelLarge?.fontSize, 14);
      expect(textTheme.labelMedium?.fontSize, 12);
      expect(textTheme.labelSmall?.fontSize, 11);
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

    test('popupMenu textStyle color is shade800 and uses regular font', () {
      final theme = fabricLightTheme(mainColor: swatch);
      expect(theme.popupMenuTheme.textStyle?.color, swatch.shade800);
      expect(theme.popupMenuTheme.textStyle?.fontWeight, FontWeight.normal);
      expect(
        theme.popupMenuTheme.labelTextStyle?.resolve(<WidgetState>{})?.fontWeight,
        FontWeight.normal,
      );
      expect(theme.dropdownMenuTheme.textStyle?.fontWeight, FontWeight.normal);
      expect(
        theme.menuButtonTheme.style?.textStyle?.resolve(<WidgetState>{})?.fontWeight,
        FontWeight.normal,
      );
    });

    test('drawer scrimColor and dialog barrierColor are defined', () {
      final theme = fabricLightTheme(mainColor: swatch);
      expect(theme.drawerTheme.scrimColor, isNotNull);
      expect(theme.dialogTheme.barrierColor, isNotNull);
      expect(theme.bottomSheetTheme.modalBarrierColor, isNotNull);
      expect(theme.bottomSheetTheme.backgroundColor, theme.scaffoldBackgroundColor);
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
      expect(theme.toggleButtonsTheme.fillColor, swatch.shade200);
      expect(theme.toggleButtonsTheme.borderColor, swatch.shade300);
      expect(theme.toggleButtonsTheme.borderWidth, 1);
      expect(theme.segmentedButtonTheme.style, isNotNull);
      expect(theme.searchBarTheme.backgroundColor?.resolve(<WidgetState>{}), swatch.shade50);
      expect(theme.searchBarTheme.side, isNull);
      expect(theme.bottomAppBarTheme.color, swatch.shade50);
      expect(theme.navigationDrawerTheme.backgroundColor, swatch.shade00);
      expect(theme.carouselViewTheme.backgroundColor, swatch.shade50);
      expect(theme.menuButtonTheme.style, isNotNull);
      expect(theme.scrollbarTheme.radius, const Radius.circular(10));
      expect(theme.iconTheme.size, 24);
      expect(theme.iconTheme.color, isNull);
      expect(theme.inputDecorationTheme.enabledBorder, isA<OutlineInputBorder>());
      expect(theme.floatingActionButtonTheme.elevation, 0);
      expect(theme.bannerTheme.backgroundColor, swatch.shade50);
      expect(theme.bannerTheme.dividerColor, swatch.shade200);
      expect(theme.bannerTheme.leadingPadding, const EdgeInsetsDirectional.only(end: 12.0));
      expect(theme.bannerTheme.padding, const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 2.0));
      expect(theme.badgeTheme.alignment, AlignmentDirectional.topEnd);
      expect(theme.badgeTheme.offset, const Offset(0, 0));
      expect(theme.badgeTheme.smallSize, 6);
      expect(theme.badgeTheme.largeSize, 16);
      expect(theme.badgeTheme.padding, const EdgeInsets.symmetric(horizontal: 5));
      expect(theme.badgeTheme.backgroundColor, const Color(0xFFBA1A1A));
      expect(theme.badgeTheme.textColor, swatch.shade00);
      final RoundedRectangleBorder cardShape =
          theme.cardTheme.shape as RoundedRectangleBorder;
      expect(cardShape.side.color, swatch.shade200);
      expect(cardShape.side.width, 1);
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
      expect(theme.badgeTheme.textStyle?.fontFamily, 'Roboto');
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

    test('dataTable dataRowColor is shade900 and resolves states', () {
      final theme = fabricDarkTheme(mainColor: swatch);
      expect(theme.dataTableTheme.dataRowColor?.resolve(<WidgetState>{}), swatch.shade900);
      expect(theme.dataTableTheme.dataRowColor?.resolve(<WidgetState>{WidgetState.selected}), swatch.shade800);
      expect(theme.dataTableTheme.headingRowColor?.resolve(<WidgetState>{}), swatch.shade800);
      expect(theme.dataTableTheme.columnSpacing, 28);
      expect(theme.dataTableTheme.headingRowHeight, 44);
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
      expect(theme.toggleButtonsTheme.fillColor, swatch.shade700);
      expect(theme.toggleButtonsTheme.borderColor, swatch.shade700);
      expect(theme.toggleButtonsTheme.borderWidth, 1);
      expect(theme.segmentedButtonTheme.style, isNotNull);
      expect(theme.searchBarTheme.backgroundColor?.resolve(<WidgetState>{}), swatch.shade800);
      expect(theme.searchBarTheme.side, isNull);
      expect(theme.bottomSheetTheme.backgroundColor, theme.scaffoldBackgroundColor);
      expect(theme.bottomAppBarTheme.color, swatch.shade950);
      expect(theme.navigationDrawerTheme.backgroundColor, swatch.shade950);
      expect(theme.carouselViewTheme.backgroundColor, swatch.shade800);
      expect(theme.menuButtonTheme.style, isNotNull);
      expect(theme.scrollbarTheme.radius, const Radius.circular(10));
      expect(theme.iconTheme.size, 24);
      expect(theme.iconTheme.color, isNull);
      expect(theme.inputDecorationTheme.enabledBorder, isA<OutlineInputBorder>());
      expect(theme.floatingActionButtonTheme.elevation, 0);
      expect(theme.bannerTheme.backgroundColor, swatch.shade800);
      expect(theme.bannerTheme.dividerColor, swatch.shade700);
      expect(theme.bannerTheme.leadingPadding, const EdgeInsetsDirectional.only(end: 12.0));
      expect(theme.bannerTheme.padding, const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 2.0));
      expect(theme.badgeTheme.alignment, AlignmentDirectional.topEnd);
      expect(theme.badgeTheme.offset, const Offset(0, 0));
      expect(theme.badgeTheme.smallSize, 6);
      expect(theme.badgeTheme.largeSize, 16);
      expect(theme.badgeTheme.padding, const EdgeInsets.symmetric(horizontal: 5));
      expect(theme.badgeTheme.backgroundColor, const Color(0xFFFFB4AB));
      expect(theme.badgeTheme.textColor, swatch.shade950);
      final RoundedRectangleBorder cardShape =
          theme.cardTheme.shape as RoundedRectangleBorder;
      expect(cardShape.side.color, swatch.shade700);
      expect(cardShape.side.width, 1);
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

    test('SegmentedButton and ToggleButtons have restored borders and softened selected colors', () {
      final lightTheme = fabricLightTheme(mainColor: swatch);
      final darkTheme = fabricDarkTheme(mainColor: swatch);

      // Light mode SegmentedButton
      final lightSegStyle = lightTheme.segmentedButtonTheme.style!;
      expect(lightSegStyle.side?.resolve(<WidgetState>{})?.color, swatch.shade300);
      expect(lightSegStyle.side?.resolve(<WidgetState>{})?.width, 1);
      expect(lightSegStyle.side?.resolve(<WidgetState>{WidgetState.disabled})?.color, swatch.shade200);
      expect(lightSegStyle.backgroundColor?.resolve(<WidgetState>{}), Colors.transparent);
      expect(lightSegStyle.backgroundColor?.resolve(<WidgetState>{WidgetState.selected}), swatch.shade200);
      expect(lightSegStyle.foregroundColor?.resolve(<WidgetState>{}), swatch.shade600);
      expect(lightSegStyle.foregroundColor?.resolve(<WidgetState>{WidgetState.selected}), swatch.shade900);

      // Light mode ToggleButtons
      final lightToggle = lightTheme.toggleButtonsTheme;
      expect(lightToggle.borderWidth, 1);
      expect(lightToggle.borderColor, swatch.shade300);
      expect(lightToggle.selectedBorderColor, swatch.shade400);
      expect(lightToggle.disabledBorderColor, swatch.shade200);
      expect(lightToggle.fillColor, swatch.shade200);
      expect(lightToggle.color, swatch.shade600);
      expect(lightToggle.selectedColor, swatch.shade900);

      // Dark mode SegmentedButton
      final darkSegStyle = darkTheme.segmentedButtonTheme.style!;
      expect(darkSegStyle.side?.resolve(<WidgetState>{})?.color, swatch.shade700);
      expect(darkSegStyle.side?.resolve(<WidgetState>{})?.width, 1);
      expect(darkSegStyle.side?.resolve(<WidgetState>{WidgetState.disabled})?.color, swatch.shade800);
      expect(darkSegStyle.backgroundColor?.resolve(<WidgetState>{}), Colors.transparent);
      expect(darkSegStyle.backgroundColor?.resolve(<WidgetState>{WidgetState.selected}), swatch.shade700);
      expect(darkSegStyle.foregroundColor?.resolve(<WidgetState>{}), swatch.shade400);
      expect(darkSegStyle.foregroundColor?.resolve(<WidgetState>{WidgetState.selected}), swatch.shade50);

      // Dark mode ToggleButtons
      final darkToggle = darkTheme.toggleButtonsTheme;
      expect(darkToggle.borderWidth, 1);
      expect(darkToggle.borderColor, swatch.shade700);
      expect(darkToggle.selectedBorderColor, swatch.shade600);
      expect(darkToggle.disabledBorderColor, swatch.shade800);
      expect(darkToggle.fillColor, swatch.shade700);
      expect(darkToggle.color, swatch.shade400);
      expect(darkToggle.selectedColor, swatch.shade50);
    });

    testWidgets('SearchAnchor expanded view input does not have a border', (WidgetTester tester) async {
      final theme = fabricLightTheme(mainColor: swatch);
      final searchController = SearchController();

      await tester.pumpWidget(
        MaterialApp(
          theme: theme,
          home: Scaffold(
            body: SearchAnchor(
              searchController: searchController,
              builder: (BuildContext context, SearchController controller) {
                return SearchBar(
                  controller: controller,
                  onTap: () => controller.openView(),
                );
              },
              suggestionsBuilder: (BuildContext context, SearchController controller) {
                return <Widget>[const ListTile(title: Text('Result 1'))];
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(SearchBar));
      await tester.pumpAndSettle();

      final searchBars = tester.widgetList<SearchBar>(find.byType(SearchBar));
      expect(searchBars.length, greaterThan(1));
      final expandedSearchBar = searchBars.last;

      final BuildContext viewContext = tester.element(find.byType(SearchBar).last);
      final searchBarTheme = SearchBarTheme.of(viewContext);
      final effectiveSide = expandedSearchBar.side?.resolve(<WidgetState>{}) ?? searchBarTheme.side?.resolve(<WidgetState>{});
      expect(effectiveSide == null || effectiveSide == BorderSide.none, isTrue);
    });

    testWidgets('Badge on IconButton aligns to topEnd with refined theme', (WidgetTester tester) async {
      final theme = fabricLightTheme(mainColor: swatch);
      await tester.pumpWidget(
        MaterialApp(
          theme: theme,
          home: Scaffold(
            body: Center(
              child: Badge(
                label: const Text('99+'),
                child: IconButton(
                  icon: const Icon(Icons.star_border_outlined, size: 24.0),
                  onPressed: () {},
                ),
              ),
            ),
          ),
        ),
      );

      final iconRect = tester.getRect(find.byIcon(Icons.star_border_outlined));
      final badgeContainer = find.descendant(
        of: find.byType(Badge),
        matching: find.byType(Container),
      ).first;
      final badgeRect = tester.getRect(badgeContainer);

      expect(badgeRect.left, greaterThanOrEqualTo(iconRect.left));
      expect(badgeRect.right, greaterThan(iconRect.right));
      expect(badgeRect.top, lessThan(iconRect.top));
    });
  });
}
