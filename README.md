# Fabric

> Fabric is a custom theme based on Material 3 design system for Flutter.

## Widgets

- ✅ AlertDialog
- ✅ AppBar
- ✅ Badge
- ✅ BottomNavigationBar
- ✅ BottomSheet
- ✅ Button(Filled, Outlined, TextButton)
- ✅ Cards
- ✅ Checkbox
- ✅ Chip
- ✅ DatePicker
- ✅ DataTable
- ✅ Dialog
- ✅ Drawer
- ✅ Indicators(LinearProgressIndicator, CircularProgressIndicator)
- ✅ ListTile
- ✅ MaterialBanner
- ✅ NavigationBar
- ✅ NavigationRail
- ✅ PopupMenu(MenuItem, Submenu)
- ✅ RadioButton
- ✅ Scaffold
- ✅ SearchAnchor
- ✅ SegmentedButton
- ✅ Slider
- ✅ SnackBar
- ✅ Switch
- ✅ TabBar
- ✅ Text
- ✅ TextButton
- ✅ TextField
- ✅ TextSelection
- ✅ TimePicker
- ❌ Stepper (Currently not working, the widget does not use theme data to style itself)

## Install

This is a unpublished package, so you need to add it to your `pubspec.yaml` file.

```yml
dependencies:
  fabric:
    git:
      url: https://github.com/carllosnc/fabric.git
```

To more information about unplublished packages, see: https://dart.dev/tools/pub/package-layout#unpublished-pac

## Usage

```dart
import 'package:fabric/fabric.dart';

return MaterialApp(
  theme: fabricConfig.getLightTheme(),
  darkTheme: fabricConfig.getDarkTheme(),
);
```

## `fabricConfig`

Is the main object that contains all features of the library.

| Feature                     | Description                     |
|-----------------------------|---------------------------------|
| `fabricConfig.fabricLightTheme()` | Apply light theme         |
| `fabricConfig.fabricDarkTheme()`  | Apply dark theme          |
| `fabricConfig.fabricColor`        | Fabric's color palette    |
| `fabricConfig.fontFamily`         | Font family               |

**How to change the main color and font family?**

```dart
import 'package:fabric/fabric.dart';

void main() {
  fabricConfig.color = fabricRed;
  fabricConfig.fontFamily = "BricolageGrotesque";

  runApp(const App());
}
```

> [!WARNING]
> For now, Fabric does not support google_fonts package.

## Fabric Swatch

Fabric provides these following colors:

- `fabricGrey` - Tons of greys
- `fabricBlue` - Tons of blues
- `fabricRed` - Tons of reds
- `fabricGreen` - Tons of greens

**How to create your own color palette?**

```dart
FabricSwatch fabricGrey = FabricSwatch(
  0xFF0A0A0A,
  <int, Color>{
    50: Color(0xFFE5E5E5),
    100: Color(0xFFCCCCCC),
    200: Color(0xFFB3B3B3),
    300: Color(0xFF9B9B9B),
    400: Color(0xFF838383),
    500: Color(0xFF6D6D6D),
    600: Color(0xFF575757),
    700: Color(0xFF424242),
    800: Color(0xFF2E2E2E),
    900: Color(0xFF1B1B1B),
    950: Color(0xFF0A0A0A),
  },
);
```

The `FabricSwatch` class extends `ColorSwatch` to provide a convenient way
to access predefined shades of a color. Each shade is represented by an integer
key, such as 50, 100, 200, etc., and corresponds to a specific `Color`.

## Resources

| Resource Name                     | Description                                      |
|-----------------------------------|--------------------------------------------------|
| [Flutter Material Widgets](https://docs.flutter.dev/ui/widgets/material) | Official documentation for Material widgets in Flutter. |
| [Color Shades Generator](https://colorkit.co/color-shades-generator/030d00/) | Tool to generate color shades for design purposes.       |

## Known Issues

- [Stepper widget has hardcoded colors](https://github.com/flutter/flutter/issues/102558)

## Examples

<img src="prints/fabric_01.jpeg">
<img src="prints/fabric_02.jpeg">
<img src="prints/fabric_03.jpeg">
<img src="prints/fabric_04.jpeg">
<img src="prints/fabric_05.jpeg">
<img src="prints/fabric_06.jpeg">
<img src="prints/fabric_07.jpeg">
<img src="prints/fabric_08.jpeg">
<img src="prints/fabric_09.jpeg">

## Fonts

- [Schibsted Grotesk](https://fonts.google.com/specimen/Schibsted+Grotesk?query=gro)
- [Bricolage Grotesque](https://fonts.google.com/specimen/Bricolage+Grotesque?query=gro)
- [Hanken Grotesk](https://fonts.google.com/specimen/Hanken+Grotesk?query=gro)
- [Roboto](https://fonts.google.com/specimen/Roboto?query=inter)
- [Inter](https://fonts.google.com/specimen/Inter?query=inter)
- [Geist](https://fonts.google.com/specimen/Geist?query=geist)

---

Carlos Costa @ 2025