import 'package:flutter/material.dart';

class CustomThemes {
  static TextStyle errorTextStyle =
      TextStyle(fontSize: 22, color: Colors.deepOrange);
  static List<ThemeData> themes = [
    ThemeData(primarySwatch: Colors.teal),
    ThemeData(primarySwatch: Colors.deepOrange),
    ThemeData(primarySwatch: Colors.lightBlue)
  ];
}
