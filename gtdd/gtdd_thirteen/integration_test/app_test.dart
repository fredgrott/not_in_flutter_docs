// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter_test/flutter_test.dart';
import 'package:gtdd_thirteen/src/infrastructure/app_vars.dart';
import 'package:integration_test/integration_test.dart';
import 'package:gtdd_thirteen/main.dart' as myApp;

// Gist: Using Goldens Testing not only for acceptance testing but also
//       as ideal way to get screen shots during testing.
//
//       To run all tests in folder, each test is imported with a prefix, ie:
//        import 'whattodo_tests.dart' as whattodo;
//        than whattodo.main(); in the app.test.dart main
//         then
//        chromedriver --port=4444
//        flutter drive \
//           --driver=test_driver/integration_test.dart \
//           --target=integration_test/app_test.dart \
//           -d web-server

void main() {
  setUpAll(() async {
    final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized()
        as IntegrationTestWidgetsFlutterBinding;

    binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

    // setting up our mocked dep

    await settingsController.loadSettings();
  });

  tearDownAll(() async {});

  group('Integration Testing', () {

  },);
}
