import 'dart:math';

import 'package:rxdart/rxdart.dart';

class OpacityController {
  BehaviorSubject<double> _opacity;
  
  BehaviorSubject<double> get stream {
    return this._opacity.stream;
  }

  double get result {
    double opacity = 1.0 - max(0, min(1, this._opacity.value));

    return opacity.isNaN ? 1 : opacity;
  }

  OpacityController() {
    this._opacity = BehaviorSubject<double>.seeded(0);

    this._opacity.add(0);
  }

  put(double value) {
    this._opacity.add(value);
  }
}