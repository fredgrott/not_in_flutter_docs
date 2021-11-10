// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:given_when_then/given_when_then.dart';
import 'package:golden_toolkit/src/testing_tools.dart';
import 'package:gtdd_eleven/src/infrastructure/app_vars.dart';
import 'package:gtdd_eleven/src/presentation/features/home/ui/sampleitem_detailsview.dart';
import 'package:gtdd_eleven/src/presentation/themes/material_themedata.dart';






import 'golden_base_rootwidgetwrapper.dart';
import 'golden_page_objects.dart';


Future<void> Function(WidgetTester) detailTextHarness(
  WidgetTestHarnessCallback<_WidgetTestHarness> callback,
) {
  return (tester) =>
      givenWhenThenWidgetTest(_WidgetTestHarness(tester), callback,);
}

class _WidgetTestHarness extends WidgetTestHarness {
  _WidgetTestHarness(WidgetTester tester) : super(tester);
}

extension SampleItemDetailsViewScreenGiven on WidgetTestGiven<_WidgetTestHarness> {
  Future<void> myAppExists() async {
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
    expect(app.sampleDetailsScreen.appBar, findsOneWidget,);
  }
}

extension SampleItemDetailsAppBarTitleThen on WidgetTestThen<_WidgetTestHarness> {
  Future<void> appBarTitleIs() async {
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
    expect(app.sampleDetailsScreen.appBar, findsOneWidget,);
  }
}

extension SampleItemDetailsTextThen
    on WidgetTestThen<_WidgetTestHarness> {
  Future<void> textIsSampleItemDetailScreen() async {
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
    // Gist: If I put a Key with PlatformText actual result is two widgets with that ke,
    //       i.e. both PlatformText and Text Widget.
    expect(app.sampleDetailsScreen.textDetail, findsNWidgets(2),);
  }
}
