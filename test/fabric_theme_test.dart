import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fabric/fabric.dart';
import 'package:fabric/fabric_light_theme.dart';
import 'package:fabric/fabric_dark_theme.dart';

void main() {
  final swatch = fabricGrey;

  group('fabricLightTheme', () {
    test('has light brightness', () {
      final theme = fabricLightTheme(mainColor: swatch);
      expect(theme.colorScheme.brightness, Brightness.light);
    });

    test('scaffold background is shade00 (white)', () {
      final theme = fabricLightTheme(mainColor: swatch);
      expect(theme.scaffoldBackgroundColor, swatch.shade00);
    });

    test('colorScheme primary is shade950', () {
      final theme = fabricLightTheme(mainColor: swatch);
      expect(theme.colorScheme.primary, swatch.shade950);
    });

    test('colorScheme onPrimary is shade00', () {
      final theme = fabricLightTheme(mainColor: swatch);
      expect(theme.colorScheme.onPrimary, swatch.shade00);
    });

    test('colorScheme surface is shade50', () {
      final theme = fabricLightTheme(mainColor: swatch);
      expect(theme.colorScheme.surface, swatch.shade50);
    });

    test('colorScheme onSurface is shade900', () {
      final theme = fabricLightTheme(mainColor: swatch);
      expect(theme.colorScheme.onSurface, swatch.shade900);
    });

    test('colorScheme error is Color(0xFFBA1A1A)', () {
      final theme = fabricLightTheme(mainColor: swatch);
      expect(theme.colorScheme.error, const Color(0xFFBA1A1A));
    });

    test('fontFamily propagates to textTheme', () {
      final theme = fabricLightTheme(mainColor: swatch, fontFamily: 'Roboto');
      expect(theme.textTheme.bodyLarge?.fontFamily, 'Roboto');
      expect(theme.textTheme.titleMedium?.fontFamily, 'Roboto');
      expect(theme.textTheme.labelSmall?.fontFamily, 'Roboto');
    });

    test('custom swatch changes colors', () {
      final theme = fabricLightTheme(mainColor: fabricBlue);
      expect(theme.colorScheme.primary, fabricBlue.shade950);
      expect(theme.colorScheme.onPrimary, fabricBlue.shade00);
    });

    test('disabled color is shade400', () {
      final theme = fabricLightTheme(mainColor: swatch);
      expect(theme.disabledColor, swatch.shade400);
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

    test('colorScheme surface is shade700', () {
      final theme = fabricDarkTheme(mainColor: swatch);
      expect(theme.colorScheme.surface, swatch.shade700);
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

    test('custom swatch changes colors', () {
      final theme = fabricDarkTheme(mainColor: fabricBlue);
      expect(theme.colorScheme.primary, fabricBlue.shade00);
      expect(theme.colorScheme.onPrimary, fabricBlue.shade900);
    });

    test('disabled color is shade400', () {
      final theme = fabricDarkTheme(mainColor: swatch);
      expect(theme.disabledColor, swatch.shade400);
    });
  });
}
