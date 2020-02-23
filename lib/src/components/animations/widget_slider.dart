import 'package:flutter/material.dart';

class WidgetSlider extends StatefulWidget {
  final Widget child;
  final Offset offset;
  final Duration duration;

  const WidgetSlider({@required this.child, @required this.offset, @required this.duration}) : super();

  @override
  _WidgetSliderState createState() => _WidgetSliderState();
}

class _WidgetSliderState extends State<WidgetSlider>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _offsetFloat;
  bool finished = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _offsetFloat = Tween(begin: widget.offset, end: Offset.zero).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.elasticInOut,
      ),
    );

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();

    return SlideTransition(
      position: _offsetFloat,
      child: widget.child,
    );
  }
}
