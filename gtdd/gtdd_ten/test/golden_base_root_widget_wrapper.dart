// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:gtdd_ten/src/infrastructure/app_vars.dart';

import 'golden_base_root_widget.dart';


WidgetWrapper goldenBaseRootWidgetWrapper({
  TargetPlatform platform = TargetPlatform.android,
  required ThemeData ourLightTheme,
  required ThemeData ourDarkTheme,
  Iterable<Locale>? localeOverrides,
  required ThemeMode ourThemeMode,

}) {
  return (Widget child) => GoldenBaseRootWidget(
    settingsController: settingsController,
    myChild: child,
    supportedLocales: localeOverrides ?? const [Locale('en')],
        // ignore: cast_nullable_to_non_nullable
    myLightTheme: ourLightTheme.copyWith(platform: platform),
        // ignore: cast_nullable_to_non_nullable
    myDarkTheme: ourDarkTheme.copyWith(platform: platform),
    myThemeMode: ourThemeMode,
    );
}
