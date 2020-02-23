import 'package:flutter/material.dart';
import 'package:nubank/src/components/animations/widget_slider.dart';
import 'package:nubank/src/components/home/floating_card.dart';
import 'package:nubank/src/components/home/header.dart';
import 'package:nubank/src/components/home/account_menu.dart';
import 'package:nubank/src/components/home/tab_menu.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          SafeArea(
            child: Column(
              children: <Widget>[
                Header('Brendenson Andrade'),
                AccountMenu(),
              ],
            ),
          ),
          WidgetSlider(
            child: TabMenu(),
            offset: Offset(.3, 0),
            duration: Duration(milliseconds: 2500),
          ),
          WidgetSlider(
            child: FloatingCard(),
            offset: Offset(1, 0),
            duration: Duration(milliseconds: 2800),
          ),
        ],
      ),
    );
  }
}
