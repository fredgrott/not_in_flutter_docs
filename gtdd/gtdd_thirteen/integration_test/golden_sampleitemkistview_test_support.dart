// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter_test/flutter_test.dart';
import 'package:given_when_then/given_when_then.dart';

import 'golden_page_objects.dart';

Future<void> Function(WidgetTester) ourSampleItemListViewHarness(
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

extension OurAppGiven on WidgetTestGiven<_WidgetTestHarness> {
  Future<void> myAppExists() async {
    final app = IntegrationMyAppPageObject();
    // With Flutter Platform Widgets usage and using the widget builders option under
    // PlatformText I will have two widgets with the key
    expect(
      app.homeScreen,
      findsOneWidget,
    );
  }
}

extension OurAppHomeHasAppBarThen on WidgetTestThen<_WidgetTestHarness> {
  Future<void> myAppBarOnHomeExists() async {
    final app = IntegrationMyAppPageObject();
    expect(
      app.homeScreen.appBar,
      findsOneWidget,
    );
  }
}

extension OurAppHomeHasAppBarWithNavSettingsThen
    on WidgetTestThen<_WidgetTestHarness> {
  Future<void> myAppBarOnHomeWithNavSettingsExists() async {
    final app = IntegrationMyAppPageObject();
    expect(
      app.homeScreen.navButtonSettings,
      findsOneWidget,
    );
  }
}

extension OurAppHomeHasListTilesThen on WidgetTestThen<_WidgetTestHarness> {
  Future<void> myAppBarOnHomeWithListTielsExists() async {
    final app = IntegrationMyAppPageObject();
    expect(
      app.homeScreen.listView,
      findsOneWidget,
    );
    // in a list, multiple tiles
    expect(
      app.homeScreen.listTile,
      findsWidgets,
    );
  }
}
