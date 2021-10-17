// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:cupertino_override/src/localization_gen/l10n.dart';
import 'package:cupertino_override/src/presentation/features/home/ui/sample_item_details_view.dart';
import 'package:cupertino_override/src/presentation/features/home/ui/sample_item_list_view.dart';
import 'package:cupertino_override/src/presentation/features/settings/ui/settings_view.dart';
import 'package:cupertino_override/src/presentation/features/settings/viewcontroller/settings_controller.dart';
import 'package:cupertino_override/src/presentation/themes/myappthemedata.dart';
import 'package:cupertino_override/src/presentation/themes/mycupertinothemedata.dart';
import 'package:cupertino_override/src/presentation/themes/mymaterialtheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.settingsController,
  }) : super(key: key);

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: settingsController,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: myMaterialTheme,
          child: PlatformProvider(
            settings: PlatformSettingsData(iosUsesMaterialWidgets: true),
            builder: (context) => PlatformApp(
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('en', ''), // English, no country code
              ],
              // Providing a restorationScopeId allows the Navigator built by the
              // MaterialApp to restore the navigation stack when a user leaves and
              // returns to the app after it has been killed while running in the
              // background.
              restorationScopeId: 'app',
              // Use AppLocalizations to configure the correct application title
              // depending on the user's locale.
              //
              // The appTitle is defined in .arb files found in the localization
              // directory.
              onGenerateTitle: (BuildContext context) => S.of(context).appTitle,
              material: (_, __) => MaterialAppData(
                theme: myMaterialTheme,
                debugShowCheckedModeBanner: false,
                darkTheme: myDarkThemeData,
                onGenerateRoute: (RouteSettings routeSettings) {
                  return MaterialPageRoute<void>(
                    settings: routeSettings,
                    builder: (BuildContext context) {
                      switch (routeSettings.name) {
                        case SettingsView.routeName:
                          return SettingsView(controller: settingsController);
                        case SampleItemDetailsView.routeName:
                          return const SampleItemDetailsView();
                        case SampleItemListView.routeName:
                        default:
                          return const SampleItemListView();
                      }
                    },
                  );
                },
              ),
              cupertino: (_, __) => CupertinoAppData(
                debugShowCheckedModeBanner: false,
                theme: myCupertinoThemeData,
                onGenerateRoute: (RouteSettings routeSettings) {
                  return CupertinoPageRoute<void>(
                    settings: routeSettings,
                    builder: (BuildContext context){
                      switch (routeSettings.name) {
                        case SettingsView.routeName:
                          return SettingsView(controller: settingsController);
                        case SampleItemDetailsView.routeName:
                          return const SampleItemDetailsView();
                        case SampleItemListView.routeName:
                        default:
                          return const SampleItemListView();
                      }
                    },);
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
