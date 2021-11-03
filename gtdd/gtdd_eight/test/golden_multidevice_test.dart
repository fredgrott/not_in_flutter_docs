// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:gtdd_eight/src/infrastructure/app_vars.dart';
import 'package:gtdd_eight/src/presentation/features/home/ui/sample_item_list_view.dart';
import 'package:gtdd_eight/src/presentation/features/settings/ui/settings_view.dart';
import 'package:gtdd_eight/src/presentation/themes/my_app_themedata.dart';

import 'golden_base_root_widget_wrapper.dart';
import 'golden_device_definitions.dart';

void main() {
  setUpAll(() async {
    // This Flutter Engine is running binding turns off
    // http and  https access which is why we use mocks
    // in goldens testing driven design.
    //
    // Putting it in a setUpAll method means its used for all testing in
    // this testing suite.
    TestWidgetsFlutterBinding.ensureInitialized();

    // setting up our mocked dep

    await settingsController.loadSettings();
  });

  // to tear down mocked dependencies
  // ignore: no-empty-block
  tearDownAll(() async {});

  group(
    'Multiple Devies',
    () {
      testGoldens(
        'DeviceBuilder-Home-base',
        (WidgetTester tester) async {
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

          await tester.runAsync<dynamic>(() async {
            await tester.pumpDeviceBuilder(
              builder,
              wrapper: goldenBaseRootWidgetWrapper(
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
            "sample item list multiple screens",
          );
        },
      );

      testGoldens(
          'DeviceBuilder-Settings View ', (WidgetTester tester) async {
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
              wrapper: goldenBaseRootWidgetWrapper(
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
    },
  );
}
