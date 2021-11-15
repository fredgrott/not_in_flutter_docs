// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:gtdd_twelve/src/infrastructure/app_vars.dart';
import 'package:gtdd_twelve/src/presentation/features/settings/ui/settingsview.dart';
import 'package:gtdd_twelve/src/presentation/features/settings/viewcontrollers/settings_controller.dart';
import 'package:gtdd_twelve/src/presentation/themes/cupertino_themedata.dart';
import 'package:gtdd_twelve/src/presentation/themes/material_themedata.dart';

import 'package:mocktail/mocktail.dart';

import 'golden_base_widgetwrapper.dart';
import 'golden_page_objects.dart';

class MockSettingsController extends Mock implements SettingsController {}

// Gist: When Mocking, When(stubbing) is always a when and expects are alwys
///      thens

void main() {
  late MockSettingsController mockedSettingsController;

  setUpAll(() async {
    // This Flutter Engine is running binding turns off
    // http and  https access which is why we use mocks
    // in goldens testing driven design.
    //
    // Putting it in a setUpAll method means its used for all testing in
    // this testing suite.
    TestWidgetsFlutterBinding.ensureInitialized();

    // setting up our mocked dep
    mockedSettingsController = MockSettingsController();

    await settingsController.loadSettings();
  });

  // to tear down mocked dependencies
  // ignore: no-empty-block
  tearDownAll(() async {});

  group(
    'Theme choice test',
    () {
      Future<void> _givenSettingsScreenSystermTheme(
        WidgetTester tester,
      ) async {
        await tester.pumpWidgetBuilder(
          SettingsView(
            controller: settingsController,
          ),
          wrapper: goldenBaseWidgetWrapper(
            theme: materialLightMaterialThemeData,
            darkTheme: materialDarkMaterialThemeData,
            // ignore: cast_nullable_to_non_nullable
            myThemeMode: settingsController.themeMode as ThemeMode,

            myCupertinoThemeData: cupertinoThemeData,
          ),
        );

        final app = MyAppPageObject();

        expect(
          app.settingsScreen.appBar,
          findsOneWidget,
        );
      }

      Future<void> _thenUserSeesLightTheme(WidgetTester tester) async {
        await tester.pumpWidgetBuilder(
          SettingsView(
            controller: settingsController,
          ),
          wrapper: goldenBaseWidgetWrapper(
            theme: materialLightMaterialThemeData,
            darkTheme: materialDarkMaterialThemeData,
            // ignore: cast_nullable_to_non_nullable
            myThemeMode: ThemeMode.light,

            myCupertinoThemeData: cupertinoThemeData,
          ),
        );

        final app = MyAppPageObject();

        expect(
          app.settingsScreen.appBar,
          findsOneWidget,
        );

        expect(
          ThemeMode.light,
          mockedSettingsController.themeMode,
        );
      }

      Future<void> _whenSystemTheme() async {
        when<dynamic>(() => mockedSettingsController.themeMode)
            .thenReturn(ThemeMode.system);
      }

      Future<void> _thenDropDownValueIsSystemTheme(WidgetTester tester) async {
        final app = MyAppPageObject();
        expect(
          (tester.widget(app.settingsScreen.dropDownButton) as DropdownButton)
              .value,
          equals(mockedSettingsController.themeMode),
        );
      }

      Future<void> _whenUserTapsSystemTheme(WidgetTester tester) async {
        await tester.ensureVisible(
          find.byKey(ValueKey<String>('$ThemeMode.system')),
        );
        await tester.pump();
        await tester.pump(const Duration(seconds: 1));
        await tester.ensureVisible(
          find.byKey(ValueKey<String>('$ThemeMode.system')).last,
        );
        await tester.pump();
        await tester.pump(const Duration(seconds: 1));
      }

      Future<void> _thenUserExpectsThemeMode() async {
        expect(
          ThemeMode.system,
          mockedSettingsController.themeMode,
        );
      }

      Future<void> _whenUserTapsDarkTheme(WidgetTester tester) async {
        await tester.ensureVisible(
          find.byKey(ValueKey<String>('$ThemeMode.dark')),
        );
        // Need to call pump twice; once to complete the action and once to complete
        // the animation.
        await tester.pump();
        await tester.pump(const Duration(seconds: 1));

        // after opening the menu we have two widgets with text 'Greater'
        // one in index stack of the dropdown button and one in the menu .
        // apparently the last one is from the menu.
        await tester.ensureVisible(
          find.byKey(ValueKey<String>('$ThemeMode.dark')).last,
        );
        await tester.pump();
        await tester.pump(const Duration(seconds: 1));

        when<dynamic>(() => mockedSettingsController.themeMode)
            .thenReturn(ThemeMode.dark);
      }

      Future<void> _thenUserSeesDarkTheme(WidgetTester tester) async {
        await tester.pumpWidgetBuilder(
          SettingsView(
            controller: settingsController,
          ),
          wrapper: goldenBaseWidgetWrapper(
            theme: materialLightMaterialThemeData,
            darkTheme: materialDarkMaterialThemeData,
            // ignore: cast_nullable_to_non_nullable
            myThemeMode: ThemeMode.dark,

            myCupertinoThemeData: cupertinoThemeData,
          ),
        );

        final app = MyAppPageObject();

        expect(
          app.settingsScreen.appBar,
          findsOneWidget,
        );

        expect(
          ThemeMode.dark,
          mockedSettingsController.themeMode,
        );
      }

      Future<void> _whenUserTapsLightTheme(WidgetTester tester) async {
        await tester.ensureVisible(
          find.byKey(ValueKey<String>('$ThemeMode.light')),
        );
        // Need to call pump twice; once to complete the action and once to complete
        // the animation.
        await tester.pump();
        await tester.pump(const Duration(seconds: 1));

        // after opening the menu we have two widgets with text 'Greater'
        // one in index stack of the dropdown button and one in the menu .
        // apparently the last one is from the menu.
        await tester.ensureVisible(
          find.byKey(ValueKey<String>('$ThemeMode.light')).last,
        );
        await tester.pump();
        await tester.pump(const Duration(seconds: 1));

        when<dynamic>(() => mockedSettingsController.themeMode)
            .thenReturn(ThemeMode.light);
      }

      // Gist:
      testGoldens(
        'User Choses System Theme and Then System Theme Visible',
        (WidgetTester tester) async {
          await tester.runAsync<dynamic>(
            () async {
              await _givenSettingsScreenSystermTheme(tester);
              await _whenSystemTheme();
              await _thenDropDownValueIsSystemTheme(tester);
              await _whenUserTapsSystemTheme(tester);
              await _thenUserExpectsThemeMode();
            },
          );

          await multiScreenGolden(
            tester,
            'system_theme_choice',
          );
        },
      );

      testGoldens(
        'User Choses Dark Theme  and Then Its visible',
        (WidgetTester tester) async {
          await tester.runAsync<dynamic>(() async {
            await _givenSettingsScreenSystermTheme(tester);
            await _whenSystemTheme();
            await _thenDropDownValueIsSystemTheme(tester);
            await _whenUserTapsDarkTheme(tester);
            await _thenUserSeesDarkTheme(tester);

            // now we simulate the theme choice for the golden
          });

          await multiScreenGolden(
            tester,
            'dark_theme_choice',
          );
        },
      );

      testGoldens(
        'User Choses Light Theme  and Then Its visible',
        (WidgetTester tester) async {
          await tester.runAsync<dynamic>(() async {
            // I set up the simulated dark theme first, this
            // may be a wrong guess
            await _givenSettingsScreenSystermTheme(tester);
            await _whenSystemTheme();
            await _thenDropDownValueIsSystemTheme(tester);
            await _whenUserTapsLightTheme(tester);
            await _thenUserSeesLightTheme(tester);

            

            // now we simulate the theme choice for the golden
          });

          await multiScreenGolden(
            tester,
            'light_theme_choice',
          );
        },
      );
    },
  );
}
