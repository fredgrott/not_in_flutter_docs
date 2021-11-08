// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gtdd_eleven/src/presentation/themes/my_app_colorschemes.dart';
import 'package:gtdd_eleven/src/presentation/themes/my_appbar_theme.dart';
import 'package:gtdd_eleven/src/presentation/themes/my_buttonthemedata.dart';

import 'package:gtdd_eleven/src/presentation/themes/my_typography.dart';

// Does need to dynamic switch? Yep!
MaterialBasedCupertinoThemeData myCupertinoBasedMaterialThemeData =
    MaterialBasedCupertinoThemeData(
  materialTheme: myDynamicMaterialThemeForCupertino(),
);

/// myDtynamicMaterialThemeForCupertino switches upon DarkMode so that
/// the correct Material Theme flows through Cupertino Widgets.
///
/// @author Fredrick Allan Grott
ThemeData myDynamicMaterialThemeForCupertino() {
  final brightness = SchedulerBinding.instance?.window.platformBrightness;
  final isDarkMode = brightness == Brightness.dark;
  if (isDarkMode) {
    return myDarkCupertinoThemeData;
  }

  return myLightCupertinoThemeData;
}

ThemeData myLightCupertinoThemeData = ThemeData(
  colorScheme: myLightColorScheme,
  typography: myTypography,
  appBarTheme: myAppBarLightTheme,
  buttonTheme: myButtonThemeData,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  primaryColorBrightness: Brightness.light,
  textTheme: myTypography.black,
);

ThemeData myDarkCupertinoThemeData = ThemeData(
  colorScheme: myDarkColorScheme,
  typography: myTypography,
  appBarTheme: myAppBarDarkTheme,
  buttonTheme: myButtonThemeData,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  primaryColorBrightness: Brightness.dark,
  textTheme: myTypography.white,
);
