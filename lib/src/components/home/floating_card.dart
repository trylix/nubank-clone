import 'package:flutter/material.dart';
import 'package:nubank/src/blocs/draggable_controller.dart';
import 'package:nubank/src/blocs/opacity_controller.dart';
import 'package:nubank/src/components/home/widgets/nuconta_body.dart';
import 'package:nubank/src/components/home/widgets/nuconta_footer.dart';
import 'package:nubank/src/components/home/widgets/nuconta_header.dart';
import 'package:nubank/src/themes/nu_icons.dart';
import 'package:provider/provider.dart';

class FloatingCard extends StatefulWidget {
  @override
  _FloatingCardState createState() => _FloatingCardState();
}

class _FloatingCardState extends State<FloatingCard>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  GlobalKey _frameKey = GlobalKey();
  double _startY = 0;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      RenderBox render = _frameKey.currentContext.findRenderObject();

      if (!render.debugNeedsLayout) {
        setState(() {
          this._startY = render.localToGlobal(Offset.zero).dy;
        });
      }
    });

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 150),
    );
  }

  @override
  Widget build(BuildContext context) {
    DraggableController draggable = Provider.of<DraggableController>(context);
    OpacityController opacity = Provider.of<OpacityController>(context);

    draggable.init(
      animationController: _controller,
      opacityController: opacity,
      startY: _startY,
      height: MediaQuery.of(context).size.height,
    );

    return StreamBuilder(
      stream: draggable.stream,
      initialData: draggable.stream.value,
      builder: (_, AsyncSnapshot<double> snapshot) => Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Transform.translate(
            key: _frameKey,
            offset: Offset(0, snapshot.data - 20),
            child: GestureDetector(
              onPanUpdate: draggable.onDragUpdate,
              onPanEnd: draggable.onDragEnd,
              onTap: draggable.onTapCard,
              child: render(),
            ),
          ),
        ],
      ),
    );
  }

  Widget render() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Card(
        elevation: 0,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * .5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    NuContaHeader('NuConta'),
                    NuContaBody('Saldo disponível', 'R\$ 1.000,00'),
                    NuContaFooter(
                        'Compra em Central Presentes de R\$ 60,00 no débito em 10 FEV',
                        NuIcons.card),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
