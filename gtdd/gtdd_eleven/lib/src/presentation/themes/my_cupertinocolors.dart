// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:gtdd_eleven/src/presentation/themes/my_appcolors.dart';

CupertinoDynamicColor myCupertinoNavigationBarLightBackgroundColor =
    CupertinoDynamicColor.withBrightnessAndContrast(
  color: myLightPrimaryColor,
  darkColor: myDarkPrimaryColor,
  highContrastColor: myLightPrimaryVariantColor,
  darkHighContrastColor: myDarkPrimaryVariantColor,
);
