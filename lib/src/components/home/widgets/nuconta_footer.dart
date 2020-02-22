import 'package:flutter/material.dart';

class NuContaFooter extends StatelessWidget {
  final String lastTransaction;
  final IconData type;

  const NuContaFooter(this.lastTransaction, this.type) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      color: Color(0xFFF1F1F1),
      child: Row(
        children: <Widget>[
          Icon(this.type),
          Flexible(
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  this.lastTransaction,
                  style: TextStyle(
                    fontSize: 11,
                  ),
                ),
              ),
            ),
          ),
          Icon(
            Icons.chevron_right,
          ),
        ],
      ),
    );
  }
}
