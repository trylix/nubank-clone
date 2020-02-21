import 'package:flutter/material.dart';

class SignOut extends StatelessWidget {
  final String translation;

  const SignOut(this.translation, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      onPressed: () {},
      child: Padding(
        padding: EdgeInsets.all(14),
        child: Text(
          this.translation.toUpperCase(),
          style: Theme.of(context).primaryTextTheme.display2,
        ),
      ),
      borderSide: BorderSide(
        color: Theme.of(context).hintColor,
      ),
      highlightedBorderColor: Theme.of(context).disabledColor,
    );
  }
}
