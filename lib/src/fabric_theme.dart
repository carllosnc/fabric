import 'package:flutter/material.dart';
import 'fabric_colors.dart';
import 'fabric_swatch.dart';
import 'themes/fabric_theme_builder.dart';

@immutable
class FabricTheme {
  const FabricTheme({
    this.color = fabricGrey,
    this.fontFamily,
    this.textTheme,
  });

  final FabricSwatch color;
  final String? fontFamily;
  final TextTheme? textTheme;

  ThemeData get lightTheme => light(
        color: color,
        fontFamily: fontFamily,
        textTheme: textTheme,
      );

  ThemeData get darkTheme => dark(
        color: color,
        fontFamily: fontFamily,
        textTheme: textTheme,
      );

  static ThemeData light({
    FabricSwatch color = fabricGrey,
    String? fontFamily,
    TextTheme? textTheme,
  }) {
    return fabricLightTheme(
      mainColor: color,
      fontFamily: fontFamily,
      textTheme: textTheme,
    );
  }

  static ThemeData dark({
    FabricSwatch color = fabricGrey,
    String? fontFamily,
    TextTheme? textTheme,
  }) {
    return fabricDarkTheme(
      mainColor: color,
      fontFamily: fontFamily,
      textTheme: textTheme,
    );
  }

  FabricTheme copyWith({
    FabricSwatch? color,
    String? fontFamily,
    TextTheme? textTheme,
  }) {
    return FabricTheme(
      color: color ?? this.color,
      fontFamily: fontFamily ?? this.fontFamily,
      textTheme: textTheme ?? this.textTheme,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    return other is FabricTheme &&
        other.color == color &&
        other.fontFamily == fontFamily &&
        other.textTheme == textTheme;
  }

  @override
  int get hashCode => Object.hash(color, fontFamily, textTheme);
}
