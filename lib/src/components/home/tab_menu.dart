import 'package:flutter/material.dart';
import 'package:nubank/src/blocs/opacity_controller.dart';
import 'package:nubank/src/components/home/widgets/tab_item.dart';
import 'package:nubank/src/themes/nu_icons.dart';
import 'package:provider/provider.dart';

class TabMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    OpacityController opacity = Provider.of<OpacityController>(context);

    return StreamBuilder(
      stream: opacity.stream,
      initialData: 1.0,
      builder: (_, AsyncSnapshot<double> snapshot) => IgnorePointer(
        ignoring: (1 - snapshot.data) < 1,
        child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Container(
            height: (1 - snapshot.data) < .2 ? 0 : 200,
            color: Theme.of(context).primaryColor,
          ),
          Opacity(
            opacity: 1 - snapshot.data,
            child: Container(
              height: 100,
              margin: EdgeInsets.symmetric(vertical: 20),
              child: ListView(
                primary: true,
                padding: EdgeInsets.only(left: 20, right: 35),
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  TabItem(icon: NuIcons.bar_code, label: 'Pagar'),
                  TabItem(
                      icon: NuIcons.phone, label: 'Recarga de celular'),
                  TabItem(icon: NuIcons.get_money, label: 'Depositar'),
                  TabItem(icon: NuIcons.give_money, label: 'Transferir'),
                  TabItem(icon: NuIcons.request_money_1, label: 'Cobrar'),
                  TabItem(icon: NuIcons.lock_off, label: 'Bloquear cartão'),
                  TabItem(icon: NuIcons.help, label: 'Me ajuda'),
                  TabItem(icon: NuIcons.add_user, label: 'Indicar amigos'),
                  TabItem(icon: NuIcons.sort, label: 'Organizar atalhos'),
                ],
              ),
            ),
          ),
        ],
      ),
      ),
    );
  }
}
