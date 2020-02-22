import 'package:flutter/material.dart';

class NuContaBody extends StatelessWidget {
  final String translation;
  final String amount;

  const NuContaBody(this.translation, this.amount) : super();

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 30),
        child: Align(
          alignment: AlignmentDirectional.centerStart,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                this.translation,
                style: Theme.of(context).textTheme.display3.copyWith(
                  fontSize: 14,
                  color: Color(0xFF666666),
                ),  
              ),
              Text(
                this.amount,
                style: Theme.of(context).textTheme.display3.copyWith(
                  fontSize: 28,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
