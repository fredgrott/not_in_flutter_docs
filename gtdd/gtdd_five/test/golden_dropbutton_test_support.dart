// ignore: eol_at_end_of_file
// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'package:flutter_test/flutter_test.dart';
import 'package:given_when_then/given_when_then.dart';
import 'package:golden_toolkit/src/testing_tools.dart';
import 'package:gtdd_five/src/domain/app_vars.dart';
import 'package:gtdd_five/src/presentation/features/settings/ui/settings_view.dart';

import 'golden_custom_matchers.dart';
import 'golden_page_objects.dart';
import 'golden_wrapper.dart';

Future<void> Function(WidgetTester) dropButtonHarness(
  WidgetTestHarnessCallback<_WidgetTestHarness> callback,
) {
  return (tester) =>
      givenWhenThenWidgetTest(_WidgetTestHarness(tester), callback);
}

class _WidgetTestHarness extends WidgetTestHarness {
  _WidgetTestHarness(WidgetTester tester) : super(tester);
}

extension SettingsScreenGiven on WidgetTestGiven<_WidgetTestHarness> {
  Future<void> myAppExistsSettingsScreen() async {
    await tester.runAsync<dynamic>(() async {
      await tester.pumpWidgetBuilder(
        SettingsView(controller: settingsController),
        wrapper: myModifiedRootWidgetWrapper(),
      );
    });
    final app = MyAppPageObject();
    expect(app.settingsScreen.appbarTitle, findsOneWidget);
  }
}



extension SettingsScreenThenSystemTheme on WidgetTestThen<_WidgetTestHarness> {
  Future<void> dropDownButtonTextSystemTheme() async {
    await tester.runAsync<dynamic>(() async {
      await tester.pumpWidgetBuilder(
        SettingsView(controller: settingsController),
        wrapper: myModifiedRootWidgetWrapper(),
      );
    });

    final app = MyAppPageObject();
    expect(app.settingsScreen.dropButtonSystemTheme, HasText('System Theme'));
  }
}

extension SettingsScreenThenLightTheme on WidgetTestThen<_WidgetTestHarness> {
  Future<void> dropDownButtonTextLightTheme() async {
    await tester.runAsync<dynamic>(() async {
      await tester.pumpWidgetBuilder(
        SettingsView(controller: settingsController),
        wrapper: myModifiedRootWidgetWrapper(),
      );
    });

    final app = MyAppPageObject();
    expect(app.settingsScreen.dropButtonLightTheme, HasText('Light Theme'));
  }
}

extension SettingsScreenThenDarkTheme on WidgetTestThen<_WidgetTestHarness> {
  Future<void> dropDownButtonTextDarkTheme() async {
    await tester.runAsync<dynamic>(() async {
      await tester.pumpWidgetBuilder(
        SettingsView(controller: settingsController),
        wrapper: myModifiedRootWidgetWrapper(),
      );
    });

    final app = MyAppPageObject();
    expect(app.settingsScreen.dropButtonDarkTheme, HasText('Dark Theme'));
  }
}
