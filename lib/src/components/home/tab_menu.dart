import 'package:flutter/material.dart';
import 'package:nubank/src/blocs/opacity_controller.dart';
import 'package:nubank/src/components/home/widgets/tab_item.dart';
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
                padding: EdgeInsets.only(left: 25, right: 35),
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  TabItem(icon: Icons.payment, label: 'Pagar'),
                  TabItem(
                      icon: Icons.phone_android, label: 'Recarga de celular'),
                  TabItem(icon: Icons.arrow_downward, label: 'Depositar'),
                  TabItem(icon: Icons.arrow_upward, label: 'Transferir'),
                  TabItem(icon: Icons.question_answer, label: 'Cobrar'),
                  TabItem(icon: Icons.lock_open, label: 'Bloquear cartão'),
                  TabItem(icon: Icons.help_outline, label: 'Me ajuda'),
                  TabItem(icon: Icons.person_add, label: 'Indicar amigos'),
                  TabItem(icon: Icons.reorder, label: 'Organizar atalhos'),
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
