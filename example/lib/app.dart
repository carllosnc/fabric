import 'package:flutter/material.dart';
import './pages/home.dart';
import 'package:neutral/neutral.dart';
import './pages/navigation_rail.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: neutralLightTheme(),
      darkTheme: neutralDarkTheme(),
      debugShowCheckedModeBanner: false,
      home: Home(),
      routes: {
        '/navigation_rail': (context) => NavigatilRailPage(),
      },
    );
  }
}
