import 'package:flutter/material.dart';
import 'package:nubank/routes.dart';
import 'package:nubank/src/themes/styles.dart';
import 'package:provider/provider.dart';

import 'package:nubank/src/blocs/draggable_card.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<DraggableCard>.value(value: DraggableCard()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Nubank',
        theme: appTheme(),
        color: Theme.of(context).primaryColor,
        routes: routes,
        initialRoute: '/',
      ),
    );
  }
}
