// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/widgets.dart';
import 'package:reactive_viewmodel/src/presentation/features/home/viewcontroller/mycounterviewcontroller.dart';


class MyCounterHome extends StatefulWidget {
  const MyCounterHome({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  MyCounterViewController createState() => MyCounterViewController();
}
