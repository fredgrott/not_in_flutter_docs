// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// Gist: The Root or Base Widget that needs to be returned as the
//       child of the Golden Toolkit Widget wrapper has to be a
//       stateful or stateless widget. I.E. the top widget cannot
//       be a builder or theme. Thus, I need to mirror MyApp
//       but without the onGenerateRoute and I should be able to
//       that also to wrap single widgets not just app screens.

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:gtdd_thirteen/src/infrastructure/app_vars.dart';
import 'package:gtdd_thirteen/src/localization_gen/l10n.dart';
import 'package:gtdd_thirteen/src/presentation/features/home/ui/sampleitem_detailsview.dart';
import 'package:gtdd_thirteen/src/presentation/features/home/ui/sampleitem_listview.dart';
import 'package:gtdd_thirteen/src/presentation/features/settings/ui/settingsview.dart';
import 'package:gtdd_thirteen/src/presentation/features/settings/viewcontrollers/settings_controller.dart';
import 'package:lifecycle/lifecycle.dart';

class GoldenBaseWidget extends StatelessWidget {
  final SettingsController settingsController;
  final Iterable<Locale>? localeOverrides;
  final Widget? myChild;
  final ThemeData theme;
  final ThemeData darkTheme;
  final CupertinoThemeData cupertinoThemeData;
  final NavigatorObserver? navigatorObserver;
  final ThemeMode myThemeMode;

  const GoldenBaseWidget({
    Key? key,
    this.myChild,
    required this.settingsController,
    required this.theme,
    required this.darkTheme,
    required this.cupertinoThemeData,
    required this.localeOverrides,
    required this.navigatorObserver,
    required this.myThemeMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LifecycleWrapper(
        onLifecycleEvent: (event) {
          log("MyHomePage:$event");
        },
        child: Theme(
          data: theme,
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
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: localeOverrides,
                onGenerateTitle: (BuildContext context) =>
                    S.of(context).appTitle,
                navigatorObservers: [
                  if (navigatorObserver != null)
                    // ignore: cast_nullable_to_non_nullable
                    navigatorObserver as NavigatorObserver,
                  defaultLifecycleObserver,
                ],
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
                  theme: theme,
                  darkTheme: darkTheme,
                  themeMode: myThemeMode,
                ),
                cupertino: (
                  _,
                  __,
                ) =>
                    CupertinoAppData(
                  // we pass a MaterialBasedCupertinoThemeData thing here to route with full material colors through
                  // the Cupertino Widget Themes.
                  theme: cupertinoThemeData,
                ),
                home: Material(child: myChild),
              );
            },
          ),
        ),
        ),
    );

    
  }
}
