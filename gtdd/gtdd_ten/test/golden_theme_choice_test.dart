// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:gtdd_ten/src/infrastructure/app_vars.dart';

import 'golden_dropdown_button_test_support.dart';

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
    'BDD Testing Use Cases',
    () {
      // Theme Choice BDD use cases
      testGoldens(
        'User Choses System Theme',
        dropButtonHarness((
          given,
          when,
          then,
        ) async {
          await given.myAppExistsSettingsScreenVisible();

          await when.myUserChosesSystemTheme();
          await then.myUserSeesSystemThemeVisible();
        }),
      );

      testGoldens(
        'User Choses A Dark Theme',
        dropButtonHarness(
          (
            given,
            when,
            then,
          ) async {
            await given.myAppExistsSettingsScreenVisible();

            await when.myUserChosesDarkTheme();
            await then.myUserSeesDarkThemeVisible();
          },
        ),
      );

      testGoldens(
        'User Choses A Light Theme',
        dropButtonHarness(
          (
            given,
            when,
            then,
          ) async {
            await given.myAppExistsSettingsScreenVisible();

            // need to interact with the mock before the harness call

            await when.myUserChosesLightTheme();
            await then.myUserSeesLightThemeVisible();
          },
        ),
      );

      // navigation BDD goes here
    },
  );
}
