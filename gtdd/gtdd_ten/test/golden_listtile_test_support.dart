// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:given_when_then/given_when_then.dart';
import 'package:golden_toolkit/src/testing_tools.dart';
import 'package:gtdd_ten/src/infrastructure/app_vars.dart';
import 'package:gtdd_ten/src/presentation/features/home/ui/sampleitem_listview.dart';


import 'package:gtdd_ten/src/presentation/themes/my_material_themedata.dart';

import 'golden_base_fpw_root_widget_wrapper.dart';

import 'golden_page_objects.dart';


// Note: One does not have to name each method unique as only need to make
//       sure that the extension names are unique and the harness method name.

Future<void> Function(WidgetTester) listTileHarness(
  WidgetTestHarnessCallback<_WidgetTestHarness> callback,
) {
  return (tester) =>
      givenWhenThenWidgetTest(_WidgetTestHarness(tester), callback,);
}
// ignore:prefer-file-match-file-name
class _WidgetTestHarness extends WidgetTestHarness {
  _WidgetTestHarness(WidgetTester tester) : super(tester);
}

extension SampleScreenGiven on WidgetTestGiven<_WidgetTestHarness> {
  Future<void> myAppExists() async {
    await tester.runAsync<dynamic>(() async {
      await tester.pumpWidgetBuilder(
        const SampleItemListView(),
        wrapper: goldenBaseFPWRootWidgetWrapper(
          ourLightTheme: myLightMaterialThemeData,
          ourDarkTheme: myDarkMaterialThemeData,
          // ignore: cast_nullable_to_non_nullable
          ourThemeMode: settingsController.themeMode as ThemeMode,
        ),
      );
    });
    final app = MyAppPageObject();
    expect(app.homeScreen.appBar, findsOneWidget,);
  }
}

extension SampleScreenListViewWhen on WidgetTestWhen<_WidgetTestHarness> {
  Future<void> listViewFound() async {
    await tester.runAsync<dynamic>(() async {
      await tester.pumpWidgetBuilder(
        const SampleItemListView(),
        wrapper: goldenBaseFPWRootWidgetWrapper(
          ourLightTheme: myLightMaterialThemeData,
          ourDarkTheme: myDarkMaterialThemeData,
          // ignore: cast_nullable_to_non_nullable
          ourThemeMode: settingsController.themeMode as ThemeMode,
        ),
      );
    });
    final app = MyAppPageObject();
    expect(app.homeScreen.listView, findsOneWidget,);
  }
}

extension SampleScreenListTileThen on WidgetTestThen<_WidgetTestHarness> {
  Future<void> threeListTilesFound() async {
    await tester.runAsync<dynamic>(() async {
      await tester.pumpWidgetBuilder(
        const SampleItemListView(),
        wrapper: goldenBaseFPWRootWidgetWrapper(
          ourLightTheme: myLightMaterialThemeData,
          ourDarkTheme: myDarkMaterialThemeData,
          // ignore: cast_nullable_to_non_nullable
          ourThemeMode: settingsController.themeMode as ThemeMode,
        ),
      );
    });
    final app = MyAppPageObject();
    expect(app.homeScreen.listTile, findsNWidgets(3),);
  }
}

extension SampleScreenListTileOneThen on WidgetTestThen<_WidgetTestHarness> {
  Future<void> listTileOneFound() async {
    await tester.runAsync<dynamic>(() async {
      await tester.pumpWidgetBuilder(
        const SampleItemListView(),
        wrapper: goldenBaseFPWRootWidgetWrapper(
          ourLightTheme: myLightMaterialThemeData,
          ourDarkTheme: myDarkMaterialThemeData,
          // ignore: cast_nullable_to_non_nullable
          ourThemeMode: settingsController.themeMode as ThemeMode,
        ),
      );
    });
    final app = MyAppPageObject();

    // Gist: Two widgets as it will be both a PlatformText Widget and Text Widget
    expect(
      app.homeScreen.listTileOne, findsNWidgets(2),
    );
  }
}

extension SampleScreenListTileTwoThen on WidgetTestThen<_WidgetTestHarness> {
  Future<void> listTileTwoFound() async {
    await tester.runAsync<dynamic>(() async {
      await tester.pumpWidgetBuilder(
        const SampleItemListView(),
        wrapper: goldenBaseFPWRootWidgetWrapper(
          ourLightTheme: myLightMaterialThemeData,
          ourDarkTheme: myDarkMaterialThemeData,
          // ignore: cast_nullable_to_non_nullable
          ourThemeMode: settingsController.themeMode as ThemeMode,
        ),
      );
    });
    final app = MyAppPageObject();
    // Gist: Two widgets as it will be both a PlatformText Widget and Text Widget
    expect(
      app.homeScreen.listTileTwo,
      findsNWidgets(2),
    );
  }
}

extension SampleScreenListTileThreeThen on WidgetTestThen<_WidgetTestHarness> {
  Future<void> listTileThreeFound() async {
    await tester.runAsync<dynamic>(() async {
      await tester.pumpWidgetBuilder(
        const SampleItemListView(),
        wrapper: goldenBaseFPWRootWidgetWrapper(
          ourLightTheme: myLightMaterialThemeData,
          ourDarkTheme: myDarkMaterialThemeData,
          // ignore: cast_nullable_to_non_nullable
          ourThemeMode: settingsController.themeMode  as ThemeMode,
        ),
      );
    });
    final app = MyAppPageObject();
    // Gist: Two widgets as it will be both a PlatformText Widget and Text Widget
    expect(
      app.homeScreen.listTileThree,
      findsNWidgets(2),
    );
  }
}
