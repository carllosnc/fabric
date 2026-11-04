# Fabric

> A modern, minimal and pure Theme Layer for Flutter based on Material 3, crafted with charcoal tones, subtle 1px perimeter borders, and refined Inter typography. Zero custom widgets — 100% native Flutter widgets themed out-of-the-box.

[![CI](https://github.com/carllosnc/fabric/actions/workflows/ci.yml/badge.svg)](https://github.com/carllosnc/fabric/actions/workflows/ci.yml)
![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?logo=Flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-%230175C2.svg?logo=Dart&logoColor=white)

---

## Architecture & Philosophy

Fabric is strictly a **pure theme layer**. It does not create custom widget wrappers or proprietary UI components. 

Whenever Flutter exposes a `*ThemeData` (e.g. `CardThemeData`, `InputDecorationTheme`, `ElevatedButtonThemeData`, `DataTableThemeData`, `SearchBarThemeData`), Fabric styles it directly. You build your application using standard, official Flutter widgets (`Card`, `TextField`, `ElevatedButton`, `Dialog`, `Chip`, `Slider`, `DataTable`, `SearchBar`, `MaterialBanner`), and they automatically acquire the modern Fabric design system aesthetics.

---

## Installation

Add Fabric to your `pubspec.yaml`:

```yaml
dependencies:
  fabric:
    git:
      url: https://github.com/carllosnc/fabric.git
```

---

## Quick Start

### 1. Declarative `FabricTheme` (Recommended)

```dart
import 'package:fabric/fabric.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const fabricTheme = FabricTheme(
      color: fabricGrey,
      fontFamily: 'Inter',
    );

    return MaterialApp(
      title: 'Fabric App',
      theme: fabricTheme.lightTheme,
      darkTheme: fabricTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const MyHomePage(),
    );
  }
}
```

Or instantiate directly via static factories:

```dart
MaterialApp(
  theme: FabricTheme.light(color: fabricBlue, fontFamily: 'Inter'),
  darkTheme: FabricTheme.dark(color: fabricBlue, fontFamily: 'Inter'),
);
```

### 2. Accessing Design Tokens & Active Swatch

Fabric includes a built-in `ThemeExtension` accessible anywhere via `BuildContext`:

```dart
// Access semantic status colors and surface tokens
final tokens = context.fabricTokens;
tokens.borderColor;       // Subtle 1px perimeter border (shade200 light / shade700 dark)
tokens.surfaceElevated;   // Soft elevated card/container surface (shade50 light / shade800 dark)
tokens.mutedForeground;   // Refined secondary text color (shade500 light / shade400 dark)
tokens.successColor;      // Semantic green
tokens.warningColor;      // Semantic amber
tokens.infoColor;         // Semantic blue

// Access the active palette swatch
final swatch = context.fabricSwatch;
Container(color: swatch.shade100);
```

---

## 46+ Native M3 Widgets Themed by Fabric

All standard Flutter widgets below are styled centrally through `FabricTheme` with zero wrappers needed:

| Category | Themed Flutter Widgets |
| :--- | :--- |
| **Buttons & Actions** | `ElevatedButton`, `FilledButton`, `FilledButton.tonal`, `OutlinedButton`, `TextButton`, `IconButton`, `FloatingActionButton`, `SegmentedButton`, `ToggleButtons` |
| **Inputs & Forms** | `TextField`, `TextFormField`, `InputDecoration`, `DropdownMenu`, `SearchBar`, `SearchAnchor`, `SearchView`, `Checkbox`, `Radio`, `Switch`, `Slider`, `RangeSlider` |
| **Surfaces & Cards** | `Card`, `BottomSheet`, `ExpansionTile`, `ListTile`, `DataTable`, `PaginatedDataTable`, `Divider`, `CarouselView` |
| **Navigation** | `AppBar`, `SliverAppBar`, `NavigationBar`, `BottomNavigationBar`, `NavigationRail`, `Drawer`, `NavigationDrawer`, `MenuBar`, `MenuAnchor`, `TabBar` |
| **Feedback & Overlays** | `AlertDialog`, `Dialog`, `SnackBar`, `LinearProgressIndicator`, `CircularProgressIndicator`, `Tooltip`, `DatePicker`, `TimePicker` |
| **Typography** | Full Material 3 `TextTheme` tuned for `Inter` with progressive negative letter-spacing and proportional line heights |

---

## Fabric Color Swatches

Fabric includes 8 hand-tuned, balanced color swatches with 11 shade stops (`50` to `950`):

- `fabricGrey` (Default modern charcoal)
- `fabricBlue`
- `fabricRed`
- `fabricGreen`
- `fabricPurple`
- `fabricTeal`
- `fabricOrange`
- `fabricPink`

### Creating a Custom Swatch

```dart
const FabricSwatch customBrand = FabricSwatch(
  0xFF0F172A,
  <int, Color>{
    50: Color(0xFFF8FAFC),
    100: Color(0xFFF1F5F9),
    200: Color(0xFFE2E8F0),
    300: Color(0xFFCBD5E1),
    400: Color(0xFF94A3B8),
    500: Color(0xFF64748B),
    600: Color(0xFF475569),
    700: Color(0xFF334155),
    800: Color(0xFF1E293B),
    900: Color(0xFF0F172A),
    950: Color(0xFF020617),
  },
);
```

---

## Showcase & Screenshots

| Tokens & Swatches (Light) | Tokens & Swatches (Dark) | Buttons & Segmented |
| :---: | :---: | :---: |
| <img src="prints/fabric_01.png" width="260" alt="Fabric Tokens Light" /> | <img src="prints/fabric_02.png" width="260" alt="Fabric Tokens Dark" /> | <img src="prints/fabric_03.png" width="260" alt="Buttons and Segmented" /> |

| Inputs, Search & Dropdown | Status Badges & Chips | Cards & Carousel |
| :---: | :---: | :---: |
| <img src="prints/fabric_04.png" width="260" alt="Inputs and Search" /> | <img src="prints/fabric_05.png" width="260" alt="Badges and Chips" /> | <img src="prints/fabric_06.png" width="260" alt="Cards and Carousel" /> |

| Navigation & Menus | Avatars & Presence | Empty States & Skeletons |
| :---: | :---: | :---: |
| <img src="prints/fabric_07.png" width="260" alt="Navigation" /> | <img src="prints/fabric_08.png" width="260" alt="Avatars" /> | <img src="prints/fabric_09.png" width="260" alt="Empty States" /> |

Run the interactive showcase app inside `example/`:

```bash
cd example
flutter run
```

---

## License

MIT © [Carlos Costa](https://github.com/carllosnc)
