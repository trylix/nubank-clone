import 'package:flutter/material.dart';

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
          Icon(Icons.monetization_on),
          Flexible(
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(this.translation),
              ),
            ),
          ),
          Icon(
            Icons.remove_red_eye,
          ),
        ],
      ),
    );
  }
}
