// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gtdd_ten/src/localization_gen/l10n.dart';
import 'package:gtdd_ten/src/presentation/features/settings/viewcontrollers/settings_controller.dart';

// Gist: Rewritten Base Root Widget so that can use golden toolkit and 
//       mockingjay together.

class GoldenBaseRootWidget extends StatelessWidget {
  final SettingsController settingsController;
  final Widget? myChild;
  final ThemeData myLightTheme;
  final ThemeData myDarkTheme;
  final ThemeMode myThemeMode;
  final Iterable<Locale> supportedLocales;

  const GoldenBaseRootWidget({
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
    return AnimatedBuilder(
      animation: settingsController,
      builder: (
        BuildContext context,
        Widget? child,
      ) {
        return MaterialApp(
          // do not run debug banner during goldens
          debugShowCheckedModeBanner: false,
          //restorationScopeId: "app",
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: supportedLocales,

          onGenerateTitle: (BuildContext context) => S.of(context).appTitle,

          theme: myLightTheme,
          darkTheme: myDarkTheme,
          themeMode: myThemeMode,

          // ignore: cast_nullable_to_non_nullable
          home: Material(child: myChild),
        );
      },
    );
  }
}
