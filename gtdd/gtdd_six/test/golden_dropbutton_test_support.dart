// ignore: eol_at_end_of_file
// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:given_when_then/given_when_then.dart';
import 'package:golden_toolkit/src/testing_tools.dart';
import 'package:gtdd_six/src/domain/app_vars.dart';
import 'package:gtdd_six/src/presentation/features/settings/ui/settings_view.dart';
import 'package:gtdd_six/src/presentation/themes/my_app_themedata.dart';

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
  Future<void> myAppExists() async {
    await tester.runAsync<dynamic>(() async {
      await tester.pumpWidgetBuilder(
        SettingsView(controller: settingsController),
        wrapper: myModifiedRootWidgetWrapper(
          ourLightTheme: myLightThemeData,
          ourDarkTheme: myDarkThemeData,
        ),
      );
    });
    final app = MyAppPageObject();
    expect(app.settingsScreen.appbarTitle, findsOneWidget);
  }
}

extension SettingsScreenDropButtonGiven on WidgetTestWhen<_WidgetTestHarness> {
  Future<void> dropDownExists() async {
    await tester.runAsync<dynamic>(() async {
      await tester.pumpWidgetBuilder(
        SettingsView(controller: settingsController),
        wrapper: myModifiedRootWidgetWrapper(
          ourLightTheme: myLightThemeData,
          ourDarkTheme: myDarkThemeData,
        ),
      );
    });
    final app = MyAppPageObject();
    expect(
      app.settingsScreen.dropDownButton,
      findsOneWidget,
    );
  }
}

extension SettingsScreenDropButtonWhen on WidgetTestWhen<_WidgetTestHarness> {
  Future<void> tapDropDown() async {
    await tester.runAsync<dynamic>(() async {
      await tester.pumpWidgetBuilder(
        SettingsView(controller: settingsController),
        wrapper: myModifiedRootWidgetWrapper(
          ourLightTheme: myLightThemeData,
          ourDarkTheme: myDarkThemeData,
        ),
      );
    });
    final app = MyAppPageObject();
    tester.tap(app.settingsScreen.dropDownButton);
    tester.pumpAndSettle();
  }
}

extension SettingsScreenChooseSystemThen on WidgetTestThen<_WidgetTestHarness> {
  Future<void> userChoosesSystemTheme() async {
    await tester.runAsync<dynamic>(() async {
      await tester.pumpWidgetBuilder(
        SettingsView(controller: settingsController),
        wrapper: myModifiedRootWidgetWrapper(
          ourLightTheme: myLightThemeData,
          ourDarkTheme: myDarkThemeData,
        ),
      );
    });
    final app = MyAppPageObject();
    tester.tap(app.settingsScreen.dropDownButtonSystem);
    tester.pumpAndSettle();
    expect(settingsController.themeMode, ThemeMode.system);
  }
}

extension SettingsScreenChooseDarkThen on WidgetTestThen<_WidgetTestHarness> {
  Future<void> userChoosesDarkTheme() async {
    await tester.runAsync<dynamic>(() async {
      await tester.pumpWidgetBuilder(
        SettingsView(controller: settingsController),
        wrapper: myModifiedRootWidgetWrapper(
          ourLightTheme: myLightThemeData,
          ourDarkTheme: myDarkThemeData,
        ),
      );
    });
    final app = MyAppPageObject();
    tester.tap(app.settingsScreen.dropDownButtonDark);
    tester.pumpAndSettle();
    expect(settingsController.themeMode, ThemeMode.dark);
  }
}

extension SettingsScreenChooseLightThen on WidgetTestThen<_WidgetTestHarness> {
  Future<void> userChoosesLightTheme() async {
    await tester.runAsync<dynamic>(() async {
      await tester.pumpWidgetBuilder(
        SettingsView(controller: settingsController),
        wrapper: myModifiedRootWidgetWrapper(
          ourLightTheme: myLightThemeData,
          ourDarkTheme: myDarkThemeData,
        ),
      );
    });
    final app = MyAppPageObject();
    tester.tap(app.settingsScreen.dropDownButtonLight);
    tester.pumpAndSettle();
    expect(settingsController.themeMode, ThemeMode.light);
  }
}
