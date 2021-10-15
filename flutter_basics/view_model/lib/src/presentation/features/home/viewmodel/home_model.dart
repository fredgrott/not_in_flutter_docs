// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:developer';

import 'package:obsobject/obsobject.dart';
import 'package:view_model/src/presentation/widgets/view_model.dart';

class HomeModel extends ViewModel {
  final Observable<int> count = Observable<int>(1);
  final Observable<int> a = Observable(0);
  final Observable<double> b = Observable(0);
  final Observable<double?> c = Observable(null);
  final Observable<String> d = Observable('');
  final Observable<DateTime> e = Observable(DateTime(2021, 1, 4));
  final Observable<DateTime?> f = Observable(null);
  final Observable<String> g = Observable('');
  final Observable<DateTime> h = Observable(DateTime.now());
  final Observable<int?> i = Observable(null)
    ..isValid.validator = ValidatorRequired();

  @override
  void activate() {
    super.activate();
    a.changed(() => log('int: $a'));
    b.changed(() => log('double: $b'));
    c.changed(() => log('double?: $c'));
    d.changed(() => log('string: $d'));
    e.changed(() => log('DateTime: $e'));
    f.changed(() => log('DateTime?: $f'));
    g.changed(() => log('Mask: $g'));
    h.changed(() => log('Mask: $h'));
  }

  void add() {
    count.value++;
  }
}
