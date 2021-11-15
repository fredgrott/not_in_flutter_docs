// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:gtdd_twelve/src/presentation/themes/cupertino_colors.dart';
import 'package:gtdd_twelve/src/presentation/themes/cupertino_texttheme.dart';

// Gist: If we want just Apple colorson-Material and Apple font styling of 
//       Cupertino Widgets then we use this in the CupertinoApp theme slot.

CupertinoThemeData cupertinoThemeData = CupertinoThemeData(
  brightness: Brightness.light,
  primaryColor: cupertinoPrimaryColor,
  primaryContrastingColor: cupertinoPrimaryVariantColor,
  barBackgroundColor: cupertinoBarBackgroundColor,
  scaffoldBackgroundColor: cupertinoScaffoldBackgroundColor,
  textTheme: cupertinoTextThemeData,
);
