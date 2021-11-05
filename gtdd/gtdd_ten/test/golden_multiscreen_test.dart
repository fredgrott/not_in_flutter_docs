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
    'Golden Tests MultiScreen',
    () {

      testGoldens(
        'Home Screen - Responsive Material Light',
        (WidgetTester tester) async {
          await tester.runAsync<dynamic>(() async {
            await tester.pumpWidgetBuilder(
              const SampleItemListView(),
              wrapper: goldenBaseFPWRootWidgetWrapper(
                platform: TargetPlatform.windows,
                ourLightTheme: myLightThemeData,
                ourDarkTheme: myDarkThemeData,
                // ignore: cast_nullable_to_non_nullable
                ourThemeMode: settingsController.themeMode as ThemeMode,
              ),
            );
          });
          await multiScreenGolden(
            
            tester,
            'home_screen_responsive_material_light',
             
          );
        },
      );

      testGoldens(
        'Home Screen - Responsive Cupertino Light',
        (WidgetTester tester) async {
          await tester.runAsync<dynamic>(() async {
            await tester.pumpWidgetBuilder(
              const SampleItemListView(),
              wrapper: goldenBaseFPWRootWidgetWrapper(
                platform: TargetPlatform.macOS,
                ourLightTheme: myLightThemeData,
                ourDarkTheme: myDarkThemeData,
                // ignore: cast_nullable_to_non_nullable
                ourThemeMode: settingsController.themeMode as ThemeMode,
              ),
            );
          });
          await multiScreenGolden(
            tester,
            'home_screen_responsive_cupertino_light',
          );
        },
      );

      testGoldens(
        'Home Screen - Responsive Material Dark',
        (WidgetTester tester) async {
          await tester.runAsync<dynamic>(() async {
            await tester.pumpWidgetBuilder(
              const SampleItemListView(),
              wrapper: goldenBaseFPWRootWidgetWrapper(
                platform: TargetPlatform.windows,
                ourLightTheme: myLightThemeData,
                ourDarkTheme: myDarkThemeData,
                // ignore: cast_nullable_to_non_nullable
                ourThemeMode:ThemeMode.dark,
              ),
            );
          });
          await multiScreenGolden(
            tester,
            'home_screen_responsive_material_dark',
          );
        },
      );

      testGoldens(
        'Home Screen - Responsive Cupertino Dark',
        (WidgetTester tester) async {
          await tester.runAsync<dynamic>(() async {
            await tester.pumpWidgetBuilder(
              const SampleItemListView(),
              wrapper: goldenBaseFPWRootWidgetWrapper(
                platform: TargetPlatform.macOS,
                ourLightTheme: myLightThemeData,
                ourDarkTheme: myDarkThemeData,
                // ignore: cast_nullable_to_non_nullable
                ourThemeMode: ThemeMode.dark,
              ),
            );
          });
          await multiScreenGolden(
            tester,
            'home_screen_responsive_cupertino_dark',
          );
        },
      );





      

      testGoldens(
        'Detail Screen- Responsive Material Light',
        (WidgetTester tester) async {
          await tester.runAsync<dynamic>(() async {
            await tester.pumpWidgetBuilder(
              const SampleItemDetailsView(),
              wrapper: goldenBaseFPWRootWidgetWrapper(
                platform: TargetPlatform.windows,
                ourLightTheme: myLightThemeData,
                ourDarkTheme: myDarkThemeData,
                // ignore: cast_nullable_to_non_nullable
                ourThemeMode: settingsController.themeMode as ThemeMode,
              ),
            );
          });
          await multiScreenGolden(
            tester,
            'detail_screen_responsive_material_light',
          );
        },
      );

      testGoldens(
        'Detail Screen- Responsive Cupertino Light',
        (WidgetTester tester) async {
          await tester.runAsync<dynamic>(() async {
            await tester.pumpWidgetBuilder(
              const SampleItemDetailsView(),
              wrapper: goldenBaseFPWRootWidgetWrapper(
                platform: TargetPlatform.macOS,
                ourLightTheme: myLightThemeData,
                ourDarkTheme: myDarkThemeData,
                // ignore: cast_nullable_to_non_nullable
                ourThemeMode: settingsController.themeMode as ThemeMode,
              ),
            );
          });
          await multiScreenGolden(
            tester,
            'detail_screen_responsive_cupertino_light',
          );
        },
      );

      testGoldens(
        'Detail Screen- Responsive Material Dark',
        (WidgetTester tester) async {
          await tester.runAsync<dynamic>(() async {
            await tester.pumpWidgetBuilder(
              const SampleItemDetailsView(),
              wrapper: goldenBaseFPWRootWidgetWrapper(
                platform: TargetPlatform.windows,
                ourLightTheme: myLightThemeData,
                ourDarkTheme: myDarkThemeData,
                // ignore: cast_nullable_to_non_nullable
                ourThemeMode: ThemeMode.dark,
              ),
            );
          });
          await multiScreenGolden(
            tester,
            'detail_screen_responsive_material_dark',
          );
        },
      );

      testGoldens(
        'Detail Screen- Responsive Cupertino Dark',
        (WidgetTester tester) async {
          await tester.runAsync<dynamic>(() async {
            await tester.pumpWidgetBuilder(
              const SampleItemDetailsView(),
              wrapper: goldenBaseFPWRootWidgetWrapper(
                platform: TargetPlatform.macOS,
                ourLightTheme: myLightThemeData,
                ourDarkTheme: myDarkThemeData,
                // ignore: cast_nullable_to_non_nullable
                ourThemeMode: ThemeMode.dark,
              ),
            );
          });
          await multiScreenGolden(
            tester,
            'detail_screen_responsive_cupertino_dark',
          );
        },
      );

      testGoldens(
          'Settings Screen - Responsive Material Light', 
          (WidgetTester tester) async {
            await tester.runAsync<dynamic>(() async {
            await tester.pumpWidgetBuilder(
              SettingsView(controller: settingsController,),
              wrapper: goldenBaseFPWRootWidgetWrapper(
                platform: TargetPlatform.windows,
                ourLightTheme: myLightThemeData,
                ourDarkTheme: myDarkThemeData,
                // ignore: cast_nullable_to_non_nullable
                ourThemeMode: settingsController.themeMode as ThemeMode,
              ),
            );
          });
          await multiScreenGolden(
            tester,
            'settings_screen_responsive_material_light',
          );

          },);

        testGoldens(
        'Settings Screen - Responsive Cupertino Light',
        (WidgetTester tester) async {
          await tester.runAsync<dynamic>(() async {
            await tester.pumpWidgetBuilder(
              SettingsView(
                controller: settingsController,
              ),
              wrapper: goldenBaseFPWRootWidgetWrapper(
                platform: TargetPlatform.macOS,
                ourLightTheme: myLightThemeData,
                ourDarkTheme: myDarkThemeData,
                // ignore: cast_nullable_to_non_nullable
                ourThemeMode: settingsController.themeMode as ThemeMode,
              ),
            );
          });
          await multiScreenGolden(
            tester,
            'settings_screen_responsive_cupertino_light',
          );
        },
      );

      testGoldens(
        'Settings Screen - Responsive Material Dark',
        (WidgetTester tester) async {
          await tester.runAsync<dynamic>(() async {
            await tester.pumpWidgetBuilder(
              SettingsView(
                controller: settingsController,
              ),
              wrapper: goldenBaseFPWRootWidgetWrapper(
                platform: TargetPlatform.windows,
                ourLightTheme: myLightThemeData,
                ourDarkTheme: myDarkThemeData,
                // ignore: cast_nullable_to_non_nullable
                ourThemeMode: ThemeMode.dark,
              ),
            );
          });
          await multiScreenGolden(
            tester,
            'settings_screen_responsive_material_dark',
          );
        },
      );

      testGoldens(
        'Settings Screen - Responsive Cupertino Dark',
        (WidgetTester tester) async {
          await tester.runAsync<dynamic>(() async {
            await tester.pumpWidgetBuilder(
              SettingsView(
                controller: settingsController,
              ),
              wrapper: goldenBaseFPWRootWidgetWrapper(
                platform: TargetPlatform.macOS,
                ourLightTheme: myLightThemeData,
                ourDarkTheme: myDarkThemeData,
                // ignore: cast_nullable_to_non_nullable
                ourThemeMode:ThemeMode.dark,
              ),
            );
          });
          await multiScreenGolden(
            tester,
            'settings_screen_responsive_cupertino_dark',
          );
        },
      );


    },
  );
}
