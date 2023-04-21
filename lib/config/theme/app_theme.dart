import 'package:flutter/material.dart';

class AppTheme {
  final List<Color> colorsTheme = [
    Colors.blue,
    Colors.green,
    Colors.red,
    Colors.pink,
    Colors.yellow,
    Colors.lime,
    Colors.blue,
    Colors.blueGrey,
    Colors.brown,
    Colors.cyan,
    Colors.teal,
    Colors.purple,
  ];
  final int colorShemaSeed;

  AppTheme({this.colorShemaSeed = 0});
  ThemeData getTheme() => ThemeData(
      useMaterial3: true,
      colorSchemeSeed: colorsTheme[colorShemaSeed],
      appBarTheme: AppBarTheme(elevation: 20));
}
