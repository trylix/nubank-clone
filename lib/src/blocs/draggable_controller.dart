import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:nubank/src/blocs/opacity_controller.dart';
import 'package:rxdart/rxdart.dart';

class DraggableController {
  BehaviorSubject<double> _coordY;
  BehaviorSubject<double> _maxCoordY;
  BehaviorSubject<double> _startCoordY;

  BehaviorSubject<bool> _animateUp;
  BehaviorSubject<bool> _onTop;

  BehaviorSubject<AnimationController> _animationController;
  BehaviorSubject<OpacityController> _opacityController;

  OpacityController _opacity;

  double _minCardPosition = 16;
  
  double get _currentPosition {
    return _coordY.value / _maxCoordY.value;
  }

  double get _handleOpacity {
    return (_coordY.value / _maxCoordY.value) * 1.2;
  }

  bool get onTop {
    return _onTop.value;
  }
  
  Offset get currentOffset {
    return Offset(0, this._coordY.value - 20);
  }

  ValueStream<double> get stream {
    return this._coordY.stream;
  }

  DraggableController() {
    this._coordY = BehaviorSubject<double>.seeded(0);
    this._maxCoordY = BehaviorSubject<double>.seeded(0);
    this._startCoordY = BehaviorSubject<double>.seeded(0);
    this._animateUp = BehaviorSubject<bool>.seeded(false);
    this._onTop = BehaviorSubject<bool>.seeded(false);
    this._animationController = BehaviorSubject<AnimationController>();
    this._opacityController = BehaviorSubject<OpacityController>();
  }

  init({AnimationController animationController, OpacityController opacityController, double startY, double height}) {
    this._animationController.add(animationController);
    this._opacityController.add(opacityController);
    this._startCoordY.add(startY);
    this._maxCoordY.add(height - this._startCoordY.value - this._minCardPosition);
  }

  onDragUpdate(DragUpdateDetails details) {
    if (this._animationController.value.isAnimating) {
      this._animationController.value.stop(canceled: true);
    }

    this._coordY.add(min(this._maxCoordY.value, max(0, this._coordY.value + details.delta.dy)));
    this._opacityController.value.put(this._handleOpacity);
    this._animateUp.add(details.delta.dy < 0);
  }

  onDragEnd(DragEndDetails details) {
    if (this._animationController.value != null) {
      this.handleAnimation(this._coordY.value, (this._animateUp.value || this._currentPosition <= 0.2) ? 0 : this._maxCoordY.value);
    }
  }

  onTapCard({ onHeader = false }) {
    if (this._animationController.value == null) return;

    if (this._currentPosition == 1) {
      this.handleAnimation(this._coordY.value, 0);
    } else if (this._currentPosition == 0 && onHeader) {
      this.handleAnimation(this._coordY.value, this._maxCoordY.value);
    }
  }

  handleAnimation(double current, double next) {
    this._animationController.value.reset();

    Tween<double> interpolate = Tween<double>(begin: current, end: next);

    Animation animation = interpolate.animate(this._animationController.value);

    Function listener = () {
      _coordY.add(animation.value);
      _opacityController.value.put(this._handleOpacity);
      _onTop.add(animation.value == 0);
    };

    this._animationController.value.addListener(listener);

    this._animationController.value.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        this._animationController.value.removeListener(listener);
      }
    });

    this._animationController.value.forward();
  }
}
