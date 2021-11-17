// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:gtdd_fourteen/src/presentation/themes/cupertino_themedata.dart';
import 'package:gtdd_fourteen/src/presentation/themes/material_appbartheme.dart';
import 'package:gtdd_fourteen/src/presentation/themes/material_buttonthemedata.dart';
import 'package:gtdd_fourteen/src/presentation/themes/material_colorschemes.dart';
import 'package:gtdd_fourteen/src/presentation/themes/material_texttheme.dart';
import 'package:gtdd_fourteen/src/presentation/themes/material_typography.dart';



// Gist: Two ways to map the very lite Cupertino Themes into the Material ThemeData.
//       CupertinoOverrideTheme is one where the default Theme values are overriden.
//       The other method is to use the Material ThemeData machinery to compute
//       a MaterialBasedCupertinoThemeData and insert it in the theme slot of the
//       CupertinoAppData. And the Cupertino Themes always use CupertinoDynamicColor
//       to compute the four color values for the four themes on Apple devices.

ThemeData materialLightMaterialThemeData = ThemeData(
  // only required if we are doing non default Cupertino colors of primary, primarycontrast,etc.
  //cupertinoOverrideTheme: noDefaultCupertinoThemeData,
  cupertinoOverrideTheme: cupertinoThemeData,
  colorScheme: materialLightColorScheme,
  typography: materialTypography,
  appBarTheme: materialLightAppBarTheme,
  buttonTheme: materialLightButtonThemeData,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  primaryColorBrightness: Brightness.light,
  textTheme: materialLightTextTheme,
);

ThemeData materialDarkMaterialThemeData = ThemeData(
  // only required if we are doing non default Cupertino colors of primary, primarycontrast,etc.
  cupertinoOverrideTheme: cupertinoThemeData,
  colorScheme: materialDarkColorScheme,
  typography: materialTypography,
  appBarTheme: materialDarkAppBarTheme,
  buttonTheme: materialDarkButtonThemeData,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  primaryColorBrightness: Brightness.dark,
  textTheme: materialDarkTextTheme,
);
