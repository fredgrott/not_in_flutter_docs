// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:gtdd_ten/src/presentation/themes/my_actionsiconthemedata.dart';
import 'package:gtdd_ten/src/presentation/themes/my_appcolors.dart';
import 'package:gtdd_ten/src/presentation/themes/my_iconthemedata.dart';

AppBarTheme myAppBarTheme = AppBarTheme(
  //brightness:
  color: myLightPrimaryColor,
  shadowColor: myLightPrimaryVariantColor,
  //textTheme:
  centerTitle: true,
  titleSpacing: 1,
  iconTheme: myIconThemeData,
  actionsIconTheme: myActionsIconThemeData,
  titleTextStyle: myTitleTextStyle,
  toolbarTextStyle: myToolbarTextStyle,
);

TextStyle myTitleTextStyle = const TextStyle(
  fontWeight: FontWeight.bold,
);

TextStyle myToolbarTextStyle = const TextStyle(
  fontWeight: FontWeight.w600,
);
