// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:gtdd_fourteen/src/infrastructure/app_vars.dart';
import 'package:gtdd_fourteen/src/localization_gen/l10n.dart';
import 'package:gtdd_fourteen/src/presentation/features/home/ui/sampleitem_detailsview.dart';
import 'package:gtdd_fourteen/src/presentation/features/home/ui/sampleitem_listview.dart';
import 'package:gtdd_fourteen/src/presentation/features/settings/ui/settingsview.dart';
import 'package:gtdd_fourteen/src/presentation/features/settings/viewcontrollers/settings_controller.dart';

import 'package:gtdd_fourteen/src/presentation/themes/cupertino_themedata.dart';
import 'package:gtdd_fourteen/src/presentation/themes/material_themedata.dart';
import 'package:lifecycle/lifecycle.dart';

class MyApp extends StatelessWidget {
  final SettingsController settingsController;

  const MyApp({
    Key? key,
    required this.settingsController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Theme Changes are triggered by this AnimatedBuilder, which is why we do
    // not need the Theme widget at top of widget tree as shown in the
    // FPW examples
    return LifecycleWrapper(
      onLifecycleEvent: (event) {
          log("MyHomePage:$event");
        },
      child: Theme(
        data: materialLightMaterialThemeData,
        child: PlatformProvider(
          settings: PlatformSettingsData(iosUsesMaterialWidgets: true),
          builder: (context) => AnimatedBuilder(
            animation: settingsController,
            builder: (
              BuildContext context,
              Widget? child,
            ) {
              return PlatformApp(
                navigatorKey: navigatorKey,
                key: const Key("PlatformApp"),
                debugShowCheckedModeBanner: false,
                restorationScopeId: "app",
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: const [
                  Locale(
                    'en',
                    '',
                  ), // English, no country code
                ],
                onGenerateTitle: (BuildContext context) =>
                    S.of(context).appTitle,
                navigatorObservers: [defaultLifecycleObserver],
                onGenerateRoute: (RouteSettings routeSettings) {
                  // platformPageRoute is Flutter Platform Widgets way to deliver
                  // the right platform transitions along with nav route generation.
                  // source is at:
                  // https://github.com/stryder-dev/flutter_platform_widgets/blob/master/lib/src/platform_page_route.dart
                  return platformPageRoute<dynamic>(
                    context: context,
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
                material: (
                  _,
                  __,
                ) =>
                    MaterialAppData(
                  // Light and Dark Material Themes
                  theme: materialLightMaterialThemeData,
                  darkTheme: materialDarkMaterialThemeData,
                  // Theme Mode
                  themeMode: settingsController.themeMode,
                ),
                cupertino: (
                  _,
                  __,
                ) =>
                    CupertinoAppData(
                  // we pass a MaterialBasedCupertinoThemeData thing here to route with full
                  // material colors through
                  // the Cupertino Widget Themes.
                  theme: cupertinoThemeData,
                ),
              );
            },
          ),
        ),
      ),
    );

    
  }

  
}
