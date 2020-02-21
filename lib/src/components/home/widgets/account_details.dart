import 'package:flutter/material.dart';

class AccountDetails extends StatelessWidget {
  final String account;
  final String agency;

  final String bankOnCountry;

  final String bankTranslation;
  final String agencyTranslation;
  final String accountTranslation;

  const AccountDetails(
    this.account, 
    this.agency, 
    this.bankOnCountry, 
    this.bankTranslation, 
    this.agencyTranslation, 
    this.accountTranslation, 
    {Key key}
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            Text(
              this.bankTranslation,
              style: Theme.of(context).primaryTextTheme.overline,
            ),
            
            Padding(
              padding: EdgeInsets.only(left: 3),
            ),
            
            Text(
              this.bankOnCountry,
              style: Theme.of(context).primaryTextTheme.subhead,
            ),
          ],
        ),
        
        SizedBox(
          height: 3,
        ),
        
        Row(
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            Text(
              this.agencyTranslation,
              style: Theme.of(context).primaryTextTheme.overline,
            ),
            
            Padding(
              padding: EdgeInsets.only(left: 3),
            ),
            
            Text(
              this.agency,
              style: Theme.of(context).primaryTextTheme.subhead,
            ),
          ],
        ),
        
        SizedBox(
          height: 3,
        ),
        
        Row(
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            Text(
              this.accountTranslation,
              style: Theme.of(context).primaryTextTheme.overline,
            ),
            
            Padding(
              padding: EdgeInsets.only(left: 3),
            ),
            
            Text(
              this.account,
              style: Theme.of(context).primaryTextTheme.subhead,
            ),
          ],
        ),
      ],
    );
  }
}
