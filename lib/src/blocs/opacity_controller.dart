import 'dart:math';

import 'package:rxdart/rxdart.dart';

class OpacityController {
  BehaviorSubject<double> _opacity;
  
  BehaviorSubject<double> get stream {
    return this._opacity.stream;
  }

  OpacityController() {
    this._opacity = BehaviorSubject<double>.seeded(0);

    this._opacity.add(0);
  }

  put(double value) {
    this._opacity.add(value);
  }
}