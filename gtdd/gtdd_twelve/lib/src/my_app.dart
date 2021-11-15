// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:gtdd_twelve/src/infrastructure/app_vars.dart';
import 'package:gtdd_twelve/src/localization_gen/l10n.dart';
import 'package:gtdd_twelve/src/presentation/features/home/ui/sampleitem_detailsview.dart';
import 'package:gtdd_twelve/src/presentation/features/home/ui/sampleitem_listview.dart';
import 'package:gtdd_twelve/src/presentation/features/settings/ui/settingsview.dart';
import 'package:gtdd_twelve/src/presentation/features/settings/viewcontrollers/settings_controller.dart';
import 'package:gtdd_twelve/src/presentation/routes/my_routeobserver.dart';
import 'package:gtdd_twelve/src/presentation/themes/cupertino_themedata.dart';
import 'package:gtdd_twelve/src/presentation/themes/material_themedata.dart';

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
    return AnimatedBuilder(
      animation: settingsController,
      builder: (
        BuildContext context,
        Widget? child,
      ) {
        return 
        
        PlatformProvider(
          // We normally set iosUsesMaterialWidgets true
          // as we use a mix of material widgets with cupertino 
          // widgets
          settings: PlatformSettingsData(iosUsesMaterialWidgets: true),
          builder: (BuildContext context) => PlatformApp(
            // Since the POM is being used via the Page Object package 
            // we have no need to set a key or widget key for the 
            // PlatformApp as we grab the App by the top Widget type,
            // in this case we grab MyApp Widget by type.
            
            // most devs have the debug banner off as we test live and screenshot
            debugShowCheckedModeBanner: false,
            // we need this for specific things that integrate with it such  
            // as crash bug report library packages
            navigatorKey: navigatorKey,
            // set android scroll behavior
            scrollBehavior: const ScrollBehavior(
              androidOverscrollIndicator: AndroidOverscrollIndicator.stretch,
            ),
            // the restore ID of the app if app is closed under memory 
            // pressure by the OS
            restorationScopeId: "app",
            // internationalization
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
            // generate app title via internationalization
            onGenerateTitle: (BuildContext context) => S.of(context).appTitle,
            // navigation observers
            navigatorObservers: [MyRouteObserver()],
            // generate navigation routes of the app
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
          ),);
      },
    );
  }
}
