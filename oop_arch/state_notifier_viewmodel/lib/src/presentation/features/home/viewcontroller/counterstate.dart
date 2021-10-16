// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:state_notifier/state_notifier.dart';

// Our view controller with some business logic
class CounterState extends StateNotifier<int> {
  /// {@macro counter_state}
  CounterState() : super(0);

  /// Increments the state by 1.
  void increment() => state += 1;

  /// Decrements the state by 1.
  void decrement() => state -= 1;
}
