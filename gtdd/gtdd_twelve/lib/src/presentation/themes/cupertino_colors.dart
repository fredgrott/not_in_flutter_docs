// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// Cupertino will only have these colors:
//      Primary
//      PrimaryVariant(PrimaryConstrastingColor)
//      BarBackgroundColor
//      ScaffoldBackgroundColor

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gtdd_twelve/src/presentation/themes/material_colors.dart';

CupertinoDynamicColor cupertinoPrimaryColor =
    CupertinoDynamicColor.withBrightnessAndContrast(
  color: materialLightPrimaryColor,
  darkColor: materialDarkPrimaryColor,
  highContrastColor: materialLightSecondaryVariantColor,
  darkHighContrastColor: materialDarkSecondaryVariantColor,
);

CupertinoDynamicColor cupertinoPrimaryVariantColor =
    CupertinoDynamicColor.withBrightnessAndContrast(
  color: materialLightPrimaryVariantColor,
  darkColor: materialDarkPrimaryVariantColor,
  highContrastColor: materialLightSecondaryColor,
  darkHighContrastColor: materialDarkSecondaryColor,
);

// CupertinoNavigationBar background color
CupertinoDynamicColor cupertinoBarBackgroundColor =
    CupertinoDynamicColor.withBrightnessAndContrast(
  color: materialLightPrimaryColor,
  darkColor: materialDarkPrimaryColor,
  highContrastColor: materialLightSecondaryVariantColor,
  darkHighContrastColor: materialDarkSecondaryVariantColor,
);

// scaffold color is the color of screen underneath
CupertinoDynamicColor cupertinoScaffoldBackgroundColor =
    const CupertinoDynamicColor.withBrightnessAndContrast(
  color: Colors.white,
  darkColor: Color(0xff121212),
  highContrastColor: Colors.white,
  darkHighContrastColor: Color(0xff121212),
);
