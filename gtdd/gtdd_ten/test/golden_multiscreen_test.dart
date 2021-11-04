// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:gtdd_ten/src/infrastructure/app_vars.dart';
import 'package:gtdd_ten/src/presentation/features/home/ui/sample_item_details_view.dart';
import 'package:gtdd_ten/src/presentation/features/home/ui/sample_item_list_view.dart';
import 'package:gtdd_ten/src/presentation/features/settings/ui/settings_view.dart';
import 'package:gtdd_ten/src/presentation/themes/my_app_themedata.dart';

import 'golden_base_root_widget_wrapper.dart';

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
        'Home Screen - Responsive',
        (WidgetTester tester) async {
          await tester.runAsync<dynamic>(() async {
            await tester.pumpWidgetBuilder(
              const SampleItemListView(),
              wrapper: goldenBaseRootWidgetWrapper(
                ourLightTheme: myLightThemeData,
                ourDarkTheme: myDarkThemeData,
                // ignore: cast_nullable_to_non_nullable
                ourThemeMode: settingsController.themeMode as ThemeMode,
              ),
            );
          });
          await multiScreenGolden(
            tester,
            'home_screen_responsive',
          );
        },
      );

      testGoldens(
        'Detail Screen- Responsive',
        (WidgetTester tester) async {
          await tester.runAsync<dynamic>(() async {
            await tester.pumpWidgetBuilder(
              const SampleItemDetailsView(),
              wrapper: goldenBaseRootWidgetWrapper(
                ourLightTheme: myLightThemeData,
                ourDarkTheme: myDarkThemeData,
                // ignore: cast_nullable_to_non_nullable
                ourThemeMode: settingsController.themeMode as ThemeMode,
              ),
            );
          });
          await multiScreenGolden(
            tester,
            'detail_screen_responsive',
          );
        },
      );

      testGoldens(
          'Settings Screen - Responsive', (WidgetTester tester) async {
            await tester.runAsync<dynamic>(() async {
            await tester.pumpWidgetBuilder(
              SettingsView(controller: settingsController,),
              wrapper: goldenBaseRootWidgetWrapper(
                ourLightTheme: myLightThemeData,
                ourDarkTheme: myDarkThemeData,
                // ignore: cast_nullable_to_non_nullable
                ourThemeMode: settingsController.themeMode as ThemeMode,
              ),
            );
          });
          await multiScreenGolden(
            tester,
            'settings_screen_responsive',
          );

          },);
    },
  );
}
