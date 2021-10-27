// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'package:flutter_test/flutter_test.dart';
import 'package:given_when_then/given_when_then.dart';
import 'package:golden_toolkit/src/testing_tools.dart';
import 'package:gtdd_six/src/domain/app_vars.dart';
import 'package:gtdd_six/src/presentation/features/home/ui/sample_item_details_view.dart';

import 'package:gtdd_six/src/presentation/features/home/ui/sample_item_list_view.dart';
import 'package:gtdd_six/src/presentation/features/settings/ui/settings_view.dart';
import 'package:gtdd_six/src/presentation/themes/my_app_themedata.dart';

import 'golden_custom_matchers.dart';
import 'golden_page_objects.dart';
import 'golden_wrapper.dart';

// General gist is that for every UI component under test that we have
// one support test harness file. pumpWidgetBuilder from golden toolkit
// is used so that we can on flutter test side supply a root widget fixture
// to insert into the widget tree as the parent to the widget under test.
//
// And we have a harness per UI component for every screen that has that
// component.
//
// Also note that since we are doing extensions we have to ensure that
// we have uniquely named extensions and methods.

Future<void> Function(WidgetTester) appbarHarness(
  WidgetTestHarnessCallback<_WidgetTestHarness> callback,
) {
  return (tester) =>
      givenWhenThenWidgetTest(_WidgetTestHarness(tester), callback);
}

class _WidgetTestHarness extends WidgetTestHarness {
  _WidgetTestHarness(WidgetTester tester) : super(tester);
}

extension SampleAppBarGiven on WidgetTestGiven<_WidgetTestHarness> {
  Future<void> myAppExistsSampleScreen() async {
    await tester.runAsync<dynamic>(() async {
      await tester.pumpWidgetBuilder(
        const SampleItemListView(),
        wrapper: myModifiedRootWidgetWrapper(
          ourLightTheme: myLightThemeData,
          ourDarkTheme: myDarkThemeData,
        ),
      );
    });
    final app = MyAppPageObject();
    expect(app.homeScreen.appbarTitle, findsOneWidget);
  }
}

extension DetailAppBarGiven on WidgetTestGiven<_WidgetTestHarness> {
  Future<void> myAppExistsDetailsScreen() async {
    await tester.runAsync<dynamic>(() async {
      await tester.pumpWidgetBuilder(
        const SampleItemDetailsView(),
        wrapper: myModifiedRootWidgetWrapper(
          ourLightTheme: myLightThemeData,
          ourDarkTheme: myDarkThemeData,
        ),
      );
    });
    final app = MyAppPageObject();
    expect(app.sampleDetailsScreen.appbarTitle, findsOneWidget);
  }
}

extension SettingsAppBarGiven on WidgetTestGiven<_WidgetTestHarness> {
  Future<void> myAppExistsSettingsScreen() async {
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

extension SampleAppBarThen on WidgetTestThen<_WidgetTestHarness> {
  Future<void> appBarTitleIsSampleScreen() async {
    await tester.runAsync<dynamic>(() async {
      await tester.pumpWidgetBuilder(
        const SampleItemListView(),
        wrapper: myModifiedRootWidgetWrapper(
          ourLightTheme: myLightThemeData,
          ourDarkTheme: myDarkThemeData,
        ),
      );
    });
    final app = MyAppPageObject();
    expect(app.homeScreen.appbarTitle, HasText('Sample Items'));
  }
}

extension DetailAppBarThen on WidgetTestThen<_WidgetTestHarness> {
  Future<void> appBarTitleIsDetailScreen() async {
    await tester.runAsync<dynamic>(() async {
      await tester.pumpWidgetBuilder(
        const SampleItemDetailsView(),
        wrapper: myModifiedRootWidgetWrapper(
          ourLightTheme: myLightThemeData,
          ourDarkTheme: myDarkThemeData,
        ),
      );
    });
    final app = MyAppPageObject();
    expect(app.sampleDetailsScreen.appbarTitle, HasText('Item Details'));
  }
}

extension SettingsAppBarThen on WidgetTestThen<_WidgetTestHarness> {
  Future<void> appBarTitleIsSettingsScreen() async {
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
    expect(app.settingsScreen.appbarTitle, HasText("Settings"));
  }
}
