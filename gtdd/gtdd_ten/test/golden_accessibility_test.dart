// ignore: eol_at_end_of_file
// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:gtdd_ten/src/infrastructure/app_vars.dart';
import 'package:gtdd_ten/src/presentation/themes/my_app_themedata.dart';

import 'golden_base_lite_root_widget_wrapper.dart';
import 'golden_listview.dart';

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
    'Accessiblity Tests-Material-Light',
    () {
      testGoldens(
        'Sample Screen List Tile by column - Accessiblity-Materila-LightTheme',
        (WidgetTester tester) async {
          final widgetUnderTest = myCustomWidget;
          final builder = GoldenBuilder.column(
            wrap: goldenBaseLiteRootWidgetWrapper(
              // ignore: avoid_redundant_argument_values
              platform: TargetPlatform.android,
              myTheme: myLightThemeData,),
          )
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

          await tester.pumpWidgetBuilder(builder.build());

          await screenMatchesGolden(
            tester,
            'list_tile_accessibility_column_material_light',
          );
        },
      );

      testGoldens(
        'Sample Screen List Tile by grid - Accessiblity Material Light Theme',
        (WidgetTester tester) async {
          final widgetUnderTest = myCustomWidget;
          final builder = GoldenBuilder.grid(
            columns: 2,
            widthToHeightRatio: 0.5,
            wrap: goldenBaseLiteRootWidgetWrapper(
              // ignore: avoid_redundant_argument_values
              platform: TargetPlatform.android,
              myTheme: myLightThemeData,),
          )
            ..addScenario(
              'another normal',
              widgetUnderTest,
            )
            ..addScenario(
              'normal',
              widgetUnderTest,
            );

          await tester.pumpWidgetBuilder(builder.build());
          await screenMatchesGolden(
            tester,
            'list_tile_types_grid_material_light',
          );
        },
      );
    },
  );

  group(
    'Accessiblity Tests-Material-Dark',
    () {
      testGoldens(
        'Sample Screen List Tile by column - Accessiblity-Materila-DarkTheme',
        (WidgetTester tester) async {
          final widgetUnderTest = myCustomWidget;
          final builder = GoldenBuilder.column(
            wrap: goldenBaseLiteRootWidgetWrapper(
              // ignore: avoid_redundant_argument_values
              platform: TargetPlatform.android,
              myTheme: myDarkThemeData,
            ),
          )
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

          await tester.pumpWidgetBuilder(builder.build());

          await screenMatchesGolden(
            tester,
            'list_tile_accessibility_column_material_dark',
          );
        },
      );

      testGoldens(
        'Sample Screen List Tile by grid - Accessiblity Material Dark Theme',
        (WidgetTester tester) async {
          final widgetUnderTest = myCustomWidget;
          final builder = GoldenBuilder.grid(
            columns: 2,
            widthToHeightRatio: 0.5,
            wrap: goldenBaseLiteRootWidgetWrapper(
              // ignore: avoid_redundant_argument_values
              platform: TargetPlatform.android,
              myTheme: myDarkThemeData,
            ),
          )
            ..addScenario(
              'another normal',
              widgetUnderTest,
            )
            ..addScenario(
              'normal',
              widgetUnderTest,
            );

          await tester.pumpWidgetBuilder(builder.build());
          await screenMatchesGolden(
            tester,
            'list_tile_types_grid_material_dark',
          );
        },
      );
    },
  );



  group(
    'Accessiblity Tests-Cupertino-Light',
    () {
      testGoldens(
        'Sample Screen List Tile by column - Accessiblity Cupertino Light',
        (WidgetTester tester) async {
          final widgetUnderTest = myCustomWidget;
          final builder = GoldenBuilder.column(
            wrap: goldenBaseLiteRootWidgetWrapper(
              // ignore: avoid_redundant_argument_values
              platform: TargetPlatform.iOS,
              myTheme: myLightThemeData,
            ),
          )
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

          await tester.pumpWidgetBuilder(builder.build());

          await screenMatchesGolden(
            tester,
            'list_tile_accessibility_column_cupertino_light',
          );
        },
      );
      testGoldens(
        'Sample Screen List Tile by grid - Accessiblity Cupertino Light',
        (WidgetTester tester) async {
          final widgetUnderTest = myCustomWidget;
          final builder = GoldenBuilder.grid(
            columns: 2,
            widthToHeightRatio: 0.5,
            wrap: goldenBaseLiteRootWidgetWrapper(
              platform: TargetPlatform.iOS,
              myTheme: myLightThemeData,
            ),
          )
            ..addScenario(
              'another normal',
              widgetUnderTest,
            )
            ..addScenario(
              'normal',
              widgetUnderTest,
            );

          await tester.pumpWidgetBuilder(builder.build());
          await screenMatchesGolden(
            tester,
            'list_tile_types_grid_cupertino_light',
          );
        },
      );
    },
  );

  group(
    'Accessiblity Tests-Cupertino-Dark',
    () {
      testGoldens(
        'Sample Screen List Tile by column - Accessiblity Cupertino Dark',
        (WidgetTester tester) async {
          final widgetUnderTest = myCustomWidget;
          final builder = GoldenBuilder.column(
            wrap: goldenBaseLiteRootWidgetWrapper(
              // ignore: avoid_redundant_argument_values
              platform: TargetPlatform.iOS,
              myTheme: myDarkThemeData,
            ),
          )
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

          await tester.pumpWidgetBuilder(builder.build());

          await screenMatchesGolden(
            tester,
            'list_tile_accessibility_column_cupertino_dark',
          );
        },
      );
      testGoldens(
        'Sample Screen List Tile by grid - Accessiblity Cupertino Dark',
        (WidgetTester tester) async {
          final widgetUnderTest = myCustomWidget;
          final builder = GoldenBuilder.grid(
            columns: 2,
            widthToHeightRatio: 0.5,
            wrap: goldenBaseLiteRootWidgetWrapper(
              platform: TargetPlatform.iOS,
              myTheme: myDarkThemeData,
            ),
          )
            ..addScenario(
              'another normal',
              widgetUnderTest,
            )
            ..addScenario(
              'normal',
              widgetUnderTest,
            );

          await tester.pumpWidgetBuilder(builder.build());
          await screenMatchesGolden(
            tester,
            'list_tile_types_grid_cupertino_dark',
          );
        },
      );
    },
  );
}
