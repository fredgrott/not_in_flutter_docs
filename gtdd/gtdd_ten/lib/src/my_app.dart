// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:gtdd_ten/src/localization_gen/l10n.dart';
import 'package:gtdd_ten/src/presentation/features/home/ui/sampleitem_detailsview.dart';
import 'package:gtdd_ten/src/presentation/features/home/ui/sampleitem_listview.dart';
import 'package:gtdd_ten/src/presentation/features/settings/ui/settingsview.dart';
import 'package:gtdd_ten/src/presentation/features/settings/viewcontrollers/settings_controller.dart';
import 'package:gtdd_ten/src/presentation/themes/my_material_themedata.dart';
import 'package:gtdd_ten/src/presentation/themes/my_cupertinobasematerialdata.dart';

class MyApp extends StatelessWidget {
  final SettingsController settingsController;

  const MyApp({
    Key? key,
    required this.settingsController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // For themes to flow through Flutter Platform Widgets correctly need
    // both Theme as parent and PlatformProvider. This way I can properly
    // platforms during Goldens testing for example.
    return Theme(
      data: myLightMaterialThemeData,
      child: PlatformProvider(
        settings: PlatformSettingsData(iosUsesMaterialWidgets: true),
        builder: (context) => AnimatedBuilder(
          animation: settingsController,
          builder: (
            BuildContext context,
            Widget? child,
          ) {
            return PlatformApp(
              key: const Key('PlatformApp'),
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
              onGenerateTitle: (BuildContext context) => S.of(context).appTitle,
              material: (
                _,
                __,
              ) =>
                  MaterialAppData(
                theme: myLightMaterialThemeData,
                darkTheme: myDarkMaterialThemeData,
                themeMode: settingsController.themeMode,
                onGenerateRoute: (RouteSettings routeSettings) {
                  // so we have Material transitions on non-Apple devices
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
              cupertino: (
                _,
                __,
              ) =>
                  CupertinoAppData(
                // we pass a MaterialBasedCupertinoThemeData thing here to route with full material colors through
                // the Cupertino Widget Themes.
                theme: myCupertinoBasedMaterialThemeData,
                onGenerateRoute: (RouteSettings routeSettings) {
                  // so that we have Cupertino based page transitions on Apple devices
                  return CupertinoPageRoute<void>(
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
            );
          },
        ),
      ),
    );
  }
}
