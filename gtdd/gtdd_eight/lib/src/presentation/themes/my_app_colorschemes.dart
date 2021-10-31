// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'package:flutter/material.dart';
import 'package:gtdd_eight/src/presentation/themes/my_appcolors.dart';

// Dark:  200 Variant 50 or Variant 700
// light  500 Variant 700
//
//  Problem: In TargetApp Widget there is dark and light themes but
//           no way to do  highcontrast themes
//
//

ColorScheme myLightColorScheme = ColorScheme(
  primary: myLightPrimaryColor, // deep purple  A700
  primaryVariant: myLightPrimaryVariantColor, // deep purple 900?
  secondary: myLightSecondaryColor,
  secondaryVariant: myLightSecondaryVariantColor,
  surface: myLightSurfaceColor,
  background: myLightBackgroundColor,
  error: myLightErrorColor,
  onPrimary: myLightOnPrimaryColor,
  onSecondary: myLightOnSecondaryColor,
  onSurface: myLightOnSurfaceColor,
  onBackground: myLightOnBackgroundColor,
  onError: myLightOnErrorColor,
  brightness: Brightness.light,
);

ColorScheme myHighContrastLightColorScheme = ColorScheme(
  primary: myLightHighContrastPrimaryColor,
  primaryVariant: myLightHighContrastPrimaryVariantColor,
  secondary: myLightHighContrastSecondaryColor,
  secondaryVariant: myLightHighContrastSecondaryVariantColor,
  surface: myLightHighContrastSurfaceColor,
  background: myLightHighContrastBackgroundColor,
  error: myLightHighContrastErrorColor,
  onPrimary: myLightHighContrastOnPrimaryColor,
  onSecondary: myLightHighContrastOnSecondaryColor,
  onSurface: myLightHighContrastOnSurfaceColor,
  onBackground: myLightHighContrastOnBackgroundColor,
  onError: myLightHighContrastOnErrorColor,
  brightness: Brightness.light,
);

ColorScheme myDarkColorScheme = ColorScheme(
  primary: myDarkPrimaryColor,
  primaryVariant: myDarkPrimaryVariantColor,
  secondary: myDarkSecondaryColor,
  secondaryVariant: myDarkSecondaryVariantColor,
  surface: myDarkSurfaceColor,
  background: myDarkBackgroundColor,
  error: myDarkErrorColor,
  onPrimary: myDarkOnPrimaryColor,
  onSecondary: myDarkOnSecondaryColor,
  onSurface: myDarkOnSurfaceColor,
  onBackground: myDarkOnBackgroundColor,
  onError: myDarkOnErrorColor,
  brightness: Brightness.light,
);

ColorScheme myHighContrastDarkColorScheme = ColorScheme(
  primary: myDarkHighContrastPrimaryColor,
  primaryVariant: myDarkHighContrastPrimaryVariantColor,
  secondary: myDarkHighContrastSecondaryColor,
  secondaryVariant: myDarkHighContrastSecondaryVariantColor,
  surface: myDarkHighContrastSurfaceColor,
  background: myDarkHighContrastBackgroundColor,
  error: myDarkHighContrastErrorColor,
  onPrimary: myDarkHighContrastOnPrimaryColor,
  onSecondary: myDarkHighContrastOnSecondaryColor,
  onSurface: myDarkHighContrastOnSurfaceColor,
  onBackground: myDarkHighContrastOnBackgroundColor,
  onError: myDarkHighContrastOnErrorColor,
  brightness: Brightness.dark,
);
