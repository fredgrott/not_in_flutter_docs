// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'package:flutter/material.dart';

import 'package:golden_toolkit/golden_toolkit.dart';




import 'golden_basefullfwp_rootwidget.dart';
import 'golden_baselitefwp_rootwidget.dart';

// Gist: Wrappers so that we can serve up Root Widgets to wrap a 
//       an app screen set of widgets or an individual widget under test.


WidgetWrapper goldenBaseLiteFWPRootWidgetWrapper({
  TargetPlatform platform = TargetPlatform.android,
  Iterable<Locale>? localeOverrides,
  ThemeData? theme,
  ThemeData? darkTheme,
  ThemeMode? myThemeMode,
  
  Widget? myChild,
  NavigatorObserver? navigatorObserver,
}) {
  return (child) => GoldenBaseLiteFWPRootWidget(
        localeOverrides: localeOverrides ?? const [Locale('en')],
        // ignore: cast_nullable_to_non_nullable
        myDarkTheme: darkTheme?.copyWith(platform: platform) as ThemeData,
        // ignore: cast_nullable_to_non_nullable
        myTheme: theme?.copyWith(platform: platform) as ThemeData,
        
        // ignore: cast_nullable_to_non_nullable
        myThemeMode: myThemeMode as ThemeMode,
        navigatorObserver: navigatorObserver,
        myChild: myChild,
      );
}

WidgetWrapper goldenBaseFullFWPRootWidgetWrapper({
  TargetPlatform platform = TargetPlatform.android,
  Iterable<Locale>? localeOverrides,
  ThemeData? theme,
  ThemeData? darkTheme,
  ThemeMode? myThemeMode,
  
  Widget? myChild,
  NavigatorObserver? navigatorObserver,
}) {
  return (child) => GoldenBaseFullFWPRootWidget(
    
    // ignore: cast_nullable_to_non_nullable
    myDarkTheme: darkTheme?.copyWith(platform: platform) as ThemeData, 
    // ignore: cast_nullable_to_non_nullable
    
    
    // ignore: cast_nullable_to_non_nullable
    
    myChild: myChild, 
    // ignore: cast_nullable_to_non_nullable
    myTheme: theme?.copyWith(platform: platform) as ThemeData, 
    // ignore: cast_nullable_to_non_nullable
    myThemeMode: myThemeMode as ThemeMode, 
    localeOverrides: localeOverrides ?? const [Locale('en')], 
    navigatorObserver: navigatorObserver, 
    

  );
}
