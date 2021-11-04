// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// ignore_for_file: avoid_redundant_argument_values

import 'package:flutter/material.dart';
import 'package:gtdd_ten/src/presentation/themes/my_app_colorschemes.dart';
import 'package:gtdd_ten/src/presentation/themes/my_appcolors.dart';

ButtonThemeData myButtonThemeData = ButtonThemeData(
  textTheme: ButtonTextTheme.accent,
  minWidth: 88,
  height: 36,
  padding: EdgeInsetsGeometry.infinity,
  layoutBehavior: ButtonBarLayoutBehavior.padded,
  alignedDropdown: true,
  buttonColor: myLightSecondaryVariantColor,
  disabledColor: Colors.grey,
  colorScheme: myLightColorScheme,
  materialTapTargetSize: MaterialTapTargetSize.padded,

);
