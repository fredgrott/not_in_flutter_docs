// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:gtdd_eleven/src/localization_gen/l10n.dart';
import 'package:gtdd_eleven/src/presentation/features/home/ui/sampleitem_detailsview.dart';
import 'package:gtdd_eleven/src/presentation/features/home/ui/sampleitem_listview.dart';
import 'package:gtdd_eleven/src/presentation/features/settings/ui/settingsview.dart';
import 'package:gtdd_eleven/src/presentation/features/settings/viewcontrollers/settings_controller.dart';
import 'package:gtdd_eleven/src/presentation/themes/my_cupertinobasematerialdata.dart';
import 'package:gtdd_eleven/src/presentation/themes/my_material_themedata.dart';

class MyApp extends StatelessWidget {
  final SettingsController settingsController;

  const MyApp({
    Key? key,
    required this.settingsController,
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
          data: myLightMaterialThemeData,
          // Switches platforms so we can get same feature as Android Studio of
          // being able to view iOS on android and vice versa. Source is at
          // https://github.com/stryder-dev/flutter_platform_widgets/blob/master/lib/src/platform_provider.dart
          child: PlatformProvider(
            // legacy settings and what style per platform, ie material or cupertino
            // at same source as provider, at:
            // https://github.com/stryder-dev/flutter_platform_widgets/blob/master/lib/src/platform_provider.dart
            settings: PlatformSettingsData(iosUsesMaterialWidgets: true),
            // Both MaterialApp and CupertinoApp are know as specific
            // platform versions dissimilar to the WidgetsApp.
            //
            // PlatformApp of Flutter Platform Widgets extends this in a way to
            // dynamically deliver Material widgets on material targets and
            // Cupertino Widgets on cupertino targets by dynamically supplying
            // either a MaterialApp or CupertinoApp widget. The source for this at:
            // https://github.com/stryder-dev/flutter_platform_widgets/blob/master/lib/src/platform_app.dart
            builder: (BuildContext context) => PlatformApp(
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
              // Almost ever Platform Widget from the Flutter Platform Widgets
              // package has two builders, Material and Cupertino. We use these
              // builders to customize some aspect of the parent Platform Widget.
              // In the case of the PlatformApp we usually set such things as themes.
              // source at:
              // https://github.com/stryder-dev/flutter_platform_widgets/blob/master/lib/src/platform_app.dart
              material: (
                _,
                __,
              ) =>
                  MaterialAppData(
                theme: myLightMaterialThemeData,
                darkTheme: myDarkMaterialThemeData,
                themeMode: settingsController.themeMode,
              ),
              cupertino: (
                _,
                __,
              ) =>
                  CupertinoAppData(
                // we pass a MaterialBasedCupertinoThemeData thing here to route with full material colors through
                // the Cupertino Widget Themes.
                theme: myCupertinoBasedMaterialThemeData,
              ),
            ),
          ),
        );
      },
    );
  }
}
