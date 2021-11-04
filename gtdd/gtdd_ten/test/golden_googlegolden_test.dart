// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter_test/flutter_test.dart';
import 'package:gtdd_ten/src/infrastructure/app_vars.dart';
import 'package:gtdd_ten/src/my_app.dart';

// Gist: just executes a Golden test the google way

void main() {
  setUpAll(() async {
    // This Flutter Engine is running binding turns off
    // http and  https access which is why we use mocks
    // in goldens testing driven design.
    //
    // Putting it in a setUpAll method means its used for all testing in
    // this testing suite.
    TestWidgetsFlutterBinding.ensureInitialized();

    // setting up our mocked dep

    await settingsController.loadSettings();
  });

  // to tear down mocked dependencies
  // ignore: no-empty-block
  tearDownAll(() async {});

  group('Google Golden test', () {
    testWidgets(
        'Golden test',
        (WidgetTester tester) async {
          await tester.runAsync<dynamic>(() async {
            await tester.pumpWidget(
              MyApp(
                settingsController: settingsController,
              ),
            );
            await tester.pumpAndSettle();
          });
          await expectLater(
            find.byType(MyApp),
            matchesGoldenFile('main.png'),
          );
        },
      );
  },);
}
