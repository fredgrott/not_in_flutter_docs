// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:gtdd_ten/src/infrastructure/app_vars.dart';
import 'package:gtdd_ten/src/presentation/features/home/ui/sampleitem_detailsview.dart';
import 'package:gtdd_ten/src/presentation/features/home/ui/sampleitem_listview.dart';
import 'package:gtdd_ten/src/presentation/features/settings/ui/settingsview.dart';

import 'package:gtdd_ten/src/presentation/themes/my_app_themedata.dart';

import 'golden_base_fpw_root_widget_wrapper.dart';

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
        'DeviceBuilder-Home-base-Material-Light',
        (WidgetTester tester) async {
          final builder = DeviceBuilder()
            ..overrideDevicesForAllScenarios(
              devices: [
                Device.phone,
                Device.tabletPortrait,
                Device.tabletLandscape,
                samsungEightAndroid,
                samsungNineAndroid,
                laptopMine,
                desktopMine,
              ],
            )
            ..addScenario(
              widget: const SampleItemListView(),
              name: 'Sample Item List View Home Base Material Light',
            );

          await tester.runAsync<dynamic>(() async {
            await tester.pumpDeviceBuilder(
              builder,
              wrapper: goldenBaseFPWRootWidgetWrapper(
                // ignore: avoid_redundant_argument_values
                platform: TargetPlatform.android,
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
            "sample item list multiple screens material light",
          );
        },
      );

      testGoldens(
        'DeviceBuilder-Home-base-Material-Dark',
        (WidgetTester tester) async {
          final builder = DeviceBuilder()
            ..overrideDevicesForAllScenarios(
              devices: [
                Device.phone,
                Device.tabletPortrait,
                Device.tabletLandscape,
                samsungEightAndroid,
                samsungNineAndroid,
                laptopMine,
                desktopMine,
              ],
            )
            ..addScenario(
              widget: const SampleItemListView(),
              name: 'Sample Item List View Home Base Material Dark',
            );

          await tester.runAsync<dynamic>(() async {
            await tester.pumpDeviceBuilder(
              builder,
              wrapper: goldenBaseFPWRootWidgetWrapper(
                // ignore: avoid_redundant_argument_values
                platform: TargetPlatform.android,
                ourLightTheme: myLightThemeData,
                ourDarkTheme: myDarkThemeData,
                // ignore: cast_nullable_to_non_nullable
                ourThemeMode: ThemeMode.dark,
              ),
            );
            await tester.pumpAndSettle();
          });

          await screenMatchesGolden(
            tester,
            "sample item list multiple screens material dark",
          );
        },
      );

      testGoldens(
        'DeviceBuilder-Home-base-Cupertino-Light',
        (WidgetTester tester) async {
          final builder = DeviceBuilder()
            ..overrideDevicesForAllScenarios(
              devices: [
                Device.phone,
                Device.tabletPortrait,
                Device.tabletLandscape,
                iphonetenxIOS,
                iphonetwelvepromaxIOS,
                laptopMine,
                desktopMine,
              ],
            )
            ..addScenario(
              widget: const SampleItemListView(),
              name: 'Sample Item List View Home Base Cupertino Light',
            );

          await tester.runAsync<dynamic>(() async {
            await tester.pumpDeviceBuilder(
              builder,
              wrapper: goldenBaseFPWRootWidgetWrapper(
                // ignore: avoid_redundant_argument_values
                platform: TargetPlatform.iOS,
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
            "sample item list multiple screens cupertino light",
          );
        },
      );

      testGoldens(
        'DeviceBuilder-Home-base-Cupertino-Dark',
        (WidgetTester tester) async {
          final builder = DeviceBuilder()
            ..overrideDevicesForAllScenarios(
              devices: [
                Device.phone,
                Device.tabletPortrait,
                Device.tabletLandscape,
                iphonetenxIOS,
                iphonetwelvepromaxIOS,
                laptopMine,
                desktopMine,
              ],
            )
            ..addScenario(
              widget: const SampleItemListView(),
              name: 'Sample Item List View Home Base Cupertino Dark',
            );

          await tester.runAsync<dynamic>(() async {
            await tester.pumpDeviceBuilder(
              builder,
              wrapper: goldenBaseFPWRootWidgetWrapper(
                // ignore: avoid_redundant_argument_values
                platform: TargetPlatform.iOS,
                ourLightTheme: myLightThemeData,
                ourDarkTheme: myDarkThemeData,
                // ignore: cast_nullable_to_non_nullable
                ourThemeMode: ThemeMode.dark,
              ),
            );
            await tester.pumpAndSettle();
          });

          await screenMatchesGolden(
            tester,
            "sample item list multiple screens cupertino dark",
          );
        },
      );

      testGoldens(
        'DeviceBuilder-Detail-Screen-base-Material-Light',
        (WidgetTester tester) async {
          final builder = DeviceBuilder()
            ..overrideDevicesForAllScenarios(
              devices: [
                Device.phone,
                
                Device.tabletPortrait,
                Device.tabletLandscape,
                samsungEightAndroid,
                samsungNineAndroid,
                desktopMine,
                laptopMine,              
                ],
            )
            ..addScenario(
              widget: const SampleItemDetailsView(),
              name: 'Sample Detail Item View  Base Material light',
            );

          await tester.runAsync<dynamic>(() async {
            await tester.pumpDeviceBuilder(
              builder,
              wrapper: goldenBaseFPWRootWidgetWrapper(
                // ignore: avoid_redundant_argument_values
                platform: TargetPlatform.android,
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
            "sample item view multiple screens-Material-Light",
          );
        },
      );

      testGoldens(
        'DeviceBuilder-Detail-Screen-base-Cupertino-Light',
        (WidgetTester tester) async {
          final builder = DeviceBuilder()
            ..overrideDevicesForAllScenarios(
              devices: [
                Device.phone,
                Device.tabletPortrait,
                Device.tabletLandscape,
                iphonetenxIOS,
                iphonetwelvepromaxIOS,
                desktopMine,
                laptopMine,
              ],
            )
            ..addScenario(
              widget: const SampleItemDetailsView(),
              name: 'Detail Item View  Base Cupertino light',
            );

          await tester.runAsync<dynamic>(() async {
            await tester.pumpDeviceBuilder(
              builder,
              wrapper: goldenBaseFPWRootWidgetWrapper(
                // ignore: avoid_redundant_argument_values
                platform: TargetPlatform.iOS,
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
            "detail view multiple screens-Cupertino-Light",
          );
        },
      );

      testGoldens(
        'DeviceBuilder-Detail-Screen-base-Material-Dark',
        (WidgetTester tester) async {
          final builder = DeviceBuilder()
            ..overrideDevicesForAllScenarios(
              devices: [
                Device.phone,
                Device.tabletPortrait,
                Device.tabletLandscape,
                samsungEightAndroid,
                samsungNineAndroid,
                desktopMine,
                laptopMine,
              ],
            )
            ..addScenario(
              widget: const SampleItemDetailsView(),
              name: 'Detail Item View  Base Material Dark',
            );

          await tester.runAsync<dynamic>(() async {
            await tester.pumpDeviceBuilder(
              builder,
              wrapper: goldenBaseFPWRootWidgetWrapper(
                // ignore: avoid_redundant_argument_values
                platform: TargetPlatform.android,
                ourLightTheme: myLightThemeData,
                ourDarkTheme: myDarkThemeData,
                // ignore: cast_nullable_to_non_nullable
                ourThemeMode: ThemeMode.dark,
              ),
            );
            await tester.pumpAndSettle();
          });

          await screenMatchesGolden(
            tester,
            "detail view multiple screens-Material-Dark",
          );
        },
      );

      testGoldens(
        'DeviceBuilder-Detail-Screen-base-Cupertino Dark',
        (WidgetTester tester) async {
          final builder = DeviceBuilder()
            ..overrideDevicesForAllScenarios(
              devices: [
                Device.phone,
                Device.tabletPortrait,
                Device.tabletLandscape,
                iphonetenxIOS,
                iphonetwelvepromaxIOS,
                desktopMine,
                laptopMine,
              ],
            )
            ..addScenario(
              widget: const SampleItemDetailsView(),
              name: 'Detail Item View  Base Cupertino Dark',
            );

          await tester.runAsync<dynamic>(() async {
            await tester.pumpDeviceBuilder(
              builder,
              wrapper: goldenBaseFPWRootWidgetWrapper(
                // ignore: avoid_redundant_argument_values
                platform: TargetPlatform.iOS,
                ourLightTheme: myLightThemeData,
                ourDarkTheme: myDarkThemeData,
                // ignore: cast_nullable_to_non_nullable
                ourThemeMode: ThemeMode.dark,
              ),
            );
            await tester.pumpAndSettle();
          });

          await screenMatchesGolden(
            tester,
            "sdetail view multiple screens-Cupertino-Dark",
          );
        },
      );
























      

      

      testGoldens(
          'DeviceBuilder-Settings View Material Light ', 
          (WidgetTester tester) async {
            final builder = DeviceBuilder()
            ..overrideDevicesForAllScenarios(
              devices: [
                Device.phone,
                Device.tabletPortrait,
                Device.tabletLandscape,
                samsungEightAndroid,
                samsungNineAndroid,
                laptopMine,
                desktopMine,
              ],
            )
            ..addScenario(
              widget: SettingsView(
                controller: settingsController,
              ),
              name: 'Settings View Material Light',
            );
            await tester.runAsync<dynamic>(() async {
              await tester.pumpDeviceBuilder(
              builder,
              wrapper: goldenBaseFPWRootWidgetWrapper(
                // ignore: avoid_redundant_argument_values
                platform: TargetPlatform.android,
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
            "settings view page multiple screens material light",
          );
          },);

        testGoldens(
        'DeviceBuilder-Settings View Cupertino Light ',
        (WidgetTester tester) async {
          final builder = DeviceBuilder()
            ..overrideDevicesForAllScenarios(
              devices: [
                Device.phone,
                Device.tabletPortrait,
                Device.tabletLandscape,
                iphonetenxIOS,
                iphonetwelvepromaxIOS,
                laptopMine,
                desktopMine,
              ],
            )
            ..addScenario(
              widget: SettingsView(
                controller: settingsController,
              ),
              name: 'Settings View Cupertino Light',
            );
          await tester.runAsync<dynamic>(() async {
            await tester.pumpDeviceBuilder(
              builder,
              wrapper: goldenBaseFPWRootWidgetWrapper(
                // ignore: avoid_redundant_argument_values
                platform: TargetPlatform.iOS,
                ourLightTheme: myLightThemeData,
                ourDarkTheme: myDarkThemeData,
                // ignore: cast_nullable_to_non_nullable
                ourThemeMode: ThemeMode.dark,
              ),
            );
            await tester.pumpAndSettle();
          });
          await screenMatchesGolden(
            tester,
            "settings view page multiple screens cupertino light",
          );
        },
      );

      testGoldens(
        'DeviceBuilder-Settings View Material Dark ',
        (WidgetTester tester) async {
          final builder = DeviceBuilder()
            ..overrideDevicesForAllScenarios(
              devices: [
                Device.phone,
                Device.tabletPortrait,
                Device.tabletLandscape,
                samsungEightAndroid,
                samsungNineAndroid,
                laptopMine,
                desktopMine,
              ],
            )
            ..addScenario(
              widget: SettingsView(
                controller: settingsController,
              ),
              name: 'Settings View Material Dark',
            );
          await tester.runAsync<dynamic>(() async {
            await tester.pumpDeviceBuilder(
              builder,
              wrapper: goldenBaseFPWRootWidgetWrapper(
                // ignore: avoid_redundant_argument_values
                platform: TargetPlatform.android,
                ourLightTheme: myLightThemeData,
                ourDarkTheme: myDarkThemeData,
                // ignore: cast_nullable_to_non_nullable
                ourThemeMode: ThemeMode.dark,
              ),
            );
            await tester.pumpAndSettle();
          });
          await screenMatchesGolden(
            tester,
            "settings view page multiple screens material dark",
          );
        },
      );

      testGoldens(
        'DeviceBuilder-Settings View Cupertino Dark ',
        (WidgetTester tester) async {
          final builder = DeviceBuilder()
            ..overrideDevicesForAllScenarios(
              devices: [
                Device.phone,
                Device.tabletPortrait,
                Device.tabletLandscape,
                iphonetenxIOS,
                iphonetwelvepromaxIOS,
                laptopMine,
                desktopMine,
              ],
            )
            ..addScenario(
              widget: SettingsView(
                controller: settingsController,
              ),
              name: 'Settings View Cupertino Dark',
            );
          await tester.runAsync<dynamic>(() async {
            await tester.pumpDeviceBuilder(
              builder,
              wrapper: goldenBaseFPWRootWidgetWrapper(
                // ignore: avoid_redundant_argument_values
                platform: TargetPlatform.iOS,
                ourLightTheme: myLightThemeData,
                ourDarkTheme: myDarkThemeData,
                // ignore: cast_nullable_to_non_nullable
                ourThemeMode: ThemeMode.dark,
              ),
            );
            await tester.pumpAndSettle();
          });
          await screenMatchesGolden(
            tester,
            "settings view page multiple screens cupertino dark",
          );
        },
      );






    },
  );
}
