// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:given_when_then/given_when_then.dart';
import 'package:golden_toolkit/src/testing_tools.dart';
import 'package:gtdd_seven_sven/src/infrastructure/app_vars.dart';

import 'package:gtdd_seven_sven/src/presentation/features/home/ui/sample_item_details_view.dart';
import 'package:gtdd_seven_sven/src/presentation/themes/my_app_themedata.dart';

import 'golden_custom_matchers.dart';
import 'golden_page_objects.dart';
import 'golden_wrapper.dart';

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
        wrapper: myModifiedRootWidgetWrapper(
          ourLightTheme: myLightThemeData,
          ourDarkTheme: myDarkThemeData,
          // ignore: cast_nullable_to_non_nullable
          ourThemeMode: settingsController.themeMode as ThemeMode,
        ),
      );
    });
    final app = MyAppPageObject();
    expect(app.sampleDetailsScreen.appbarTitle, findsOneWidget,);
  }
}

extension SampleItemDetailsAppBarTitleThen on WidgetTestThen<_WidgetTestHarness> {
  Future<void> appBarTitleIs() async {
    await tester.runAsync<dynamic>(() async {
      await tester.pumpWidgetBuilder(
        const SampleItemDetailsView(),
        wrapper: myModifiedRootWidgetWrapper(
          ourLightTheme: myLightThemeData,
          ourDarkTheme: myDarkThemeData,
          // ignore: cast_nullable_to_non_nullable
          ourThemeMode: settingsController.themeMode as ThemeMode,
        ),
      );
    });
    final app = MyAppPageObject();
    expect(app.sampleDetailsScreen.appbarTitle, HasText("Item Details"),);
  }
}

extension SampleItemDetailsTextThen
    on WidgetTestThen<_WidgetTestHarness> {
  Future<void> textIsSampleItemDetailScreen() async {
    await tester.runAsync<dynamic>(() async {
      await tester.pumpWidgetBuilder(
        const SampleItemDetailsView(),
        wrapper: myModifiedRootWidgetWrapper(
          ourLightTheme: myLightThemeData,
          ourDarkTheme: myDarkThemeData,
          // ignore: cast_nullable_to_non_nullable
          ourThemeMode: settingsController.themeMode as ThemeMode,
        ),
      );
    });
    final app = MyAppPageObject();
    expect(app.sampleDetailsScreen.textDetail, HasText('More Information Here'),);
  }
}
