import 'package:flutter/material.dart';

class AccountInfo extends StatelessWidget {
  final String item;
  final String info;

  const AccountInfo(
    this.item, 
    this.info,
  ) : super();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
              this.item,
              style: Theme.of(context).textTheme.display3.copyWith(
                fontSize: 12,
              ),
            ),
            
            Padding(
              padding: EdgeInsets.only(left: 3),
            ),
            
            Text(
              this.info,
              style: Theme.of(context).textTheme.display4.copyWith(
                fontSize: 12,
              ),
            )
        ],
      ),
    );
  }
}
