// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter_test/flutter_test.dart';
import 'package:gtdd_eight/src/infrastructure/app_vars.dart';

import 'golden_appbar_test_support.dart';
import 'golden_detailscreen_text_test_support.dart';
import 'golden_listtile_test_support.dart';

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
    'Widget Unit Tests using page object',
    () {
      testWidgets(
        'AppBar Title is there',
        appbarHarness((
          given,
          when,
          then,
        ) async {
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
        listTileHarness((
          given,
          when,
          then,
        ) async {
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
        detailTextHarness((
          given,
          when,
          then,
        ) async {
          await given.myAppExists();
          await then.appBarTitleIs();
          await then.textIsSampleItemDetailScreen();
        }),
      );
    },
  );
}
