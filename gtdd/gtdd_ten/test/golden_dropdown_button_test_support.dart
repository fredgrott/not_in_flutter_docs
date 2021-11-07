// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:given_when_then/given_when_then.dart';
import 'package:golden_toolkit/src/testing_tools.dart';
import 'package:gtdd_ten/src/infrastructure/app_vars.dart';
import 'package:gtdd_ten/src/presentation/features/settings/ui/settingsview.dart';

import 'package:gtdd_ten/src/presentation/themes/my_material_themedata.dart';

import 'golden_base_fpw_root_widget_wrapper.dart';

import 'golden_page_objects.dart';

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
        wrapper: goldenBaseFPWRootWidgetWrapper(
          ourLightTheme: myLightMaterialThemeData,
          ourDarkTheme: myDarkMaterialThemeData,
          // ignore: cast_nullable_to_non_nullable
          ourThemeMode: settingsController.themeMode as ThemeMode,
        ),
      );
    });
    final app = MyAppPageObject();
    expect(
      app.settingsScreen.appBar,
      findsOneWidget,
    );
  }
}

extension SettingsScreenUserSelectsSystemThemeWhen
    on WidgetTestWhen<_WidgetTestHarness> {
  Future<void> myUserChosesSystemTheme() async {
    await tester.runAsync<dynamic>(() async {
      await tester.pumpWidgetBuilder(
        SettingsView(controller: settingsController),
        wrapper: goldenBaseFPWRootWidgetWrapper(
          ourLightTheme: myLightMaterialThemeData,
          ourDarkTheme: myDarkMaterialThemeData,
          // ignore: cast_nullable_to_non_nullable
          ourThemeMode: settingsController.themeMode as ThemeMode,
        ),
      );
    });

    // when user taps and choose dark theme

    

    
    // This is the way to grab anything that is dynamically generated list that will
    // have two indexes such as a dropdown menu
    expect(
      (tester.widget(find.byKey(const Key("OurThemeMode"))) as DropdownButton)
          .value,
      equals(ThemeMode.system.toString()),
    );
    await tester.tap(find.text(ThemeMode.system.toString()));
    // Need to call pump twice; once to complete the action and once to complete
    // the animation.
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));

    // after opening the menu we have two widgets with text 'Greater'
    // one in index stack of the dropdown button and one in the menu .
    // apparently the last one is from the menu.
    await tester.tap(find.text(ThemeMode.system.toString()).last);
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));

    // We directly verify the value updated in the onchaged function.
    // this gives Actual: ThemeMode:<ThemeMode.system>
    //            Expected:  'ThemeMode.system'
    // expect(settingsController.themeMode, ThemeMode.system.toString(),)
    // so this is where my mock comes in as I have to then interact 
    // with the mock to choose system and than 
    // myMockedSettingsController.themeMode as the expected matcher.
    expect(settingsController.themeMode, ThemeMode.system.toString(),);

    
  }
}

extension SettingsScreenSystemThemeVisibleThen
    on WidgetTestThen<_WidgetTestHarness> {
  Future<void> myUserSeesSystemThemeVisible() async {
    await tester.runAsync<dynamic>(() async {
      await tester.pumpWidgetBuilder(
        SettingsView(controller: settingsController),
        wrapper: goldenBaseFPWRootWidgetWrapper(
          ourLightTheme: myLightMaterialThemeData,
          ourDarkTheme: myDarkMaterialThemeData,
          // ignore: cast_nullable_to_non_nullable
          ourThemeMode: settingsController.themeMode as ThemeMode,
        ),
      );
    });
    await screenMatchesGolden(
      tester,
      "system_theme_visible_after_choosing_system",
    );
  }
}

