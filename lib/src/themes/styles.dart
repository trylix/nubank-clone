import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
    primaryColor: Color(0xFF83259F),
    primaryColorDark: Colors.black,
    disabledColor: Color.fromRGBO(255, 255, 255, .1),
    hintColor: Color.fromRGBO(255, 255, 255, .5),
    primaryIconTheme: IconThemeData(
      color: Colors.white,
    ),
    textTheme: TextTheme(
      display1: TextStyle(
        fontFamily: 'Gotham SSm Light',
        color: Colors.white,
      ),
      display2: TextStyle(
        fontFamily: 'Gotham SSm Medium',
        color: Colors.white,
      ),
      display3: TextStyle(
        fontFamily: 'Gotham SSm Book',
        color: Colors.white,
      ),
      display4: TextStyle(
        fontFamily: 'Gotham SSm Bold',
        color: Colors.white,
      ),
    ),
  );
}
