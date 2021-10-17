// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:cupertino_overrride/src/presentation/themes/my_typography.dart';

import 'package:cupertino_overrride/src/presentation/themes/mycupertinothemedata.dart';
import 'package:flutter/material.dart';

ThemeData myMaterialTheme = ThemeData(
  cupertinoOverrideTheme: myCupertinoThemeData,
  typography: myTypography,
  

);
