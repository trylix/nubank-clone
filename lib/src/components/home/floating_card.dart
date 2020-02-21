import 'package:flutter/material.dart';
import 'package:nubank/src/blocs/draggable_card.dart';
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
    DraggableCard component = Provider.of<DraggableCard>(context);

    component.init(
      controller: _controller,
      startY: _startY,
      height: MediaQuery.of(context).size.height,
    );

    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        StreamBuilder(
          stream: component.stream,
          builder: (_, __) => Transform.translate(
            key: _frameKey,
            offset: component.currentOffset,
            child: GestureDetector(
              onPanUpdate: component.onDragUpdate,
              onPanEnd: component.onDragEnd,
              onTap: component.onTapCard,
              child: render(),
            ),
          ),
        ),
      ],
    );
  }

  Widget render() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Card(
        elevation: 0,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * .5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[],
          ),
        ),
      ),
    );
  }
}
