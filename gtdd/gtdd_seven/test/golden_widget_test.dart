// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// ignore_for_file: empty_constructor_bodies, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:gtdd_seven/src/domain/app_vars.dart';
import 'package:gtdd_seven/src/my_app.dart';
import 'package:gtdd_seven/src/presentation/features/home/ui/sample_item_list_view.dart';
import 'package:gtdd_seven/src/presentation/features/settings/ui/settings_view.dart';
import 'package:gtdd_seven/src/presentation/themes/my_app_themedata.dart';
import 'package:mocktail/mocktail.dart' as mocktail;

import 'golden_appbar_test_support.dart';
import 'golden_detailscreen_text_test_support.dart';
import 'golden_device_definitions.dart';
import 'golden_dropbutton_test_support.dart';
import 'golden_listtile_test_support.dart';
import 'golden_mocks.dart';
import 'golden_wrapper.dart';

// Golden Test Driven Development Notes:
//
// 1. State and Dependency Management Solution deps are usually set up as
//    a harness or fixture as part of TestWidget class. See B.E.'s example:
//    https://gist.github.com/brianegan/414f6b369c534a0e5f20bff377823414
//
// 2. Due to Web-Deep-linking and how we implement routes we need to
//    set up a one screen(widget) test with  default device to act as
//    our base goldens for each screen.
//
// 3. Since we do have the option of running goldens per device form and
//    per OS platform to get OS-specific aesthetics, we should consider
//    at some point implementing such additional tests.
//
//  4. BDD functionality is via eBay's Page Object and Given When Then
//     test utilities so that we can hide the test harness and test
//     fixture implementation from the one creating the test suites.
//
//  5. Always split device definitions and RootWidgetWrappers to
//     separate golden  tool files as the golden test suite files
//     should be their own entities.

