import 'package:flutter/material.dart';

class TabItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const TabItem({this.icon, this.label})
      : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      margin: EdgeInsets.only(left: 10),
      width: 100,
      child: FlatButton(
        onPressed: () {},
        color: Theme.of(context).disabledColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3),
        ),
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Icon(
                this.icon,
                color: Colors.white,
              ),
            ),
            
            Text(
              this.label,
              style: Theme.of(context).primaryTextTheme.overline,
            ),
          ],
        ),
      ),
    );
  }
}
