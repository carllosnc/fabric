import 'package:neutral/dark_theme.dart';
import 'package:neutral/light_theme.dart';

import 'colors.dart';
import 'fabric_color.dart';

class _Fabric {
  String fontFamily = "BricolageGrotesque";
  FabricColor mainColor = fabricGrey;

  getLightTheme() {
    return neutralLightTheme(
      mainColor: mainColor,
      fontFamily: fontFamily,
    );
  }

  getDarkTheme() {
    return neutralDarkTheme(
      mainColor: mainColor,
      fontFamily: fontFamily,
    );
  }
}

var fabric = _Fabric();
