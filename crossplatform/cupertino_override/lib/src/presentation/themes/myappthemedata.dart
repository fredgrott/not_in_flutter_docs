// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.




import 'package:cupertino_override/src/presentation/themes/my_typography.dart';
import 'package:cupertino_override/src/presentation/themes/myappcolorschemes.dart';
import 'package:flutter/material.dart';


ThemeData myLightThemeData = ThemeData(
  colorScheme: myLightColorScheme,
  typography: myTypography,
);

ThemeData myDarkThemeData = ThemeData(
  colorScheme: myDarkColorScheme,
  typography: myTypography,
);

ThemeData myHighContrastLightThemeData = ThemeData(
  colorScheme: myHighContrastLightColorScheme,
  typography: myTypography,
);

ThemeData myHighContrastDarkThemeData = ThemeData(
  colorScheme: myHighContrastDarkColorScheme,
  typography: myTypography,
);
