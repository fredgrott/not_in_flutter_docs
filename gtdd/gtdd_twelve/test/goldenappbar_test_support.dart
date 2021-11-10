// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:given_when_then/given_when_then.dart';
import 'package:golden_toolkit/src/testing_tools.dart';
import 'package:gtdd_twelve/src/infrastructure/app_vars.dart';
import 'package:gtdd_twelve/src/presentation/features/home/ui/sampleitem_detailsview.dart';
import 'package:gtdd_twelve/src/presentation/features/home/ui/sampleitem_listview.dart';
import 'package:gtdd_twelve/src/presentation/features/settings/ui/settingsview.dart';
import 'package:gtdd_twelve/src/presentation/themes/material_themedata.dart';



import 'golden_base_rootwidgetwrapper.dart';
import 'golden_page_objects.dart';

Future<void> Function(WidgetTester) appbarHarness(
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

extension SampleAppBarGiven on WidgetTestGiven<_WidgetTestHarness> {
  Future<void> myAppExistsSampleScreen() async {
    await tester.runAsync<dynamic>(() async {
      await tester.pumpWidgetBuilder(
        const SampleItemListView(),
        wrapper: goldenBaseFullFWPRootWidgetWrapper(
          theme: materialLightMaterialThemeData,
          darkTheme: materialDarkMaterialThemeData,
          // ignore: cast_nullable_to_non_nullable
          myThemeMode: settingsController.themeMode as ThemeMode,
          
          
        ),
      );
    });
    final app = MyAppPageObject();
    // With Flutter Platform Widgets usage and using the widget builders option under
    // PlatformText I will have two widgets with the key
    expect(
      app.homeScreen.appBar,
      findsOneWidget,
    );
  }
}

extension DetailAppBarGiven on WidgetTestGiven<_WidgetTestHarness> {
  Future<void> myAppExistsDetailsScreen() async {
    await tester.runAsync<dynamic>(() async {
      await tester.pumpWidgetBuilder(
        const SampleItemDetailsView(),
        wrapper: goldenBaseFullFWPRootWidgetWrapper(
          theme: materialLightMaterialThemeData,
          darkTheme: materialDarkMaterialThemeData,
          // ignore: cast_nullable_to_non_nullable
          myThemeMode: settingsController.themeMode as ThemeMode,
          
        ),
      );
    });
    final app = MyAppPageObject();
    // With Flutter Platform Widgets usage and using the widget builders option under
    // PlatformText I will have two widgets with the key
    expect(
      app.sampleDetailsScreen.appBar,
      findsOneWidget,
    );
  }
}

extension SettingsAppBarGiven on WidgetTestGiven<_WidgetTestHarness> {
  Future<void> myAppExistsSettingsScreen() async {
    await tester.runAsync<dynamic>(() async {
      await tester.pumpWidgetBuilder(
        SettingsView(controller: settingsController),
        wrapper: goldenBaseFullFWPRootWidgetWrapper(
          theme: materialLightMaterialThemeData,
          darkTheme: materialDarkMaterialThemeData,
          // ignore: cast_nullable_to_non_nullable
          myThemeMode: settingsController.themeMode as ThemeMode,
          
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

extension SampleAppBarThen on WidgetTestThen<_WidgetTestHarness> {
  Future<void> appBarTitleIsSampleScreen() async {
    await tester.runAsync<dynamic>(() async {
      await tester.pumpWidgetBuilder(
        const SampleItemListView(),
        wrapper: goldenBaseFullFWPRootWidgetWrapper(
          theme: materialLightMaterialThemeData,
          darkTheme: materialDarkMaterialThemeData,
          // ignore: cast_nullable_to_non_nullable
          myThemeMode: settingsController.themeMode as ThemeMode,
          
        ),
      );
    });
    final app = MyAppPageObject();
    //Cupertino Capitializes Titles
    expect(
      app.homeScreen.appBar,
      findsOneWidget,
    );
  }
}

extension DetailAppBarThen on WidgetTestThen<_WidgetTestHarness> {
  Future<void> appBarTitleIsDetailScreen() async {
    await tester.runAsync<dynamic>(() async {
      await tester.pumpWidgetBuilder(
        const SampleItemDetailsView(),
        wrapper: goldenBaseFullFWPRootWidgetWrapper(
          theme: materialLightMaterialThemeData,
          darkTheme: materialDarkMaterialThemeData,
          // ignore: cast_nullable_to_non_nullable
          myThemeMode: settingsController.themeMode as ThemeMode,
          
        ),
      );
    });
    final app = MyAppPageObject();
    // With Flutter Platform Widgets usage and using the widget builders option under
    // PlatformText I will have two widgets with the key
    expect(
      app.sampleDetailsScreen.appBar,
      findsOneWidget,
    );
  }
}

extension SettingsAppBarThen on WidgetTestThen<_WidgetTestHarness> {
  Future<void> appBarTitleIsSettingsScreen() async {
    await tester.runAsync<dynamic>(() async {
      await tester.pumpWidgetBuilder(
        SettingsView(controller: settingsController),
        wrapper: goldenBaseFullFWPRootWidgetWrapper(
          theme: materialLightMaterialThemeData,
          darkTheme: materialDarkMaterialThemeData,
          // ignore: cast_nullable_to_non_nullable
          myThemeMode: settingsController.themeMode as ThemeMode,
          
        ),
      );
    });
    final app = MyAppPageObject();
    // With Flutter Platform Widgets usage and using the widget builders option under
    // PlatformText I will have two widgets with the key
    expect(
      app.settingsScreen.appBar,
      findsOneWidget,
    );
  }
}
