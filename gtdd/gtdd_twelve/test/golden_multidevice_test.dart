// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:gtdd_twelve/src/infrastructure/app_vars.dart';
import 'package:gtdd_twelve/src/presentation/features/home/ui/sampleitem_detailsview.dart';
import 'package:gtdd_twelve/src/presentation/features/home/ui/sampleitem_listview.dart';
import 'package:gtdd_twelve/src/presentation/features/settings/ui/settingsview.dart';
import 'package:gtdd_twelve/src/presentation/themes/cupertino_themedata.dart';
import 'package:gtdd_twelve/src/presentation/themes/material_themedata.dart';




import 'golden_base_widgetwrapper.dart';
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
              wrapper: goldenBaseWidgetWrapper(
                // ignore: avoid_redundant_argument_values
                platform: TargetPlatform.android,
                theme: materialLightMaterialThemeData,
                darkTheme: materialDarkMaterialThemeData,
                // ignore: cast_nullable_to_non_nullable
                myThemeMode: ThemeMode.light,
                myCupertinoThemeData: cupertinoThemeData,
                
              ),
            );
            await tester.pumpAndSettle();
          });

          await screenMatchesGolden(
            tester,
            "sample_item_list_multiple_screens_material_light",
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
              wrapper: goldenBaseWidgetWrapper(
                // ignore: avoid_redundant_argument_values
                platform: TargetPlatform.android,
                theme: materialLightMaterialThemeData,
                darkTheme: materialDarkMaterialThemeData,
                // ignore: cast_nullable_to_non_nullable
                myThemeMode: ThemeMode.dark,
                myCupertinoThemeData: cupertinoThemeData,
                
              ),
            );
            await tester.pumpAndSettle();
          });

          await screenMatchesGolden(
            tester,
            "sample_item_list_multiple_screens_material_dark",
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
              wrapper: goldenBaseWidgetWrapper(
                // ignore: avoid_redundant_argument_values
                platform: TargetPlatform.iOS,
                theme: materialLightMaterialThemeData,
                darkTheme: materialDarkMaterialThemeData,
                // ignore: cast_nullable_to_non_nullable
                myThemeMode: ThemeMode.light,
                myCupertinoThemeData: cupertinoThemeData,
              ),
            );
            await tester.pumpAndSettle();
          });

          await screenMatchesGolden(
            tester,
            "sample_item_list_multiple_screens_cupertino_light",
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
              wrapper: goldenBaseWidgetWrapper(
                // ignore: avoid_redundant_argument_values
                platform: TargetPlatform.iOS,
                theme: materialLightMaterialThemeData,
                darkTheme: materialDarkMaterialThemeData,
                // ignore: cast_nullable_to_non_nullable
                myThemeMode: ThemeMode.dark,
                myCupertinoThemeData: cupertinoThemeData,
              ),
            );
            await tester.pumpAndSettle();
          });

          await screenMatchesGolden(
            tester,
            "sample_item_list_multiple_screens_cupertino_dark",
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
              wrapper: goldenBaseWidgetWrapper(
                // ignore: avoid_redundant_argument_values
                platform: TargetPlatform.android,
                theme: materialLightMaterialThemeData,
                darkTheme: materialDarkMaterialThemeData,
                // ignore: cast_nullable_to_non_nullable
                myThemeMode: ThemeMode.light,
                myCupertinoThemeData: cupertinoThemeData,
              ),
            );
            await tester.pumpAndSettle();
          });

          await screenMatchesGolden(
            tester,
            "sample_item_view_multiple_screens_material_light",
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
              wrapper: goldenBaseWidgetWrapper(
                // ignore: avoid_redundant_argument_values
                platform: TargetPlatform.iOS,
                theme: materialLightMaterialThemeData,
                darkTheme: materialDarkMaterialThemeData,
                // ignore: cast_nullable_to_non_nullable
                myThemeMode: ThemeMode.light,
                myCupertinoThemeData: cupertinoThemeData,
              ),
            );
            await tester.pumpAndSettle();
          });

          await screenMatchesGolden(
            tester,
            "detail_view_multiple_screens_cupertino_light",
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
              wrapper: goldenBaseWidgetWrapper(
                // ignore: avoid_redundant_argument_values
                platform: TargetPlatform.android,
                theme: materialLightMaterialThemeData,
                darkTheme: materialDarkMaterialThemeData,
                // ignore: cast_nullable_to_non_nullable
                myThemeMode: ThemeMode.dark,
                myCupertinoThemeData: cupertinoThemeData,
              ),
            );
            await tester.pumpAndSettle();
          });

          await screenMatchesGolden(
            tester,
            "detail_view_multiple_screens_material_dark",
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
              wrapper: goldenBaseWidgetWrapper(
                // ignore: avoid_redundant_argument_values
                platform: TargetPlatform.iOS,
                theme: materialLightMaterialThemeData,
                darkTheme: materialDarkMaterialThemeData,
                // ignore: cast_nullable_to_non_nullable
                myThemeMode: ThemeMode.dark,
                myCupertinoThemeData: cupertinoThemeData,
              ),
            );
            await tester.pumpAndSettle();
          });

          await screenMatchesGolden(
            tester,
            "detail_view_multiple_screens_cupertino_dark",
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
              wrapper: goldenBaseWidgetWrapper(
                // ignore: avoid_redundant_argument_values
                platform: TargetPlatform.android,
                theme: materialLightMaterialThemeData,
                darkTheme: materialDarkMaterialThemeData,
                // ignore: cast_nullable_to_non_nullable
                myThemeMode: ThemeMode.light,
                myCupertinoThemeData: cupertinoThemeData,

              ),
            );
            await tester.pumpAndSettle();
            });
            await screenMatchesGolden(
            tester,
            "settings_view_page_multiple_screens_material_light",
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
              wrapper: goldenBaseWidgetWrapper(
                // ignore: avoid_redundant_argument_values
                platform: TargetPlatform.iOS,
                theme: materialLightMaterialThemeData,
                darkTheme: materialDarkMaterialThemeData,
                // ignore: cast_nullable_to_non_nullable
                myThemeMode: ThemeMode.light,
                myCupertinoThemeData: cupertinoThemeData,
              ),
            );
            await tester.pumpAndSettle();
          });
          await screenMatchesGolden(
            tester,
            "settings_view_page_multiple_screens_cupertino_light",
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
              wrapper: goldenBaseWidgetWrapper(
                // ignore: avoid_redundant_argument_values
                platform: TargetPlatform.android,
                theme: materialLightMaterialThemeData,
                darkTheme: materialDarkMaterialThemeData,
                // ignore: cast_nullable_to_non_nullable
                myThemeMode: ThemeMode.dark,
                myCupertinoThemeData: cupertinoThemeData,
              ),
            );
            await tester.pumpAndSettle();
          });
          await screenMatchesGolden(
            tester,
            "settings_view_page_multiple_screens_material_dark",
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
              wrapper: goldenBaseWidgetWrapper(
                // ignore: avoid_redundant_argument_values
                platform: TargetPlatform.iOS,
                theme: materialLightMaterialThemeData,
                darkTheme: materialDarkMaterialThemeData,
                // ignore: cast_nullable_to_non_nullable
                myThemeMode: ThemeMode.dark,
                myCupertinoThemeData: cupertinoThemeData,
              ),
            );
            await tester.pumpAndSettle();
          });
          await screenMatchesGolden(
            tester,
            "settings_view_page_multiple_screens_cupertino_dark",
          );
        },
      );






    },
  );
}
