import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String extra;

  const MenuItem(this.icon, this.label, this.extra,
      {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {},
      padding: EdgeInsets.zero,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
          
        children: <Widget>[
          Icon(
            icon,
            size: 28,
            color: Theme.of(context).primaryIconTheme.color,
          ),
            
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.only(
                left: 15,
                top: 13,
                bottom: 13
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                
                children: <Widget>[
                  Text(
                    this.label,
                    style: Theme.of(context).primaryTextTheme.title,
                    textAlign: TextAlign.start,
                  ),

                  this.extra != '' ? Text(
                    this.extra,
                    style: Theme.of(context).primaryTextTheme.subtitle,
                    textAlign: TextAlign.start,
                  ) : Container(),
                ],
              ),
            ),
          ),
            
          Icon(
            Icons.chevron_right,
            color: Theme.of(context).primaryIconTheme.color,
            size: 20,
          ),
        ],
      ),
    );
  }
}
