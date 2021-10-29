// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'package:flutter/material.dart';
import 'package:gtdd_seven/src/presentation/themes/my_cupertino_themedata.dart';
import 'package:gtdd_seven/src/presentation/themes/my_typography.dart';

ThemeData myMaterialTheme = ThemeData(
  cupertinoOverrideTheme: myCupertinoThemeData,
  typography: myTypography,
);
