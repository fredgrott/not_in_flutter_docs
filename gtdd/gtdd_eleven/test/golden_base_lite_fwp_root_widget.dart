// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'package:gtdd_eleven/src/localization_gen/l10n.dart';

// Gist: The CupertinoApp has theme set to null and the Material
//       ThemeData overrideCupertinoTheme by default is null.
//       This means for cross-platform

class GoldenBaseLiteFWPRootWidget extends StatelessWidget {
  final Iterable<Locale>? localeOverrides;
  final Widget? myChild;
  final ThemeData myTheme;
  final ThemeData myDarkTheme;
  final ThemeMode myThemeMode;
  final CupertinoThemeData? myCupertinoTheme;
  final NavigatorObserver? navigatorObserver;

  const GoldenBaseLiteFWPRootWidget({
    Key? key,
    this.myChild,
    required this.myThemeMode,
    required this.myDarkTheme,
    required this.myTheme,
    // note in case of overrideCupertinoTheme in ThemeData
    // we would not still have a CupertinoTheme. Instead the overrideCupertinoTheme gets
    // a theme with the type of NoDefaultCupertinoThemeData.
    this.myCupertinoTheme,
    required this.navigatorObserver,
    required this.localeOverrides,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: myTheme, 
      child: PlatformProvider(
        settings: PlatformSettingsData(
          iosUsesMaterialWidgets: true,
        ),
        builder: (BuildContext context) => PlatformApp(
          key: const Key('PlatformApp'),
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: localeOverrides,
          onGenerateTitle: (BuildContext context) => S.of(context).appTitle,
          navigatorObservers: [
            
            if (navigatorObserver != null)
              // ignore: cast_nullable_to_non_nullable
              navigatorObserver as NavigatorObserver,
          ],
          material: (
            _,
            __,
          ) =>
              MaterialAppData(
            // so we can supply the theme in the Wrapper with a platform target attached
            // for full visual acceptance testing ios vs android, cupertino vs material
            theme: myTheme,
            darkTheme: myDarkTheme,
            // so we switch themeMode to simulate theme choice by user
            themeMode: myThemeMode,
            // no onGenerateRoute in root widget
          ),
          cupertino: (
            _,
            __,
          ) =>
              CupertinoAppData(
            // since I deliver the right Material Theme dynamically
            // based on ThemeMode I do not have to provide a parameter option
            // for this item for the wrapper.
            theme: myCupertinoTheme,
            // no onGenerateRoute in root widget
          ),
          // where the widget under test is inserted into a widget tree
          home: Material(child: myChild),
        ),

    ),);

    
  }
}
