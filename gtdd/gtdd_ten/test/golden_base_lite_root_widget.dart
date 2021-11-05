// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

// Gits: Under Goldens Testing to test a widget instead of an app screen
//       we need to instead of providng a modified myApp root widget; to 
//       provide a lite root widget with only theme and the material 
//       container.

class GoldenBaseLiteRootWidget extends StatelessWidget {
  final Widget? myChild;
  final ThemeData myTheme;

  const GoldenBaseLiteRootWidget({
    Key? key,
    this.myChild,
    required this.myTheme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: myTheme,
      child: Material(
        child: myChild,
      ),
    );
  }
}
