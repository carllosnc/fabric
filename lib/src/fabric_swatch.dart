import 'package:flutter/material.dart';

class FabricSwatch extends ColorSwatch<int> {
  const FabricSwatch(super.primary, super.swatch);

  Color get shade00 => Colors.white;
  Color get shade50 => this[50]!;
  Color get shade100 => this[100]!;
  Color get shade200 => this[200]!;
  Color get shade300 => this[300]!;
  Color get shade400 => this[400]!;
  Color get shade500 => this[500]!;
  Color get shade600 => this[600]!;
  Color get shade700 => this[700]!;
  Color get shade800 => this[800]!;
  Color get shade900 => this[900]!;
  Color get shade950 => this[950]!;

  static const List<int> shadeKeys = <int>[
    50,
    100,
    200,
    300,
    400,
    500,
    600,
    700,
    800,
    900,
    950,
  ];

  static FabricSwatch? lerp(FabricSwatch? a, FabricSwatch? b, double t) {
    if (identical(a, b)) {
      return a;
    }
    if (a == null) {
      return b;
    }
    if (b == null) {
      return a;
    }
    final Map<int, Color> swatch = <int, Color>{
      for (final int key in shadeKeys)
        key: Color.lerp(a[key], b[key], t)!,
    };
    return FabricSwatch(
      Color.lerp(Color(a.toARGB32()), Color(b.toARGB32()), t)!.toARGB32(),
      swatch,
    );
  }
}
