// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// Note: This is what the golden toolkit wrapper looks like:
// WidgetWrapper materialAppWrapper({
//  TargetPlatform platform = TargetPlatform.android,
//  Iterable<LocalizationsDelegate<dynamic>>? localizations,
//  NavigatorObserver? navigatorObserver,
//  Iterable<Locale>? localeOverrides,
//  ThemeData? theme,
//}) {
//  return (child) => MaterialApp(
//        localizationsDelegates: localizations,
//        supportedLocales: localeOverrides ?? const [Locale('en')],
//        theme: theme?.copyWith(platform: platform),
//        debugShowCheckedModeBanner: false,
//        home: Material(child: child),
//        navigatorObservers: [
//          if (navigatorObserver != null) navigatorObserver,
//        ],
//     );
//}
// from https://github.com/eBay/flutter_glove_box/blob/master/packages/golden_toolkit/lib/src/testing_tools.dart
//
// One needs to take what the app RootWidget is an mirror it this goldens wrapper to
// supply a RootWidget implementation to as the parent widget in the widget tree to
// receive the widget under test.

import 'package:flutter/material.dart';

import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:gtdd_six/src/domain/app_vars.dart';
import 'package:gtdd_six/src/presentation/themes/my_app_themedata.dart';

import 'golden_root_widget.dart';

// I changed MyApp to include an optional extra widget in the home
// slot to make it usable as part of this RootWidget Wrapper for
// test-style widget unit testing via Golden Test Driven Development.
//
//  The gist of this is that we want to be able to supply mocks, etc to
//  visually test regressions on all the platforms. Thus, we need ways
//  to supply platform mocks, theme mocks, etc.
//
// Differences from golden toolkit example of wrapper in here:
// https://github.com/eBay/flutter_glove_box/blob/master/packages/golden_toolkit/lib/src/testing_tools.dart
// is that we cannot included localizations other than the local overrides as 
// the wrapper then bombs with a huge amount of exceptions. Longer research 
// task to see why and then implement tests on internationalization.
//
// The set up is set so that the dev supplies light and dark themes with 
// platform and themes defaulting to light and dark themes and android platform.
WidgetWrapper myModifiedRootWidgetWrapper({
  TargetPlatform platform = TargetPlatform.android,
  required ThemeData ourLightTheme,
  required ThemeData ourDarkTheme,
  Iterable<Locale>? localeOverrides,
}) {
  return (child) => MyAppRootWidget(
        settingsController: settingsController,
        myChild: child,
        // ignore: cast_nullable_to_non_nullable
        myLightTheme: ourLightTheme.copyWith(platform: platform),
        // ignore: cast_nullable_to_non_nullable
        myDarkTheme: ourDarkTheme.copyWith(platform: platform),
      );
}
