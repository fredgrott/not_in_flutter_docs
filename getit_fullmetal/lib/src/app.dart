import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:getit_fullmetal/src/localization_gen/l10n.dart';
import 'package:lifecycle/lifecycle.dart';

import 'presentation/features/home/sample_item_details_view.dart';
import 'presentation/features/home/sample_item_list_view.dart';
import 'presentation/features/settings/controllers/settings_controller.dart';
import 'presentation/features/settings/ui/settings_view.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  final SettingsController settingsController;

  const MyApp({
    Key? key,
    required this.settingsController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Glue the SettingsController to the MaterialApp.
    //
    // The AnimatedBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    //
    // I am leaving the lifecycle wrapper off of my WidgetApp Root implementation
    // as I only need lifecycle events for screens and it makes the
    // FPW integration easier.
    return AnimatedBuilder(
      animation: settingsController,
      builder: (
        BuildContext context,
        Widget? child,
      ) {
        return LifecycleWrapper(
            onLifecycleEvent: (event) {
              log('App#${event.toString()}');
            },
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              // Providing a restorationScopeId allows the Navigator built by the
              // MaterialApp to restore the navigation stack when a user leaves and
              // returns to the app after it has been killed while running in the
              // background.
              restorationScopeId: 'app',
              navigatorObservers: [defaultLifecycleObserver],

                // Provide the generated AppLocalizations to the MaterialApp. This
                // allows descendant Widgets to display the correct translations
                // depending on the user's locale.
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

              // Use AppLocalizations to configure the correct application title
              // depending on the user's locale.
              //
              // The appTitle is defined in .arb files found in the localization
              // directory.
              onGenerateTitle: (BuildContext context) => S.of(context).appTitle,

             // Define a light and dark color theme. Then, read the user's
             // preferred ThemeMode (light, dark, or system default) from the
             // SettingsController to display the correct theme.
             theme: ThemeData(),
             darkTheme: ThemeData.dark(),
             themeMode: settingsController.themeMode,

            // Define a function to handle named routes in order to support
            // Flutter web url navigation and deep linking.
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
        );

        
      },
    );
  }
}
