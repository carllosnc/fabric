import 'package:flutter/material.dart';
import './pages/home.dart';
import './pages/navigation_rail.dart';
import 'package:neutral/neutral.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: neutralLightTheme(
        mainColor: neutral,
        fontFamily: "BricolageGrotesque",
      ),
      darkTheme: neutralDarkTheme(
        mainColor: neutral,
        fontFamily: "BricolageGrotesque",
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
      routes: {
        '/navigation_rail': (context) => NavigatilRailPage(),
      },
    );
  }
}
