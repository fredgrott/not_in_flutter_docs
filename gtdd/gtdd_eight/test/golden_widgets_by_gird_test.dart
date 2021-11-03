// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:gtdd_eight/src/infrastructure/app_vars.dart';
import 'package:gtdd_eight/src/presentation/features/home/ui/sample_item_details_view.dart';
import 'package:gtdd_eight/src/presentation/features/home/ui/sample_item_list_view.dart';
import 'package:gtdd_eight/src/presentation/features/settings/ui/settings_view.dart';
import 'package:gtdd_eight/src/presentation/themes/my_app_themedata.dart';

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
    'Golden Tests Screens by Grid',
    () {
      testGoldens(
        'Sample List Home Screen - Accessiblity',
        (WidgetTester tester) async {
          const widgetUnderTest = SampleItemListView();
          final builder = GoldenBuilder.column()
            ..addScenario(
              'Default font size',
              widgetUnderTest,
            )
            ..addTextScaleScenario(
              'Large font size',
              widgetUnderTest,
              textScaleFactor: 2.0,
            )
            ..addTextScaleScenario(
              'Largest font',
              widgetUnderTest,
              // ignore: avoid_redundant_argument_values
              textScaleFactor: 3.2,
            );

          await tester.pumpWidgetBuilder(
            builder.build(),
            wrapper: goldenBaseRootWidgetWrapper(
              ourLightTheme: myLightThemeData,
              ourDarkTheme: myDarkThemeData,
              // ignore: cast_nullable_to_non_nullable
              ourThemeMode: settingsController.themeMode as ThemeMode,
            ),
          );

          await screenMatchesGolden(
            tester,
            'home_screen_accessibility',
          );
        },
      );

      testGoldens(
        'Theme Settings - Accessibility',
        (WidgetTester tester) async {
          final widgetUnderTest = SettingsView(controller: settingsController);
          final builder = GoldenBuilder.column()
            ..addScenario(
              'Default font size',
              widgetUnderTest,
            )
            ..addTextScaleScenario(
              'Large font size',
              widgetUnderTest,
              textScaleFactor: 2.0,
            )
            ..addTextScaleScenario(
              'Largest font',
              widgetUnderTest,
              // ignore: avoid_redundant_argument_values
              textScaleFactor: 3.2,
            );

          await tester.pumpWidgetBuilder(
            builder.build(),
            wrapper: goldenBaseRootWidgetWrapper(
              ourLightTheme: myLightThemeData,
              ourDarkTheme: myDarkThemeData,
              // ignore: cast_nullable_to_non_nullable
              ourThemeMode: settingsController.themeMode as ThemeMode,
            ),
          );

          await screenMatchesGolden(
            tester,
            'settings_screen_accessibility',
          );
        },
      );

      testGoldens(
        'Detail Screen - Accessibility',
        (WidgetTester tester) async {
          const widgetUnderTest = SampleItemDetailsView();
          final builder = GoldenBuilder.column()
            ..addScenario(
              'Default font size',
              widgetUnderTest,
            )
            ..addTextScaleScenario(
              'Large font size',
              widgetUnderTest,
              textScaleFactor: 2.0,
            )
            ..addTextScaleScenario(
              'Largest font',
              widgetUnderTest,
              // ignore: avoid_redundant_argument_values
              textScaleFactor: 3.2,
            );

            await tester.pumpWidgetBuilder(
            builder.build(),
            wrapper: goldenBaseRootWidgetWrapper(
              ourLightTheme: myLightThemeData,
              ourDarkTheme: myDarkThemeData,
              // ignore: cast_nullable_to_non_nullable
              ourThemeMode: settingsController.themeMode as ThemeMode,
            ),
          );

          await screenMatchesGolden(
            tester,
            'detail_screen_accessibility',
          );
          
        },
      );
    },
  );
}