extension SettingsScreenUserSelectsDarkThemeWhen
    on WidgetTestWhen<_WidgetTestHarness> {
  Future<void> myUserChosesDarkTheme() async {
    await tester.runAsync<dynamic>(() async {
      await tester.pumpWidgetBuilder(
        SettingsView(controller: settingsController),
        wrapper: goldenBaseFPWRootWidgetWrapper(
          ourLightTheme: myLightMaterialThemeData,
          ourDarkTheme: myDarkMaterialThemeData,
          // ignore: cast_nullable_to_non_nullable
          ourThemeMode: settingsController.themeMode as ThemeMode,
        ),
      );
    });

     // This is the way to grab anything that is dynamically generated list that will
    // have two indexes such as a dropdown menu
    expect(
      (tester.widget(find.byKey(const Key("OurThemeMode"))) as DropdownButton)
          .value,
      equals(ThemeMode.dark.toString()),
    );
    await tester.tap(find.text(ThemeMode.dark.toString()));
    // Need to call pump twice; once to complete the action and once to complete
    // the animation.
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));

    // after opening the menu we have two widgets with text 'Greater'
    // one in index stack of the dropdown button and one in the menu .
    // apparently the last one is from the menu.
    await tester.tap(find.text(ThemeMode.dark.toString()).last);
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));

    /// We directly verify the value updated in the onchaged function.
    expect(
      settingsController.themeMode,
      ThemeMode.dark.toString(),
    );
  }
}

extension SettingsScreenUserHasChosenDarkThemeThen
    on WidgetTestThen<_WidgetTestHarness> {
  Future<void> myUserSeesDarkThemeVisible() async {
    await tester.runAsync<dynamic>(() async {
      // simulating dark theme
      await tester.pumpWidgetBuilder(
        SettingsView(controller: settingsController),
        wrapper: goldenBaseFPWRootWidgetWrapper(
          ourLightTheme: myLightMaterialThemeData,
          ourDarkTheme: myDarkMaterialThemeData,
          // ignore: cast_nullable_to_non_nullable
          ourThemeMode: ThemeMode.dark,
        ),
      );
    });

    // now get our visual proof of the mocked simulation
    await screenMatchesGolden(
      tester,
      "dark_theme_visible_after_user_choses_dark",
    );
  }
}

extension SettingsScreenUserSelectsLightThemeWhen
    on WidgetTestWhen<_WidgetTestHarness> {
  Future<void> myUserChosesLightTheme() async {
    await tester.runAsync<dynamic>(() async {
      await tester.pumpWidgetBuilder(
        SettingsView(controller: settingsController),
        wrapper: goldenBaseFPWRootWidgetWrapper(
          ourLightTheme: myLightMaterialThemeData,
          ourDarkTheme: myDarkMaterialThemeData,
          // ignore: cast_nullable_to_non_nullable
          ourThemeMode: settingsController.themeMode as ThemeMode,
        ),
      );
    });

    // when user taps and choose dark theme

     // This is the way to grab anything that is dynamically generated list that will
    // have two indexes such as a dropdown menu
    expect(
      (tester.widget(find.byKey(const Key("OurThemeMode"))) as DropdownButton)
          .value,
      equals(ThemeMode.light.toString()),
    );
    await tester.tap(find.text(ThemeMode.light.toString()));
    // Need to call pump twice; once to complete the action and once to complete
    // the animation.
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));

    // after opening the menu we have two widgets with text 'Greater'
    // one in index stack of the dropdown button and one in the menu .
    // apparently the last one is from the menu.
    await tester.tap(find.text(ThemeMode.light.toString()).last);
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));

    /// We directly verify the value updated in the onchaged function.
    expect(
      settingsController.themeMode,
      ThemeMode.light.toString(),
    );
  }
}

extension SettingsScreenUserHasChosenLightTheme
    on WidgetTestThen<_WidgetTestHarness> {
  Future<void> myUserSeesLightThemeVisible() async {
    await tester.runAsync<dynamic>(() async {
      // simulating dark theme
      await tester.pumpWidgetBuilder(
        SettingsView(controller: settingsController),
        wrapper: goldenBaseFPWRootWidgetWrapper(
          ourLightTheme: myLightMaterialThemeData,
          ourDarkTheme: myDarkMaterialThemeData,
          // ignore: cast_nullable_to_non_nullable
          ourThemeMode: ThemeMode.light,
        ),
      );
    });

    // now get our visual proof of the mocked simulation
    await screenMatchesGolden(
      tester,
      "ligh_theme_visible_after_user_choses_light",
    );
  }
}
