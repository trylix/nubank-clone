import 'package:flutter/material.dart';
import 'package:nubank/src/blocs/opacity_controller.dart';
import 'package:nubank/src/components/buttons/sign_out.dart';
import 'package:nubank/src/components/home/widgets/account_details.dart';
import 'package:nubank/src/components/home/widgets/menu_item.dart';
import 'package:provider/provider.dart';

import 'widgets/qr_code.dart';

class AccountMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    OpacityController opacity = Provider.of<OpacityController>(context);
    
    return StreamBuilder(
      stream: opacity.stream,
      initialData: 0.0,
      builder: (_, AsyncSnapshot<double> snapshot) => Expanded(
      child: Opacity(
        opacity: snapshot.data,
        child: ListView(
        scrollDirection: Axis.vertical,
        primary: true,
        padding: EdgeInsets.only(left: 35, right: 35, top: 5),
        children: <Widget>[
          Center(
            child: QrCode('NuBank Me Contrata'),
          ),
          
          Padding(
            padding: EdgeInsets.only(top: 12, bottom: 26),
            child: AccountDetails(
              '0000000-0',
              '0001',
              '260 - Nu Pagamentos S.A.',
              'Banco',
              'Agência',
              'Conta'
            ),
          ),
          
          Divider(
            height: 1,
            color: Theme.of(context).hintColor,
          ),

          MenuItem(
            Icons.help_outline,
            'Me ajuda',
            '',
          ),

          Divider(
            height: 1,
            color: Theme.of(context).hintColor,
          ),

          MenuItem(
            Icons.person,
            'Perfil',
            'Nome de preferência, telefone, e-mail',
          ),

          Divider(
            height: 1,
            color: Theme.of(context).hintColor,
          ),

          MenuItem(
            Icons.monetization_on,
            'Configurar NuConta',
            '',
          ),

          Divider(
            height: 1,
            color: Theme.of(context).hintColor,
          ),

          MenuItem(
            Icons.work,
            'Pedir conta PJ',
            '',
          ),

          Divider(
            height: 1,
            color: Theme.of(context).hintColor,
          ),

          MenuItem(
            Icons.phone_android,
            'Configurações do app',
            '',
          ),

          Divider(
            height: 1,
            color: Theme.of(context).hintColor,
          ),

          Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: SignOut('Sair da conta'),
          )
        ],
      ),
      ),
    ),
    );
  }
}
