import 'package:flutter/material.dart';

class SignOut extends StatelessWidget {
  final String translation;

  const SignOut(this.translation) : super();

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      onPressed: () {},
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Text(
          this.translation.toUpperCase(),
          style: Theme.of(context).textTheme.display4.copyWith(
            fontSize: 13,
          ),
        ),
      ),
      borderSide: BorderSide(
        color: Theme.of(context).hintColor,
      ),
      highlightedBorderColor: Theme.of(context).disabledColor,
    );
  }
}
