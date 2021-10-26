// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'package:flutter_test/flutter_test.dart';
import 'package:given_when_then/given_when_then.dart';
import 'package:golden_toolkit/src/testing_tools.dart';
import 'package:gtdd_five/src/presentation/features/home/ui/sample_item_list_view.dart';

import 'golden_custom_matchers.dart';
import 'golden_page_objects.dart';
import 'golden_wrapper.dart';

Future<void> Function(WidgetTester) listTileHarness(
  WidgetTestHarnessCallback<_WidgetTestHarness> callback,
) {
  return (tester) =>
      givenWhenThenWidgetTest(_WidgetTestHarness(tester), callback);
}

class _WidgetTestHarness extends WidgetTestHarness {
  _WidgetTestHarness(WidgetTester tester) : super(tester);
}

extension SampleScreenGiven on WidgetTestGiven<_WidgetTestHarness> {
  Future<void> myAppExistsSampleItem() async {
    await tester.runAsync<dynamic>(() async {
      await tester.pumpWidgetBuilder(const SampleItemListView(),
          wrapper: myModifiedRootWidgetWrapper(),);
    });
    final app = MyAppPageObject();
    expect(app.homeScreen.appbarTitle, findsOneWidget);
  }
}

extension SampleScreenWhen on WidgetTestWhen<_WidgetTestHarness> {
  Future<void> listTileFoundSampleScreen() async {
    await tester.runAsync<dynamic>(() async {
      await tester.pumpWidgetBuilder(
        const SampleItemListView(),
        wrapper: myModifiedRootWidgetWrapper(),
      );
    });
    final app = MyAppPageObject();
    expect(app.homeScreen.listTileTitle, findsNWidgets(3));
  }
}

extension SampleScreenListTileTitleOneThen on WidgetTestThen<_WidgetTestHarness> {
  Future<void> listTileTitleHasOne() async {
    await tester.runAsync<dynamic>(() async {
      await tester.pumpWidgetBuilder(
        const SampleItemListView(),
        wrapper: myModifiedRootWidgetWrapper(),
      );
    });
    final app = MyAppPageObject();
    expect(app.homeScreen.listTileTitle, containsSubstringNoCase('1'));
  }
}

extension SampleScreenListTileTitleTwoThen
    on WidgetTestThen<_WidgetTestHarness> {
  Future<void> listTileTitleHasTwo() async {
    await tester.runAsync<dynamic>(() async {
      await tester.pumpWidgetBuilder(
        const SampleItemListView(),
        wrapper: myModifiedRootWidgetWrapper(),
      );
    });
    final app = MyAppPageObject();
    expect(app.homeScreen.listTileTitle, containsSubstringNoCase('2'));
  }
}

extension SampleScreenListTileTitleThreeThen
    on WidgetTestThen<_WidgetTestHarness> {
  Future<void> listTileTitleHasThree() async {
    await tester.runAsync<dynamic>(() async {
      await tester.pumpWidgetBuilder(
        const SampleItemListView(),
        wrapper: myModifiedRootWidgetWrapper(),
      );
    });
    final app = MyAppPageObject();
    expect(app.homeScreen.listTileTitle, containsSubstringNoCase('3'));
  }
}
