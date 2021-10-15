// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/widgets.dart';

class MainNotifier {
  final notifierCounter = ValueNotifier(0);
  final notifierSlider = ValueNotifier(0.0);
  final notifierCheck = ValueNotifier(false);
  void incrementCounter() {
    notifierCounter.value = notifierCounter.value + 1;
  }

  // ignore: use_setters_to_change_properties
  void sliderChanged(double val) {
    notifierSlider.value = val;
  }

  // ignore: avoid_positional_boolean_parameters, use_setters_to_change_properties
  void checkChanged(bool? val) {
    // ignore: cast_nullable_to_non_nullable
    notifierCheck.value = val as bool;
  }
}

class MainBloc extends ChangeNotifier {
  int counter = 0;
  void incrementCounter() {
    counter++;
    notifyListeners();
  }
}

class MainBlocSlider extends ChangeNotifier {
  double sliderValue = 0;
  void sliderChanged(double val) {
    sliderValue = val;
    notifyListeners();
  }
}
