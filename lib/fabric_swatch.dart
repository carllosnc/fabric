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
}
