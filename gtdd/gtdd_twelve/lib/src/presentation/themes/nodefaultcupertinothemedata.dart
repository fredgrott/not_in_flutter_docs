// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:gtdd_twelve/src/presentation/themes/cupertino_colors.dart';
import 'package:gtdd_twelve/src/presentation/themes/cupertino_texttheme.dart';



// Gist: Overrides the Default Cupertino Colors with some others. Generally it's
//       better to use it this way with SliverAppbar adaptive navigation
//       approach. Get's slotted in the Material ThemeData cupertinoOverrideTheme.

NoDefaultCupertinoThemeData noDefaultCupertinoThemeData =
    NoDefaultCupertinoThemeData(
        primaryColor: cupertinoPrimaryColor,
        primaryContrastingColor: cupertinoPrimaryVariantColor,
        barBackgroundColor: cupertinoBarBackgroundColor,
        scaffoldBackgroundColor: cupertinoScaffoldBackgroundColor,
        textTheme: cupertinoTextThemeData,);
