import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fabric/fabric.dart';

void main() {
  group('fabricConfig', () {
    test('color defaults to fabricGrey', () {
      expect(fabricConfig.color, fabricGrey);
      expect(fabricConfig.color, isA<FabricSwatch>());
    });

    test('fontFamily defaults to null', () {
      expect(fabricConfig.fontFamily, isNull);
    });

    test('getLightTheme returns ThemeData with light brightness', () {
      final theme = fabricConfig.getLightTheme();
      expect(theme, isA<ThemeData>());
      expect(theme.colorScheme.brightness, Brightness.light);
    });

    test('getDarkTheme returns ThemeData with dark brightness', () {
      final theme = fabricConfig.getDarkTheme();
      expect(theme, isA<ThemeData>());
      expect(theme.colorScheme.brightness, Brightness.dark);
    });

    test('color change propagates to getLightTheme', () {
      final original = fabricConfig.getLightTheme();
      expect(original.colorScheme.primary, fabricGrey.shade950);

      fabricConfig.color = fabricBlue;
      final updated = fabricConfig.getLightTheme();
      expect(updated.colorScheme.primary, fabricBlue.shade950);

      fabricConfig.color = fabricGrey;
    });

    test('color change propagates to getDarkTheme', () {
      fabricConfig.color = fabricRed;
      final updated = fabricConfig.getDarkTheme();
      expect(updated.colorScheme.primary, fabricRed.shade00);

      fabricConfig.color = fabricGrey;
    });

    test('fontFamily change propagates to getLightTheme', () {
      fabricConfig.fontFamily = 'Roboto';
      final theme = fabricConfig.getLightTheme();
      expect(theme.textTheme.bodyLarge?.fontFamily, 'Roboto');

      fabricConfig.fontFamily = null;
    });

    test('fontFamily change propagates to getDarkTheme', () {
      fabricConfig.fontFamily = 'Roboto';
      final theme = fabricConfig.getDarkTheme();
      expect(theme.textTheme.bodyLarge?.fontFamily, 'Roboto');

      fabricConfig.fontFamily = null;
    });
  });
}
