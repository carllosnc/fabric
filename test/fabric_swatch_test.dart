import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fabric/fabric.dart';

void main() {
  group('FabricSwatch', () {
    const swatch = FabricSwatch(
      0xFF123456,
      <int, Color>{
        50: Color(0xFFFFFBF0),
        100: Color(0xFFFFF0D0),
        200: Color(0xFFFFE0A0),
        300: Color(0xFFFFD070),
        400: Color(0xFFFFC050),
        500: Color(0xFFFFB030),
        600: Color(0xFFFFA010),
        700: Color(0xFFFF9000),
        800: Color(0xFFFF8000),
        900: Color(0xFFFF7000),
        950: Color(0xFF123456),
      },
    );

    test('value matches the primary color passed to constructor', () {
      expect(swatch.toARGB32(), 0xFF123456);
    });

    test('shade00 returns Colors.white', () {
      expect(swatch.shade00, Colors.white);
    });

    test('shade50 returns the 50 shade', () {
      expect(swatch.shade50, const Color(0xFFFFFBF0));
    });

    test('shade100 returns the 100 shade', () {
      expect(swatch.shade100, const Color(0xFFFFF0D0));
    });

    test('shade200 returns the 200 shade', () {
      expect(swatch.shade200, const Color(0xFFFFE0A0));
    });

    test('shade300 returns the 300 shade', () {
      expect(swatch.shade300, const Color(0xFFFFD070));
    });

    test('shade400 returns the 400 shade', () {
      expect(swatch.shade400, const Color(0xFFFFC050));
    });

    test('shade500 returns the 500 shade', () {
      expect(swatch.shade500, const Color(0xFFFFB030));
    });

    test('shade600 returns the 600 shade', () {
      expect(swatch.shade600, const Color(0xFFFFA010));
    });

    test('shade700 returns the 700 shade', () {
      expect(swatch.shade700, const Color(0xFFFF9000));
    });

    test('shade800 returns the 800 shade', () {
      expect(swatch.shade800, const Color(0xFFFF8000));
    });

    test('shade900 returns the 900 shade', () {
      expect(swatch.shade900, const Color(0xFFFF7000));
    });

    test('shade950 returns the 950 shade', () {
      expect(swatch.shade950, const Color(0xFF123456));
    });

    test('[] operator returns correct color for valid key', () {
      expect(swatch[50], const Color(0xFFFFFBF0));
      expect(swatch[950], const Color(0xFF123456));
    });

    test('[] operator returns null for missing key', () {
      expect(swatch[999], isNull);
    });
  });
}
