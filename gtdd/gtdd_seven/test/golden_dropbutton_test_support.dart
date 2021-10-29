// ignore: eol_at_end_of_file
// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.



import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:given_when_then/given_when_then.dart';
import 'package:golden_toolkit/src/testing_tools.dart';
import 'package:gtdd_seven/src/domain/app_vars.dart';
import 'package:gtdd_seven/src/presentation/features/settings/ui/settings_view.dart';
import 'package:gtdd_seven/src/presentation/themes/my_app_themedata.dart';

import 'golden_page_objects.dart';
import 'golden_wrapper.dart';

// When Doing BDD on test side we have to do things connected together in
// one Given When Then block. An example dropdown the tap dropDown,
// tap menu item, and observe value change has to be one
// block.

Future<void> Function(WidgetTester) dropButtonHarness(
  WidgetTestHarnessCallback<_WidgetTestHarness> callback,
) {
  return (tester) =>
      givenWhenThenWidgetTest(_WidgetTestHarness(tester), callback,);
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
          // ignore: cast_nullable_to_non_nullable
          ourThemeMode: settingsController.themeMode as ThemeMode,
        ),
      );
    });
    final app = MyAppPageObject();
    expect(app.settingsScreen.appbarTitle, findsOneWidget,);
  }
}

extension SettingsScreenDropButtonGiven on WidgetTestGiven<_WidgetTestHarness> {
  Future<void> dropDownExists() async {
    await tester.runAsync<dynamic>(() async {
      await tester.pumpWidgetBuilder(
        SettingsView(controller: settingsController),
        wrapper: myModifiedRootWidgetWrapper(
          ourLightTheme: myLightThemeData,
          ourDarkTheme: myDarkThemeData,
          // ignore: cast_nullable_to_non_nullable
          ourThemeMode: settingsController.themeMode as ThemeMode,
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

extension SettingsScreenDropButtonSystemChosenThen
    on WidgetTestThen<_WidgetTestHarness> {
  Future<void> userChoosesSystemThemeAndItChanges() async {
    await tester.runAsync<dynamic>(() async {
      await tester.pumpWidgetBuilder(
        SettingsView(controller: settingsController),
        wrapper: myModifiedRootWidgetWrapper(
          ourLightTheme: myLightThemeData,
          ourDarkTheme: myDarkThemeData,
          // ignore: cast_nullable_to_non_nullable
          ourThemeMode: settingsController.themeMode as ThemeMode,
        ),
      );
    });
    final app = MyAppPageObject();
    // for dropdown buttons
    await tester.ensureVisible(app.settingsScreen.dropDownButton);
    await tester.pumpAndSettle();
    await tester.ensureVisible(app.settingsScreen.dropDownButtonSystem);
    await tester.pumpAndSettle();
    //expect(settingsController.themeMode, ThemeMode.system);
  }
}

extension SettingsScreenDropButtonDarkChosenThen
    on WidgetTestThen<_WidgetTestHarness> {
  Future<void> userChoosesDarkThemeAndItChanges() async {
    await tester.runAsync<dynamic>(() async {
      await tester.pumpWidgetBuilder(
        SettingsView(controller: settingsController),
        wrapper: myModifiedRootWidgetWrapper(
          ourLightTheme: myLightThemeData,
          ourDarkTheme: myDarkThemeData,
          // ignore: cast_nullable_to_non_nullable
          ourThemeMode: settingsController.themeMode as ThemeMode,
        ),
      );
    });
    final app = MyAppPageObject();

    await tester.ensureVisible(app.settingsScreen.dropDownButton);
    await tester.pumpAndSettle();
    await tester.ensureVisible(app.settingsScreen.dropDownButtonDark);
    await tester.pumpAndSettle();
    //expect(settingsController.themeMode, ThemeMode.dark);
  }
}

extension SettingsScreenDropButtonLightChosenThen
    on WidgetTestThen<_WidgetTestHarness> {
  Future<void> userChoosesLightThemeAndItChanges() async {
    await tester.runAsync<dynamic>(() async {
      await tester.pumpWidgetBuilder(
        SettingsView(controller: settingsController),
        wrapper: myModifiedRootWidgetWrapper(
          ourLightTheme: myLightThemeData,
          ourDarkTheme: myDarkThemeData,
          // ignore: cast_nullable_to_non_nullable
          ourThemeMode: settingsController.themeMode as ThemeMode,
        ),
      );
    });
    final app = MyAppPageObject();
    await tester.ensureVisible(app.settingsScreen.dropDownButton);

    await tester.pumpAndSettle();
    await tester.ensureVisible(app.settingsScreen.dropDownButtonLight);
    
    await tester.pumpAndSettle();
    //expect(settingsController.themeMode, ThemeMode.light);
  }
}
