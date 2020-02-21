import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCode extends StatelessWidget {
  final String codeKey;

  const QrCode(this.codeKey, { Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return QrImage(
      version: 2,
      data: this.codeKey,
      padding: EdgeInsets.all(9),
      backgroundColor: Colors.white,
      foregroundColor: Theme.of(context).primaryColor,
      size: 110,
    );
  }
}
