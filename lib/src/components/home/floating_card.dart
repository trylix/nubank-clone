import 'package:flutter/material.dart';
import 'package:nubank/src/blocs/draggable_controller.dart';
import 'package:nubank/src/blocs/opacity_controller.dart';
import 'package:nubank/src/components/home/widgets/nuconta_body.dart';
import 'package:nubank/src/components/home/widgets/nuconta_footer.dart';
import 'package:nubank/src/components/home/widgets/nuconta_header.dart';
import 'package:provider/provider.dart';

class FloatingCard extends StatefulWidget {
  @override
  _FloatingCardState createState() => _FloatingCardState();
}

class _FloatingCardState extends State<FloatingCard>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  GlobalKey _frameKey;
  double _startY;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      RenderBox render = _frameKey.currentContext.findRenderObject();

      setState(() {
        this._startY = render.localToGlobal(Offset.zero).dy;
      });
    });

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 150),
    );

    _frameKey = GlobalKey();
    _startY = 0;
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
      builder: (_, __) => Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Transform.translate(
            key: _frameKey,
            offset: draggable.currentOffset,
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
                    NuContaBody('Saldo disponível', 'R\$ 0,00'),
                    NuContaFooter(
                        'Compra em Central Presentes de R\$ 60,00 no débito em 10 FEV',
                        Icons.credit_card),
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
