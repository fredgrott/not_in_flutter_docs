// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/widgets.dart';
import 'package:widgetview_pattern/src/presentation/features/home/ui/mycounterhome.dart';
import 'package:widgetview_pattern/src/presentation/features/home/ui/mycounterwidgetview.dart';



// view controller(ie view model with small-c controller)
class MyCounterController extends State<MyCounterHome>{

  // the model
  int counter = 0;
  @override
  // ignore: unnecessary_this
  Widget build(BuildContext context) => MyCounterWidgetView(this.widget);
  // the biz logic
  void handleCounterPressed() => setState(() => counter += 1);

}