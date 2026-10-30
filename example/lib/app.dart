import 'package:fabric/fabric.dart';
import 'package:flutter/material.dart';
import './pages/home.dart';
import './pages/navigation_rail.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  FabricSwatch _selectedSwatch = fabricGrey;
  ThemeMode _themeMode = ThemeMode.system;

  static const String _fontFamily = 'Inter';

  @override
  Widget build(BuildContext context) {
    final FabricTheme fabricTheme = FabricTheme(
      color: _selectedSwatch,
      fontFamily: _fontFamily,
    );

    return MaterialApp(
      theme: fabricTheme.lightTheme,
      darkTheme: fabricTheme.darkTheme,
      themeMode: _themeMode,
      themeAnimationDuration: Duration.zero,
      debugShowCheckedModeBanner: false,
      home: Home(
        selectedSwatch: _selectedSwatch,
        themeMode: _themeMode,
        onSwatchChanged: (FabricSwatch swatch) {
          setState(() {
            _selectedSwatch = swatch;
          });
        },
        onThemeModeChanged: (ThemeMode mode) {
          setState(() {
            _themeMode = mode;
          });
        },
      ),
      routes: <String, WidgetBuilder>{
        '/navigation_rail': (BuildContext context) => const NavigationRailPage(),
      },
    );
  }
}
