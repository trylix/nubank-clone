import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

class DraggableCard {
  BehaviorSubject<double> _coordY;
  BehaviorSubject<double> _maxCoordY;
  BehaviorSubject<double> _startCoordY;

  BehaviorSubject<bool> _animateUp;

  BehaviorSubject<AnimationController> _controller;
  
  double get currentPosition {
    return _coordY.value / _maxCoordY.value;
  }

  Offset get currentOffset {
    return Offset(0, this._coordY.value);
  }

  ValueStream<double> get stream {
    return this._coordY.stream;
  }

  DraggableCard() {
    this._coordY = BehaviorSubject<double>.seeded(0);
    this._maxCoordY = BehaviorSubject<double>.seeded(0);
    this._startCoordY = BehaviorSubject<double>.seeded(0);
    this._animateUp = BehaviorSubject<bool>.seeded(false);
    this._controller = BehaviorSubject<AnimationController>();
  }

  init({AnimationController controller, double startY, double height}) {
    this._controller.add(controller);
    this._startCoordY.add(startY);
    this._maxCoordY.add(height - this._startCoordY.value - 80);
  }

  onDragUpdate(DragUpdateDetails details) {
    if (this._controller.value.isAnimating) {
      this._controller.value.stop(canceled: true);
    }

    this._coordY.add(min(this._maxCoordY.value, max(0, this._coordY.value + details.delta.dy)));
    this._animateUp.add(details.delta.dy < 0);
  }

  onDragEnd(DragEndDetails details) {
    if (this._controller.value != null) {
      this.handleAnimation(this._coordY.value, (this._animateUp.value || this.currentPosition <= 0.2) ? 0 : this._maxCoordY.value);
    }
  }

  onTapCard() {
    if (this.currentPosition == 1 && this._controller.value != null) {
      this.handleAnimation(this._coordY.value, 0);
    }
  }

  handleAnimation(double current, double next) {
    this._controller.value.reset();

    Tween<double> interpolate = Tween<double>(begin: current, end: next);

    Animation animation = interpolate.animate(this._controller.value);

    Function listener = () {
      _coordY.add(animation.value);
    };

    this._controller.value.addListener(listener);

    this._controller.value.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        this._controller.value.removeListener(listener);
      }
    });

    this._controller.value.forward();
  }
}
