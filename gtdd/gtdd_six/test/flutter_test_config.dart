// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:async';

import 'package:golden_toolkit/golden_toolkit.dart';

// flutter_test library uses a flutter_test_config file to use
// the dart test package. See:
// https://api.flutter.dev/flutter/flutter_test/flutter_test-library.html
//
// Docs for the dart test package is at:
// https://pub.dev/packages/test
Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  return GoldenToolkit.runWithConfiguration(
    () async {
      await loadAppFonts();
      await testMain();
    },
    config: GoldenToolkitConfiguration(
      
    ),
  );
}
