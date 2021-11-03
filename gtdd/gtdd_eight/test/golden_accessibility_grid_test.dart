// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:gtdd_eight/src/infrastructure/app_vars.dart';

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
    'Accessiblity Tests By Grid',
    () {
      testGoldens(
        'Sample Screen List Tile by grid - Accessiblity',
        (WidgetTester tester) async {
          final widgetUnderTest = myCustomWidget;
          final builder = GoldenBuilder.grid(columns: 2, widthToHeightRatio: 0.5,)
            ..addScenario(
              'another normal',
              widgetUnderTest,
            )
            ..addScenario('normal', widgetUnderTest,);

          await tester.pumpWidgetBuilder(builder.build());
          await screenMatchesGolden(tester, 'list_tile_types_grid',);
        },
      );
    },
  );
}
