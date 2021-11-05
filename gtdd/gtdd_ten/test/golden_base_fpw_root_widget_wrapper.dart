// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:gtdd_ten/src/infrastructure/app_vars.dart';

import 'golden_base_fpw_root_widget.dart';

WidgetWrapper goldenBaseFPWRootWidgetWrapper({
  TargetPlatform platform = TargetPlatform.android,
  required ThemeData ourLightTheme,
  required ThemeData ourDarkTheme,
  Iterable<Locale>? localeOverrides,
  required ThemeMode ourThemeMode,
}) {
  return (Widget child) => GoldenBaseFPWRootWidget(
        settingsController: settingsController,
        myChild: child,
        myLightTheme: ourLightTheme.copyWith(platform: platform),
        myDarkTheme: ourDarkTheme.copyWith(platform: platform),
        myThemeMode: ourThemeMode,
        supportedLocales: localeOverrides ?? const [Locale('en')],
      );
}
