// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'package:flutter/cupertino.dart';
import 'package:gtdd_nine/src/presentation/themes/my_appcolors.dart';

// We use CupertinoDynamicColor to translate colors
// to right ones based upon BuildContext on Cupertino
// widgets
CupertinoThemeData myCupertinoThemeData = CupertinoThemeData(
  primaryColor: myPrimaryCupertinoColor,
  primaryContrastingColor: myPrimaryContrastingCupertinoColor,
  barBackgroundColor: myBarBackgroundCupertinoColor,
  scaffoldBackgroundColor: myScaffoldBackgroundCupertinoColor,
);

CupertinoDynamicColor myPrimaryCupertinoColor =
    CupertinoDynamicColor.withBrightnessAndContrast(
  color: myLightPrimaryColor,
  darkColor: myDarkPrimaryColor,
  highContrastColor: myLightHighContrastPrimaryColor,
  darkHighContrastColor: myDarkHighContrastPrimaryColor,
);

CupertinoDynamicColor myPrimaryContrastingCupertinoColor =
    CupertinoDynamicColor.withBrightnessAndContrast(
  color: myLightPrimaryVariantColor,
  darkColor: myDarkPrimaryVariantColor,
  highContrastColor: myLightHighContrastPrimaryVariantColor,
  darkHighContrastColor: myDarkHighContrastPrimaryVariantColor,
);

CupertinoDynamicColor myBarBackgroundCupertinoColor =
    CupertinoDynamicColor.withBrightnessAndContrast(
  color: myLightSurfaceColor,
  darkColor: myDarkSurfaceColor,
  highContrastColor: myLightHighContrastSurfaceColor,
  darkHighContrastColor: myDarkHighContrastSurfaceColor,
);

CupertinoDynamicColor myScaffoldBackgroundCupertinoColor =
    CupertinoDynamicColor.withBrightnessAndContrast(
  color: myLightBackgroundColor,
  darkColor: myDarkBackgroundColor,
  highContrastColor: myLightHighContrastBackgroundColor,
  darkHighContrastColor: myDarkHighContrastBackgroundColor,
);
