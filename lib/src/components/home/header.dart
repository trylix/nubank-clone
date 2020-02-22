import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nubank/src/blocs/draggable_controller.dart';
import 'package:nubank/src/themes/nu_icons.dart';
import 'package:provider/provider.dart';

class Header extends StatelessWidget {
  final String name;

  const Header(this.name) : super();

  @override
  Widget build(BuildContext context) {
    DraggableController draggable = Provider.of<DraggableController>(context);

    return StreamBuilder(
      stream: draggable.stream,
      builder: (_, __) => GestureDetector(
        child: Padding(
            padding: EdgeInsets.only(top: 25, bottom: 8),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('images/logo.png'),
                    Container(
                      margin: EdgeInsets.only(left: 8),
                      child: Text(
                        this.name,
                        style: Theme.of(context).textTheme.display4.copyWith(
                              fontSize: 20,
                            ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 3),
                Icon(
                  draggable.onTop ? NuIcons.mini_chevron_down : NuIcons.mini_chevron_up,
                  color: Colors.white54,
                )
              ],
            )),
        onTap: () => draggable.onTapCard(
          onHeader: true,
        ),
      ),
    );
  }
}
