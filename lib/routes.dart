import 'package:flutter/widgets.dart';
import 'package:nubank/src/screens/home.dart';
import 'package:nubank/src/screens/splash.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder> {
  '/': (BuildContext context) => HomeScreen(),
  '/splash': (BuildContext context) => SplashScreen(),
};