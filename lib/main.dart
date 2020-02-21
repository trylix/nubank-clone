import 'package:flutter/material.dart';
import 'package:nubank/routes.dart';
import 'package:nubank/src/themes/styles.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nubank',
      theme: appTheme(),
      color: Theme.of(context).primaryColor,
      routes: routes,
      initialRoute: '/',
    );
  }
}
