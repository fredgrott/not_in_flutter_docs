// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// Gist: build by grid-columns fails for complex stuff
//       in golden toolkit so using devicebuilder with default
//       devices to get accessiblity tests completed.
//
//       I probably need to do very stripped down root widget
//       wrapper to get grid. But, that I can do later as
//       best practice polish.


import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:gtdd_eight/src/infrastructure/app_vars.dart';

import 'golden_listview.dart';

// Gist: GoldenBuiler is only ment to test individual widgets without scaffold as 
//       the result is put on a column or grid. Faked a ListView to demonstrate.

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
    'Accessiblity Tests By Column',
    () {
      testGoldens(
        'Sample Screen List Tile by column - Accessiblity',
        (WidgetTester tester) async {
          final widgetUnderTest = myCustomWidget;
          final builder = GoldenBuilder.column(
            
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
            'list_tile_accessibility',
          );
        },
      );

      
      
    },
  );
}
