import 'package:flutter/material.dart';

class NuContaFooter extends StatelessWidget {
  final String lastTransaction;
  final IconData type;

  const NuContaFooter(this.lastTransaction, this.type) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 35, horizontal: 20),
      color: Color(0xFFF1F1F1),
      child: Row(
        children: <Widget>[
          Icon(
            this.type,
            color: Color(0xFF818181),
          ),
          Flexible(
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  this.lastTransaction,
                  style: Theme.of(context).textTheme.display3.copyWith(
                    fontSize: 11,
                    color: Color(0xFF333333),
                  ),
                ),
              ),
            ),
          ),
          Icon(
            Icons.chevron_right,
            color: Color(0xFF818181),
          ),
        ],
      ),
    );
  }
}
