import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
    primaryColor: Color(0xFF83259F),
    primaryIconTheme: IconThemeData(
      color: Colors.white,
    ),
    primaryTextTheme: TextTheme(
      display1: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontFamily: 'Gotham SSm',
        fontWeight: FontWeight.w500,
      )
    ),
  );
}