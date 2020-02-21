import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
    primaryColor: Color(0xFF83259F),
    disabledColor: Color.fromRGBO(255, 255, 255, .1),
    hintColor: Color.fromRGBO(255, 255, 255, .5),
    primaryIconTheme: IconThemeData(
      color: Colors.white,
    ),
    primaryTextTheme: TextTheme(
      title: TextStyle(
        color: Colors.white,
        fontFamily: 'Gotham SSm',
        fontSize: 14,
        fontWeight: FontWeight.w300,
      ),

      subtitle: TextStyle(
        color: Color.fromRGBO(255, 255, 255, .5),
        fontFamily: 'Gotham SSm',
        fontWeight: FontWeight.w300,
        fontSize: 11,
      ),

      display1: TextStyle(
        color: Colors.white,
        fontFamily: 'Gotham SSm',
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),

      display2: TextStyle(
        color: Colors.white,
        fontFamily: 'Gotham SSm',
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),
      
      overline: TextStyle(
        color: Colors.white,
        fontFamily: 'Gotham SSm',
        fontSize: 11,
        fontWeight: FontWeight.w300,
      ),
      
      subhead: TextStyle(
        color: Colors.white,
        fontFamily: 'Gotham SSm',
        fontSize: 11,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
