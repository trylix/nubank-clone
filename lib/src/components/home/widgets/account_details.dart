import 'package:flutter/material.dart';
import 'package:nubank/src/components/home/widgets/account_info.dart';

class AccountDetails extends StatelessWidget {
  final String account;
  final String agency;

  final String bankOnCountry;

  final String bankTranslation;
  final String agencyTranslation;
  final String accountTranslation;

  const AccountDetails(this.account, this.agency, this.bankOnCountry,
      this.bankTranslation, this.agencyTranslation, this.accountTranslation)
      : super();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        AccountInfo(this.bankTranslation, this.bankOnCountry),
        AccountInfo(this.agencyTranslation, this.agency),
        AccountInfo(this.accountTranslation, this.account),
      ],
    );
  }
}
