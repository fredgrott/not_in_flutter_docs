// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:gtdd_twelve/src/infrastructure/app_vars.dart';

import 'golden_base_widget.dart';

WidgetWrapper goldenBaseWidgetWrapper({
  TargetPlatform platform = TargetPlatform.android,
  Iterable<Locale>? localeOverrides,
  ThemeData? theme,
  ThemeData? darkTheme,
  CupertinoThemeData? myCupertinoThemeData,
  ThemeMode? myThemeMode,
  Widget? myChild,
  NavigatorObserver? navigatorObserver,
}) {
  return (child) => GoldenBaseWidget(
    // ignore: cast_nullable_to_non_nullable
    theme: theme?.copyWith(platform: platform) as ThemeData, 
    // ignore: cast_nullable_to_non_nullable
    darkTheme: darkTheme?.copyWith(platform: platform) as ThemeData, 
    // ignore: cast_nullable_to_non_nullable
    cupertinoThemeData: myCupertinoThemeData as CupertinoThemeData, 
    // ignore: cast_nullable_to_non_nullable
    myThemeMode: myThemeMode as ThemeMode, 
    
    settingsController: settingsController, 
    
    localeOverrides: localeOverrides ?? const [Locale('en')], 
    
    navigatorObserver: navigatorObserver, 

    myChild: myChild, 
    

  );
}
