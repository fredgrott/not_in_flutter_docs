// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:reactive_viewmodel/src/infrastructure/widgetview/widegtview.dart';
import 'package:reactive_viewmodel/src/presentation/features/home/ui/mycounterhome.dart';
import 'package:reactive_viewmodel/src/presentation/features/home/viewcontroller/mycounterviewcontroller.dart';


class MyCounterWidgetView extends StatelessView<MyCounterHome> {
  late final MyCounterViewController state;

  // ignore: prefer_const_constructors_in_immutables
  MyCounterWidgetView(MyCounterHome widget, {Key? key})
      : super(
          widget,
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: state.handleCounterPressed,
      child: Text(
        "${state.counter}",
      ),
    );
  }
}
