import 'package:flutter/material.dart';

class NuContaBody extends StatelessWidget {
  final String translation;
  final String amount;

  const NuContaBody(this.translation, this.amount) : super();

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: EdgeInsets.all(30),
        child: Align(
          alignment: AlignmentDirectional.centerStart,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                this.translation,
                style: TextStyle(
                  fontSize: 16,
                ),  
              ),
              Text(
                this.amount,
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
