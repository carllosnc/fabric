import './app.dart';
import 'package:flutter/material.dart';
import 'package:fabric/fabric.dart';

void main() {
  fabricConfig.color = fabricGrey;
  fabricConfig.fontFamily = "BricolageGrotesque";

  runApp(const App());
}
