import 'package:flutter/material.dart';
import 'package:nubank/routes.dart';
import 'package:nubank/src/themes/styles.dart';
import 'package:provider/provider.dart';

import 'package:nubank/src/blocs/draggable_controller.dart';
import 'package:nubank/src/blocs/opacity_controller.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<DraggableController>.value(value: DraggableController()),
        Provider<OpacityController>.value(value: OpacityController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Nubank',
        theme: appTheme(),
        color: Theme.of(context).primaryColor,
        routes: routes,
        initialRoute: '/splash',
      ),
    );
  }
}
