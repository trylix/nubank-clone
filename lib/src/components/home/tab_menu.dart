import 'package:flutter/material.dart';
import 'package:nubank/src/components/home/widgets/tab_item.dart';

class TabMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Container(
          height: 100,
          margin: EdgeInsets.symmetric(vertical: 20),
          child: ListView(
            primary: true,
            padding: EdgeInsets.only(left: 15, right: 25),
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              TabItem(icon: Icons.payment, label: 'Pagar'),
              TabItem(icon: Icons.phone_android, label: 'Recarga de celular'),
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
      ],
    );
  }
}
