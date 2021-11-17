// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:gtdd_fourteen/src/presentation/themes/material_colors.dart';


ColorScheme materialLightColorScheme = ColorScheme(
  primary: materialLightPrimaryColor,
  primaryVariant: materialLightPrimaryVariantColor,
  secondary: materialLightSecondaryColor,
  secondaryVariant: materialLightSecondaryVariantColor,
  surface: materialLightSurfaceColor,
  background: materialLightBackgroundColor,
  error: materialLightErrorColor,
  onPrimary: materialLightOnPrimaryColor,
  onSecondary: materialLightOnSecondaryColor,
  onSurface: materialLightOnSurfaceColor,
  onBackground: materialLightOnBackgroundColor,
  onError: materialLightOnErrorColor,
  brightness: Brightness.light,
);

ColorScheme materialDarkColorScheme = ColorScheme(
  primary: materialDarkPrimaryColor,
  primaryVariant: materialDarkPrimaryVariantColor,
  secondary: materialDarkSecondaryColor,
  secondaryVariant: materialDarkSecondaryVariantColor,
  surface: materialDarkSurfaceColor,
  background: materialDarkBackgroundColor,
  error: materialDarkErrorColor,
  onPrimary: materialDarkOnPrimaryColor,
  onSecondary: materialDarkOnSecondaryColor,
  onSurface: materialDarkOnSurfaceColor,
  onBackground: materialDarkOnBackgroundColor,
  onError: materialDarkOnErrorColor,
  brightness: Brightness.dark,
);
