// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:reactive_viewmodel/src/presentation/features/home/blocs/mycounterbloc.dart';
import 'package:reactive_viewmodel/src/presentation/features/home/ui/mycounterhome.dart';
import 'package:reactive_viewmodel/src/presentation/features/home/ui/mycounterviewwidget.dart';


class MyCounterViewController extends State<MyCounterHome> {
  CounterBloc counter = CounterBloc(0);

  @override
  // ignore: unnecessary_this
  Widget build(BuildContext context) => MyCounterWidgetView(this.widget);
  void handleCounterPressed() => setState(() => counter.increment);
}
