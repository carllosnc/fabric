import 'fabric_dark_theme.dart';
import 'fabric_light_theme.dart';
import 'fabric_colors.dart';
import 'fabric_swatch.dart';

class _FabricConfig {
  String? fontFamily;
  FabricSwatch color = fabricGrey;

  getLightTheme() {
    return fabricLightTheme(
      mainColor: color,
      fontFamily: fontFamily,
    );
  }

  getDarkTheme() {
    return fabricDarkTheme(
      mainColor: color,
      fontFamily: fontFamily,
    );
  }
}

var fabricConfig = _FabricConfig();
