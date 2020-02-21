import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String name;

  const Header(this.name, { Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 25, bottom: 8),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: <Widget>[
              Image.asset('images/logo.png'),
              
              Container(
                margin: EdgeInsets.only(left: 8),
                child: Text(
                  this.name,
                  style: Theme.of(context).primaryTextTheme.display1,
                ),
              ),
            ],
          ),

          SizedBox( height: 3 ),

          Icon(
            Icons.keyboard_arrow_down,
            color: Theme.of(context).primaryIconTheme.color,
          )
        ],
      )
    );
  }
}