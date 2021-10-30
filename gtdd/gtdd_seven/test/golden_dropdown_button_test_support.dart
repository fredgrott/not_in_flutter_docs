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
import 'package:mocktail/mocktail.dart' as mocktail;

import 'golden_mocks.dart';
import 'golden_page_objects.dart';
import 'golden_wrapper.dart';

Future<void> Function(WidgetTester) dropButtonHarness(
  WidgetTestHarnessCallback<_WidgetTestHarness> callback,
) {
  return (tester) => givenWhenThenWidgetTest(
        _WidgetTestHarness(tester),
        callback,
      );
}

class _WidgetTestHarness extends WidgetTestHarness {
  _WidgetTestHarness(WidgetTester tester) : super(tester);
}

extension SettingsScreenGiven on WidgetTestGiven<_WidgetTestHarness> {
  Future<void> myAppExistsSettingsScreenVisible() async {
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
      app.settingsScreen.appbarTitle,
      findsOneWidget,
    );
  }
}

extension SettingsScreenUserSelectsSystemThemeWhen on WidgetTestWhen<_WidgetTestHarness>{
  Future<void> myUserChosesSystemTheme() async{
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

    // stub
    mocktail
        .when(() => mySettingsController?.updateThemeMode(ThemeMode.system));

    mocktail
        .when<dynamic>(() => mySettingsController?.themeMode)
        .thenReturn(ThemeMode.system);

    // when user taps and choose dark theme

    final app = MyAppPageObject();

    // when user choses dark theme tap simulation
    await tester.ensureVisible(app.settingsScreen.dropDownButton);
    await tester.pumpAndSettle();
    await tester.ensureVisible(app.settingsScreen.dropDownButtonSystem);
    await tester.pumpAndSettle();

  }
}

extension SettingsScreenSystemThemeVisibleThen
    on WidgetTestThen<_WidgetTestHarness> {
  Future<void> myUserSeesSystemThemeVisible() async {
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
    await screenMatchesGolden(
      tester,
      "system theme visible",
    );
  }
}

extension SettingsScreenUserSelectsDarkThemeWhen
    on WidgetTestWhen<_WidgetTestHarness> {
  Future<void> myUserChosesDarkTheme() async {
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

    // stub
    mocktail
        .when(() => mySettingsController?.updateThemeMode(ThemeMode.system));

    mocktail
        .when<dynamic>(() => mySettingsController?.themeMode)
        .thenReturn(ThemeMode.system);

    // when user taps and choose dark theme

    final app = MyAppPageObject();

    // when user choses dark theme tap simulation
    await tester.ensureVisible(app.settingsScreen.dropDownButton);
    await tester.pumpAndSettle();
    await tester.ensureVisible(app.settingsScreen.dropDownButtonDark);
    await tester.pumpAndSettle();
  }
}

extension SettingsScreenUserHasChosenDarkThemeThen
    on WidgetTestThen<_WidgetTestHarness> {
  Future<void> myUserSeesDarkThemeVisible() async {
    await tester.runAsync<dynamic>(() async {
      // simulating dark theme
      await tester.pumpWidgetBuilder(
        SettingsView(controller: settingsController),
        wrapper: myModifiedRootWidgetWrapper(
          ourLightTheme: myLightThemeData,
          ourDarkTheme: myDarkThemeData,
          // ignore: cast_nullable_to_non_nullable
          ourThemeMode: ThemeMode.dark,
        ),
      );
    });
    //stub
    mocktail.when(() => mySettingsController?.updateThemeMode(ThemeMode.dark));
    //stub
    mocktail
        .when<dynamic>(() => mySettingsController?.themeMode)
        .thenReturn(ThemeMode.dark);
    // interact
    mySettingsController?.themeMode;
    // verify
    mocktail.verify(() => mySettingsController?.themeMode);

    // now get our visual proof of the mocked simulation
    await screenMatchesGolden(
      tester,
      "dark theme visible after user choses dark",
    );
  }
}

extension SettingsScreenUserSelectsLightThemeWhen on WidgetTestWhen<_WidgetTestHarness>{
  Future<void> myUserChosesLightTheme() async{
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

    // stub
    mocktail
        .when(() => mySettingsController?.updateThemeMode(ThemeMode.system));

    mocktail
        .when<dynamic>(() => mySettingsController?.themeMode)
        .thenReturn(ThemeMode.system);

    // when user taps and choose dark theme

    final app = MyAppPageObject();

    // when user choses dark theme tap simulation
    await tester.ensureVisible(app.settingsScreen.dropDownButton);
    await tester.pumpAndSettle();
    await tester.ensureVisible(app.settingsScreen.dropDownButtonLight);
    await tester.pumpAndSettle();

  }
}

extension SettingsScreenUserHasChosenLightTheme on WidgetTestThen<_WidgetTestHarness>{
  Future<void> myUserSeesLightThemeVisible() async{
    await tester.runAsync<dynamic>(() async {
      // simulating dark theme
      await tester.pumpWidgetBuilder(
        SettingsView(controller: settingsController),
        wrapper: myModifiedRootWidgetWrapper(
          ourLightTheme: myLightThemeData,
          ourDarkTheme: myDarkThemeData,
          // ignore: cast_nullable_to_non_nullable
          ourThemeMode: ThemeMode.light,
        ),
      );
    });
    //stub
    mocktail.when(() => mySettingsController?.updateThemeMode(ThemeMode.light));
    //stub
    mocktail
        .when<dynamic>(() => mySettingsController?.themeMode)
        .thenReturn(ThemeMode.light);
    // interact
    mySettingsController?.themeMode;
    // verify
    mocktail.verify(() => mySettingsController?.themeMode);

    // now get our visual proof of the mocked simulation
    await screenMatchesGolden(
      tester,
      "dark theme visible after user choses light",
    );
  }
}
