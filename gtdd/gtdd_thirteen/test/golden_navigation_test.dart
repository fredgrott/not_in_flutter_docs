// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// ignore_for_file: unnecessary_parenthesis

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:gtdd_thirteen/src/infrastructure/app_vars.dart';
import 'package:gtdd_thirteen/src/presentation/features/home/ui/sampleitem_detailsview.dart';
import 'package:gtdd_thirteen/src/presentation/features/home/ui/sampleitem_listview.dart';
import 'package:gtdd_thirteen/src/presentation/features/settings/ui/settingsview.dart';
import 'package:gtdd_thirteen/src/presentation/themes/cupertino_themedata.dart';
import 'package:gtdd_thirteen/src/presentation/themes/material_themedata.dart';
import 'package:mocktail/mocktail.dart';

import 'golden_base_widgetwrapper.dart';
import 'golden_navigation_matchers.dart';
import 'golden_page_objects.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class MockRoute extends Mock implements Route<dynamic> {}

// Can not use as Fake uses reflection which we do not have
// on web or mobile
//class RouteFake extends Fake implements Route<dynamic> {}

void main() {
  late NavigatorObserver mockNavigationObserver;

  late Route<dynamic> mockRoute;

  setUpAll(() async {
    mockRoute = MockRoute();
    // to mock Route<dynamic> using mocktail
    registerFallbackValue(mockRoute);
    // This Flutter Engine is running binding turns off
    // http and  https access which is why we use mocks
    // in goldens testing driven design.
    //
    // Putting it in a setUpAll method means its used for all testing in
    // this testing suite.
    TestWidgetsFlutterBinding.ensureInitialized();

    mockNavigationObserver = MockNavigatorObserver();

    await settingsController.loadSettings();

    // stubbing nav observer calls
    // to and from settings
    when(
      () => mockNavigationObserver.didPop(
        any(that: isRoute<String?>(named: '/settings')),
        any(that: isRoute<String?>(named: "/")),
      ),
    ).thenAnswer((_) async => '/settings');
    when(
      () => mockNavigationObserver.didPop(
        any(that: isRoute<String?>(named: '/')),
        any(that: isRoute<String?>(named: "/settings")),
      ),
    ).thenAnswer((_) async => '/');

    // to and from sample_item
    when(
      () => mockNavigationObserver.didPop(
        any(that: isRoute<String?>(named: '/sample_item')),
        any(that: isRoute<String?>(named: "/")),
      ),
    ).thenAnswer((_) async => '/sample_item');

    when(
      () => mockNavigationObserver.didPop(
        any(that: isRoute<String?>(named: '/')),
        any(that: isRoute<String?>(named: "/sample_items")),
      ),
    ).thenAnswer((_) async => '/');
  });

  // to tear down mocked dependencies
  // ignore: no-empty-block
  tearDownAll(() async {});

  group(
    'Navigation Tests',
    () {
      Future<void> _buildStartSampleItemListViewScreen(
        WidgetTester tester,
      ) async {
        await tester.pumpWidgetBuilder(
          const SampleItemListView(),
          wrapper: goldenBaseWidgetWrapper(
            theme: materialLightMaterialThemeData,
            darkTheme: materialDarkMaterialThemeData,
            // ignore: cast_nullable_to_non_nullable
            myThemeMode: settingsController.themeMode as ThemeMode,
            navigatorObserver: mockNavigationObserver,
            myCupertinoThemeData: cupertinoThemeData,
          ),
        );

        final app = MyAppPageObject();

        expect(
          app.homeScreen.appBar,
          findsOneWidget,
        );

        expect(
          app.homeScreen.navButtonSettings,
          findsOneWidget,
        );
      }

      Future<void> _tapNavButtonToNavToSettingsScreen(
        WidgetTester tester,
      ) async {
        final app = MyAppPageObject();

        tester.tap(app.homeScreen.navButtonSettings);

        await tester.pump();
        await tester.pump(const Duration(seconds: 1));

        // still need to do a when stub of mockNavigationObserver
        // in setup. Diff from Mockingjay is that I am using an
        // navigator observer
        verify(
          () => mockNavigationObserver.didPush(
            any(that: isRoute<String?>(named: '/settings')),
            any(that: isRoute<String?>(named: "/")),
          ),
        );
      }

      Future<void> _tapNavButtonToNavToHomeScreenFromSettingsScreen(
        WidgetTester tester,
      ) async {
        final app = MyAppPageObject();

        await tester.tap(app.settingsScreen.navButtonHome);

        await tester.pump();
        await tester.pump(const Duration(seconds: 1));

        // still need to do a when stub of mockNavigationObserver
        // in setup. Diff from Mockingjay is that I am using an
        // navigator observer
        verify(
          () => mockNavigationObserver.didPush(
            any(that: isRoute<String?>(named: '/')),
            any(that: isRoute<String?>(named: "/settings")),
          ),
        );
      }

      Future<void> _tapListTileToNavToDetailScreenFromHomeScreen(
        WidgetTester tester,
      ) async {
        final app = MyAppPageObject();

        await tester.tap(app.homeScreen.listTile);
        await tester.pump();
        await tester.pump(const Duration(seconds: 1));

        verify(
          () => mockNavigationObserver.didPush(
            any(that: isRoute<String?>(named: '/')),
            any(that: isRoute<String?>(named: "/sample_item")),
          ),
        );
      }

      Future<void> _tapNavToHomeScreenFromDetailsScreen(
        WidgetTester tester,
      ) async {
        final app = MyAppPageObject();
        await tester.tap(app.sampleDetailsScreen.navButtonHome);
        await tester.pump();
        await tester.pump(const Duration(seconds: 1));

        verify(
          () => mockNavigationObserver.didPush(
            any(that: isRoute<String?>(named: '/sample_item')),
            any(that: isRoute<String?>(named: "/")),
          ),
        );
      }

      Future<void> _buildSettingsScreen(
        WidgetTester tester,
      ) async {
        await tester.pumpWidgetBuilder(
          SettingsView(controller: settingsController),
          wrapper: goldenBaseWidgetWrapper(
            theme: materialLightMaterialThemeData,
            darkTheme: materialDarkMaterialThemeData,
            // ignore: cast_nullable_to_non_nullable
            myThemeMode: settingsController.themeMode as ThemeMode,
            navigatorObserver: mockNavigationObserver,
            myCupertinoThemeData: cupertinoThemeData,
          ),
        );
        final app = MyAppPageObject();

        expect(
          app.settingsScreen.appBar,
          findsOneWidget,
        );
      }

      Future<void> _buildDetailScreen(WidgetTester tester) async {
        await tester.pumpWidgetBuilder(
          const SampleItemDetailsView(),
          wrapper: goldenBaseWidgetWrapper(
            theme: materialLightMaterialThemeData,
            darkTheme: materialDarkMaterialThemeData,
            // ignore: cast_nullable_to_non_nullable
            myThemeMode: settingsController.themeMode as ThemeMode,
            navigatorObserver: mockNavigationObserver,
            myCupertinoThemeData: cupertinoThemeData,
          ),
        );
        final app = MyAppPageObject();

        expect(
          app.sampleDetailsScreen.appBar,
          findsOneWidget,
        );
      }

      // Test Case:  1. Pump Home Screen
      //             2. Find nav button
      //             3. Simulate nav buttion push
      //             4. verify nav push via mocked nav observer(we do not have to stub as
      //                we are using the observer)
      testGoldens(
        'Home Screen Nav To Settings Screen',
        (WidgetTester tester) async {
          await tester.runAsync<dynamic>(() async {
            await _buildStartSampleItemListViewScreen(tester);
            await _tapNavButtonToNavToSettingsScreen(tester);
            await _buildSettingsScreen(tester);

            await multiScreenGolden(
              tester,
              'home_screen_nav_to_settings_screen',
            );

            //
          });
        },
      );

      testGoldens(
        "Settings Screen Nav To Home Screen",
        (WidgetTester tester) async {
          await tester.runAsync<dynamic>(() async {
            await _buildSettingsScreen(tester);
            await _tapNavButtonToNavToHomeScreenFromSettingsScreen(tester);
            await _buildStartSampleItemListViewScreen(tester);

            await multiScreenGolden(
              tester,
              'settings_screen_nav_to_home_screen',
            );
          });
        },
      );

      testGoldens(
        'Home Screen Nav To Detaill Item Screen',
        (WidgetTester tester) async {
          await tester.runAsync<dynamic>(() async {
            await _buildStartSampleItemListViewScreen(tester);
            await _tapListTileToNavToDetailScreenFromHomeScreen(tester);
            await _buildDetailScreen(tester);

            await multiScreenGolden(
              tester,
              'homescreen_nav_to_detail_screen',
            );
          });
        },
      );

      testGoldens(
        "Detail Screen Nav To HomeScreen",
        (WidgetTester tester) async {
          await tester.runAsync<dynamic>(() async {
            await _buildDetailScreen(tester);
            await _tapNavToHomeScreenFromDetailsScreen(tester);
            await _buildStartSampleItemListViewScreen(tester);

            await multiScreenGolden(
              tester,
              'detailscreen_nav_to_homescreen',
            );
          });
        },
      );
    },
  );
}
