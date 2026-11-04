## 0.0.7

* Introduce immutable `FabricTheme` (`FabricTheme.light`, `FabricTheme.dark`, `copyWith`) and public `FabricConfig`.
* Add `FabricThemeExtension` (`ThemeExtension`) exposing `context.fabricTokens` and `context.fabricSwatch` with `FabricSwatch.lerp` support.
* Refocus package as a pure, lightweight Theme Layer for Material 3 without proprietary custom widgets.
* Modularize and unify light and dark theme builders under `lib/src/` eliminating code duplication.
* Populate all Material 3 `ColorScheme` surface container roles (`surfaceDim`, `surfaceBright`, `surfaceContainerLowest`..`surfaceContainerHighest`).
* Support custom `TextTheme` (enabling `google_fonts` compatibility).
* Add interactive theme mode and swatch switcher to the `example` app with new showcase pages.
* Enable strict analyzer checks (`strict-casts`, `strict-inference`, `strict-raw-types`) and upgrade to Dart `^3.13.0` / Flutter `^3.47.0`.

## 0.0.6

* Harmonize light and dark themes and add missing Material 3 component themes (`ElevatedButton`, `TextButton`, `IconButton`, `SearchBar`, `BottomAppBar`).
* Add 4 new desaturated swatches (`fabricPurple`, `fabricTeal`, `fabricOrange`, `fabricPink`).
* Upgrade to Dart `^3.12.0` and Flutter `^3.44.0` and migrate `Radio` to `RadioGroup`.

## 0.0.1

* Initial release of the Fabric Material 3 theme package.
