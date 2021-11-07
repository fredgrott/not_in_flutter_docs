// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:gtdd_ten/src/localization_gen/l10n.dart';
import 'package:gtdd_ten/src/presentation/features/settings/viewcontrollers/settings_controller.dart';

import 'package:gtdd_ten/src/presentation/themes/my_cupertinobasematerialdata.dart';

// Gist: The onlty difference betwwen this and the MyApp class is that we do not
//       provide onGenerateRoute as that is handled by whatever navigation mocking
//       library is being used. The Wrapper takes care of what things we can
//       vary in Goldens Tests.
//
//       For individual Widget Testing we use a different lite wrapper as we only want
//       themes injected but nothing else except a Material container.

class GoldenBaseFPWRootWidget extends StatelessWidget {
  final SettingsController settingsController;
  final Widget? myChild;
  final ThemeData myLightTheme;
  final ThemeData myDarkTheme;
  final ThemeMode myThemeMode;
  final Iterable<Locale> supportedLocales;

  const GoldenBaseFPWRootWidget({
    Key? key,
    required this.settingsController,
    this.myChild,
    required this.myLightTheme,
    required this.myDarkTheme,
    required this.myThemeMode,
    required this.supportedLocales,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: myLightTheme,
      child: PlatformProvider(
        settings: PlatformSettingsData(
          iosUsesMaterialWidgets: true,
        ),
        builder: (context) => AnimatedBuilder(
          animation: settingsController,
          builder: (
            BuildContext context,
            Widget? child,
          ) {
            return PlatformApp(
              key: const Key('PlatformApp'),
              debugShowCheckedModeBanner: false,
              // do not use restorationScopeID in root widget
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              // this waty we can switch locales for internalization testing
              supportedLocales: supportedLocales,
              onGenerateTitle: (BuildContext context) => S.of(context).appTitle,

              material: (
                _,
                __,
              ) =>
                  MaterialAppData(
                // so we can supply the theme in the Wrapper with a platform target attached
                // for full visual acceptance testing ios vs android, cupertino vs material
                theme: myLightTheme,
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
                theme: myCupertinoBasedMaterialThemeData,
                // no onGenerateRoute in root widget
              ),
              // this is where our Screen set of Widgets get's inserted into the widget tree
              home: Material(child: myChild),
            );
          },
        ),
      ),
    );
  }
}
