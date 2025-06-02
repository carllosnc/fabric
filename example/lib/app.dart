import 'package:flutter/material.dart';
import './pages/home.dart';
import './pages/navigation_rail.dart';
import 'package:fabric/fabric.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: fabricConfig.getLightTheme(),
      darkTheme: fabricConfig.getDarkTheme(),
      debugShowCheckedModeBanner: false,
      home: Home(),
      routes: {
        '/navigation_rail': (context) => NavigatilRailPage(),
      },
    );
  }
}
