// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:gtdd_ten/src/presentation/themes/my_app_colorschemes.dart';
import 'package:gtdd_ten/src/presentation/themes/my_appbar_theme.dart';
import 'package:gtdd_ten/src/presentation/themes/my_buttonthemedata.dart';
import 'package:gtdd_ten/src/presentation/themes/my_material_texttheme.dart';
import 'package:gtdd_ten/src/presentation/themes/my_typography.dart';

// As of Oct ListTileThemeData is in process of being added to ThemeData
// until them have to wrap the listTile in ListTileTheme.
// Things no longer used:   cupertinoOverrideTheme: myCupertinoThemeData,
//                          accentColorBrightness
//

ThemeData myLightMaterialThemeData = ThemeData(
  colorScheme: myLightColorScheme,
  typography: myTypography,
  appBarTheme: myAppBarLightTheme,
  buttonTheme: myButtonThemeData,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  primaryColorBrightness: Brightness.light,
  textTheme: myMaterialLightTextTheme,
  
);

ThemeData myDarkMaterialThemeData = ThemeData(
  colorScheme: myDarkColorScheme,
  typography: myTypography,
  appBarTheme: myAppBarDarkTheme,
  buttonTheme: myButtonThemeData,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  primaryColorBrightness: Brightness.dark,
  textTheme: myMaterialDarkTextTheme,
);
