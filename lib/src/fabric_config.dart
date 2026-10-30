import 'package:flutter/material.dart';
import 'fabric_colors.dart';
import 'fabric_swatch.dart';
import 'themes/fabric_theme_builder.dart';

class FabricConfig {
  String? fontFamily;
  TextTheme? textTheme;
  FabricSwatch color = fabricGrey;

  ThemeData getLightTheme() {
    return fabricLightTheme(
      mainColor: color,
      fontFamily: fontFamily,
      textTheme: textTheme,
    );
  }

  ThemeData getDarkTheme() {
    return fabricDarkTheme(
      mainColor: color,
      fontFamily: fontFamily,
      textTheme: textTheme,
    );
  }
}

final FabricConfig fabricConfig = FabricConfig();
