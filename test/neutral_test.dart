import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fabric/fabric.dart';

void main() {
  test('should return a valid theme', () {
    expect(fabricConfig.getLightTheme(), isA<ThemeData>());
    expect(fabricConfig.getDarkTheme(), isA<ThemeData>());
  });

  test('color should return a valid custom swatch', () {
    expect(fabricConfig.color, isA<FabricSwatch>());
  });

  test('fontFamily should initialize with null value', () {
    expect(fabricConfig.fontFamily, isNull);
  });
}