void main() {
  // our var for our mocked dep

  

  setUpAll(() async {
    // This Flutter Engine is running binding turns off
    // http and  https access which is why we use mocks
    // in goldens testing driven design.
    //
    // Putting it in a setUpAll method means its used for all testing in
    // this testing suite.
    TestWidgetsFlutterBinding.ensureInitialized();

    // setting up our mocked dep

    mySettingsController = MockMySettingsController();

    await settingsController.loadSettings();
  });

  // to tear down mocked dependencies
  // ignore: no-empty-block
  tearDownAll(() async {});

  // group all tests in this unit of the test suite together
  group('Basic Golden Tests ', () {
    // Flutter golden pumpWidget only pumps a widget,since we do not have
    // a widget defined in home slot of MyApp if we try to pump MyApp we
    // will get a blank screen. So we have to specify the
    // widget of the default home navigation route.
    // But doing will produce a red screen of death as we did not
    // insert a Root WidgetApp Widget that has MediaQuery.

    testWidgets('Golden test', (WidgetTester tester) async {
      await tester.runAsync<dynamic>(() async {
        await tester.pumpWidget(
          MyApp(
            settingsController: settingsController,
          ),
        );
        await tester.pumpAndSettle();
      });
      await expectLater(find.byType(MyApp), matchesGoldenFile('main.png'),);
    },);

    testGoldens('DeviceBuilder-Home-base', (WidgetTester tester) async {
      final builder = DeviceBuilder()
        ..overrideDevicesForAllScenarios(
          devices: [
            Device.phone,
            Device.iphone11,
            Device.tabletPortrait,
            Device.tabletLandscape,
            samsungEightAndroid,
            samsungNineAndroid,
            iphonetwelvepromaxIOS,
          ],
        )
        ..addScenario(
          widget: const SampleItemListView(),
          name: 'Sample Item List View Home Base',
        );
      //since I have builders in stateless widgets I need to run it this way
      await tester.runAsync<dynamic>(() async {
        await tester.pumpDeviceBuilder(
          builder,
          wrapper: myModifiedRootWidgetWrapper(
            ourLightTheme: myLightThemeData,
            ourDarkTheme: myDarkThemeData,
            // ignore: cast_nullable_to_non_nullable
            ourThemeMode: settingsController.themeMode as ThemeMode,
          ),
        );
        await tester.pumpAndSettle();
      });
      await screenMatchesGolden(tester, "sample item list multiple screens",);
    },);

    testGoldens('DeviceBuilder-Settings View ', (WidgetTester tester) async {
      // In a real app one would supply the other parameters to the
      // app wrapper of the RootWidget as when it's blank
      // everything resolves to a default.
      final builder = DeviceBuilder()
        ..overrideDevicesForAllScenarios(
          devices: [
            Device.phone,
            Device.iphone11,
            Device.tabletPortrait,
            Device.tabletLandscape,
            samsungEightAndroid,
            samsungNineAndroid,
            iphonetwelvepromaxIOS,
          ],
        )
        ..addScenario(
          widget: SettingsView(
            controller: settingsController,
          ),
          name: 'Settings View',
        );
      await tester.runAsync<dynamic>(() async {
        await tester.pumpDeviceBuilder(
          builder,
          wrapper: myModifiedRootWidgetWrapper(
            ourLightTheme: myLightThemeData,
            ourDarkTheme: myDarkThemeData,
            // ignore: cast_nullable_to_non_nullable
            ourThemeMode: settingsController.themeMode as ThemeMode,
          ),
        );
        await tester.pumpAndSettle();
      });
      await screenMatchesGolden(
        tester,
        "settings view page multiple screens",
      );
    },);
  },);

  // routing through using golden toolkit infrastructure as we
  // need to insert a root widget test fixture at top of
  // widget tree for page object to work.
  group('Widget Unit Tests using page object', () {
    // just checking to see if UI components are there,
    // notice that it reads as a straight English style use case.
    testWidgets(
      'AppBar Title is there',
      appbarHarness((given, when, then,) async {
        await given.myAppExistsSampleScreen();
        await then.appBarTitleIsSampleScreen();

        await given.myAppExistsDetailsScreen();
        await then.appBarTitleIsDetailScreen();

        await given.myAppExistsSettingsScreen();
        await then.appBarTitleIsSettingsScreen();
      }),
    );

    testWidgets(
      'List Tile is in home and has a title',
      listTileHarness((given, when, then,) async {
        await given.myAppExists();
        await when.listViewFound();
        await then.threeListTilesFound();
        await then.listTileOneFound();
        await then.listTileTwoFound();
        await then.listTileThreeFound();
      }),
    );

    testWidgets(
      'Detail Screen has appbar title and description',
      detailTextHarness((given, when, then,) async {
        await given.myAppExists();
        await then.appBarTitleIs();
        await then.textIsSampleItemDetailScreen();
      }),
    );

    testWidgets(
      'Settings Screen, user can choose system theme',
      dropButtonHarness((given, when, then,) async {
        await given.myAppExists();

        await given.dropDownExists();


        mocktail.when(() => mySettingsController?.updateThemeMode(ThemeMode.system)).thenReturn(ThemeMode.system);
        mocktail.when<dynamic>(() => mySettingsController?.themeMode).thenReturn(ThemeMode.system);

        await then.userChoosesSystemThemeAndItChanges();
      },),
    );

    testWidgets(
      'Settings Screen, user can choose dark theme',
      dropButtonHarness((given, when, then,) async {
        await given.myAppExists();

        await given.dropDownExists();


        mocktail.when(
            () => mySettingsController?.updateThemeMode(ThemeMode.dark),).thenReturn(ThemeMode.dark);
        mocktail.when<dynamic>(() => mySettingsController?.themeMode).thenReturn(ThemeMode.dark);

        await then.userChoosesDarkThemeAndItChanges();
      }),
    );

    testWidgets(
      'Settings Screen, user can choose light theme',
      dropButtonHarness((given, when, then,) async {
        await given.myAppExists();

        await given.dropDownExists();


        mocktail.when(
            // ignore: void_checks
            () => mySettingsController?.updateThemeMode(ThemeMode.light),).thenReturn(ThemeMode.light);
        mocktail.when<dynamic>(() => mySettingsController?.themeMode).thenReturn(ThemeMode.light);

        await then.userChoosesLightThemeAndItChanges();
      }),
    );
  },);

  // It's not in the docs but to unit test widgets on the non-instrumented
  // test side due to us only pumping a widget to get a frame we need to
  // supply a root widget implementation as the app is not fully running.
  // This is why say you better freaking running all widget tests through
  // Goldens or ie Goldens Driven Development.
}
