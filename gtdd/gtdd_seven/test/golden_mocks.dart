// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// controller.themeMode and controller.updateThemeMode

import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';

// Need it this way so that one can use it in test fixtures as 
// it's always initialized in the setUp of test suites before any 
// test fixtures are called.
MySettingsController? mySettingsController;

// The gist is avoiding having to mock many UI things
// as we want robust testing suites that do not have
// to modified every time the screen or UI components change.
// Thus, we only need to mock two methods of the SettingsController
// class to hook into the behavior to mock.
//
// The way this MockTail integrates with eBay's Given When Then is now
// the When part will be the mocktail stub step i.e.
//  mocktail.when(() => mySettingsController.themeMode).thenReturn(ThemeMode.system);
//  mocktail.when(() => mySettingsController.updateThemeMode()).thenReturn(ThemeMode.system);
// of course assuming that we need to give a mocktail prefix to mocktail.
class MySettingsController {
  ThemeMode? _themeMode;

  ThemeMode? get themeMode => _themeMode;

  void updateThemeMode(ThemeMode? newThemeMode) {
    if (newThemeMode == null) return;

    // Dot not perform any work if new and old ThemeMode are identical
    if (newThemeMode == _themeMode) return;

    // Otherwise, store the new theme mode in memory
    _themeMode = newThemeMode;
  }
}

class MockMySettingsController extends Mock implements MySettingsController {}
