// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gtdd_seven/src/localization_gen/l10n.dart';

import 'package:gtdd_seven/src/presentation/features/settings/viewcontrollers/settings_controller.dart';

class MyAppRootWidget extends StatelessWidget {
  final SettingsController settingsController;
  final Widget? myChild;
  final ThemeData myLightTheme;
  final ThemeData myDarkTheme;
  final ThemeMode myThemeMode;
  final Iterable<Locale> supportedLocales;


  const MyAppRootWidget({
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
    // Glue the SettingsController to the MaterialApp.
    //
    // The AnimatedBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return AnimatedBuilder(
      animation: settingsController,
      builder: (BuildContext context, Widget? child,) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          // Providing a restorationScopeId allows the Navigator built by the
          // MaterialApp to restore the navigation stack when a user leaves and
          // returns to the app after it has been killed while running in the
          // background.

          //restorationScopeId: "app",

          // Provide the generated AppLocalizations to the MaterialApp. This
          // allows descendant Widgets to display the correct translations
          // depending on the user's locale.
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: supportedLocales, // English, no country code
          

          // Use AppLocalizations to configure the correct application title
          // depending on the user's locale.
          //
          // The appTitle is defined in .arb files found in the localization
          // directory.
          onGenerateTitle: (BuildContext context) => S.of(context).appTitle,

          // Define a light and dark color theme. Then, read the user's
          // preferred ThemeMode (light, dark, or system default) from the
          // SettingsController to display the correct theme.
          theme: myLightTheme,
          darkTheme: myDarkTheme,
          themeMode: myThemeMode,

          // Define a function to handle named routes in order to support
          // Flutter web url navigation and deep linking.
          home: Material(child: myChild),
        );
      },
    );
  }
}
