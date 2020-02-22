import 'package:flutter/material.dart';
import 'package:nubank/src/themes/nu_icons.dart';

class NuContaHeader extends StatelessWidget {
  final String translation;

  const NuContaHeader(this.translation) : super();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(
            NuIcons.money_coins,
            color: Colors.grey,
          ),
          Flexible(
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  this.translation,
                  style: Theme.of(context).textTheme.display3.copyWith(
                    fontSize: 14,
                    color: Color(0xFF666666),
                  )
                ),
              ),
            ),
          ),
          Icon(
            NuIcons.invisible,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
