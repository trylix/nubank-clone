import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nubank/src/themes/nu_icons.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    Future.delayed(Duration(seconds: 3)).then((_) {
      Navigator.pushNamed(context, '/');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            color: Theme.of(context).primaryColor,
          ),
          Center(
            child: Icon(
              NuIcons.nu_logo_25pt,
              color: Colors.white,
              size: 80,
            ),
          )
        ],
      ),
    );
  }
}
