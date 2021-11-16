// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:gtdd_thirteen/src/presentation/themes/material_colors.dart';
import 'package:gtdd_thirteen/src/presentation/themes/material_colorschemes.dart';



ButtonThemeData materialLightButtonThemeData = ButtonThemeData(
  textTheme: ButtonTextTheme.primary,
  // ignore: avoid_redundant_argument_values
  minWidth: 88,
  // ignore: avoid_redundant_argument_values
  height: 36,
  padding: EdgeInsetsGeometry.infinity,
  // ignore: avoid_redundant_argument_values
  layoutBehavior: ButtonBarLayoutBehavior.padded,
  alignedDropdown: true,
  splashColor: materialLightSurfaceColor,
  highlightColor: materialLightSecondaryColor,
  hoverColor: materialLightPrimaryColor,
  focusColor: materialLightPrimaryVariantColor,
  disabledColor: Colors.grey,
  buttonColor: materialLightSecondaryVariantColor,
  colorScheme: materialLightColorScheme,
  materialTapTargetSize: MaterialTapTargetSize.padded,
);

ButtonThemeData materialDarkButtonThemeData = ButtonThemeData(
  textTheme: ButtonTextTheme.primary,
  // ignore: avoid_redundant_argument_values
  minWidth: 88,
  // ignore: avoid_redundant_argument_values
  height: 36,
  padding: EdgeInsetsGeometry.infinity,
  // ignore: avoid_redundant_argument_values
  layoutBehavior: ButtonBarLayoutBehavior.padded,
  alignedDropdown: true,
  splashColor: materialDarkSurfaceColor,
  highlightColor: materialDarkSecondaryColor,
  hoverColor: materialDarkPrimaryColor,
  focusColor: materialDarkPrimaryVariantColor,
  disabledColor: Colors.grey,
  buttonColor: materialDarkSecondaryVariantColor,
  colorScheme: materialLightColorScheme,
  materialTapTargetSize: MaterialTapTargetSize.padded,
);
