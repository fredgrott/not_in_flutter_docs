// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/widgets.dart';
import 'package:widgetview_pattern/src/presentation/features/home/viewcontroller/mycountercontroller.dart';


class MyCounterHome extends StatefulWidget {
  final Color textColor;
  const MyCounterHome({Key? key, required this.textColor}) : super(key: key);
  @override
  MyCounterController createState() => MyCounterController();
}