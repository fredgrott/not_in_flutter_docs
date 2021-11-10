// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:gtdd_twelve/src/infrastructure/app_vars.dart';
import 'package:gtdd_twelve/src/localization_gen/l10n.dart';
import 'package:gtdd_twelve/src/presentation/routes/my_routeobserver.dart';

class GoldenBaseFullFWPRootWidget extends StatelessWidget {
  final Iterable<Locale>? localeOverrides;
  final Widget? myChild;
  final ThemeData myTheme;
  final ThemeData myDarkTheme;
  final ThemeMode myThemeMode;

  final NavigatorObserver? navigatorObserver;

  const GoldenBaseFullFWPRootWidget({
    Key? key,
    this.myChild,
    required this.myThemeMode,
    required this.myDarkTheme,
    required this.myTheme,
    required this.navigatorObserver,
    required this.localeOverrides,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: settingsController,
      builder: (
        BuildContext context,
        Widget? child,
      ) {
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
                MyRouteObserver(),
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
                
                // no onGenerateRoute in root widget
              ),
              // where the widget under test is inserted into a widget tree
              home: Material(child: myChild),
            ),
          ),
        );
      },
    );
  }
}
