// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:gtdd_thirteen/src/infrastructure/app_vars.dart';
import 'package:gtdd_thirteen/src/presentation/features/home/ui/sampleitem_detailsview.dart';
import 'package:gtdd_thirteen/src/presentation/features/home/ui/sampleitem_listview.dart';
import 'package:gtdd_thirteen/src/presentation/features/settings/ui/settingsview.dart';
import 'package:gtdd_thirteen/src/presentation/themes/cupertino_themedata.dart';
import 'package:gtdd_thirteen/src/presentation/themes/material_themedata.dart';

import 'golden_base_widgetwrapper.dart';

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

  group(
    'Golden Tests MultiScreen',
    () {
      Future<void> _givenSampleItemListViewScreenMaterialLigt(
        WidgetTester tester,
      ) async {
        await tester.pumpWidgetBuilder(
          const SampleItemListView(),
          wrapper: goldenBaseWidgetWrapper(
            platform: TargetPlatform.windows,
            theme: materialLightMaterialThemeData,
            darkTheme: materialDarkMaterialThemeData,
            // ignore: cast_nullable_to_non_nullable
            myThemeMode: settingsController.themeMode as ThemeMode,
            myCupertinoThemeData: cupertinoThemeData,
          ),
        );
      }

      Future<void> _givenSampleItemListViewSceenMaterialDark(
        WidgetTester tester,
      ) async {
        await tester.pumpWidgetBuilder(
          const SampleItemListView(),
          wrapper: goldenBaseWidgetWrapper(
            platform: TargetPlatform.windows,
            theme: materialLightMaterialThemeData,
            darkTheme: materialDarkMaterialThemeData,
            // ignore: cast_nullable_to_non_nullable
            myThemeMode: ThemeMode.dark,
            myCupertinoThemeData: cupertinoThemeData,
          ),
        );
      }

      Future<void> _givenSampleItemListViewScreenCupertinoLight(
        WidgetTester tester,
      ) async {
        await tester.pumpWidgetBuilder(
          const SampleItemListView(),
          wrapper: goldenBaseWidgetWrapper(
            platform: TargetPlatform.macOS,
            theme: materialLightMaterialThemeData,
            darkTheme: materialDarkMaterialThemeData,
            // ignore: cast_nullable_to_non_nullable
            myThemeMode: ThemeMode.light,
            myCupertinoThemeData: cupertinoThemeData,
          ),
        );
      }

      Future<void> _givenSampleItemListViewScreenCupertinoDark(
        WidgetTester tester,
      ) async {
        await tester.pumpWidgetBuilder(
          const SampleItemListView(),
          wrapper: goldenBaseWidgetWrapper(
            platform: TargetPlatform.macOS,
            theme: materialLightMaterialThemeData,
            darkTheme: materialDarkMaterialThemeData,
            // ignore: cast_nullable_to_non_nullable
            myThemeMode: ThemeMode.dark,
            myCupertinoThemeData: cupertinoThemeData,
          ),
        );
      }

      Future<void> _givenSampleItemDetailsViewScreenMaterialLight(
        WidgetTester tester,
      ) async {
        await tester.pumpWidgetBuilder(
          const SampleItemDetailsView(),
          wrapper: goldenBaseWidgetWrapper(
            platform: TargetPlatform.windows,
            theme: materialLightMaterialThemeData,
            darkTheme: materialDarkMaterialThemeData,
            // ignore: cast_nullable_to_non_nullable
            myThemeMode: ThemeMode.light,
            myCupertinoThemeData: cupertinoThemeData,
          ),
        );
      }

      Future<void> _givenSampleItemDetailsViewScreenCupertinoLight(
        WidgetTester tester,
      ) async {
        await tester.pumpWidgetBuilder(
          const SampleItemDetailsView(),
          wrapper: goldenBaseWidgetWrapper(
            platform: TargetPlatform.macOS,
            theme: materialLightMaterialThemeData,
            darkTheme: materialDarkMaterialThemeData,
            // ignore: cast_nullable_to_non_nullable
            myThemeMode: ThemeMode.light,
            myCupertinoThemeData: cupertinoThemeData,
          ),
        );
      }

      Future<void> _givenSampleItemDetailsViewMaterialDark(
        WidgetTester tester,
      ) async {
        await tester.pumpWidgetBuilder(
          const SampleItemDetailsView(),
          wrapper: goldenBaseWidgetWrapper(
            platform: TargetPlatform.windows,
            theme: materialLightMaterialThemeData,
            darkTheme: materialDarkMaterialThemeData,
            // ignore: cast_nullable_to_non_nullable
            myThemeMode: ThemeMode.dark,
            myCupertinoThemeData: cupertinoThemeData,
          ),
        );
      }

      Future<void> _givenSampleItemDetailsViewScreenCupertinoDark(
        WidgetTester tester,
      ) async {
        await tester.pumpWidgetBuilder(
          const SampleItemDetailsView(),
          wrapper: goldenBaseWidgetWrapper(
            platform: TargetPlatform.macOS,
            theme: materialLightMaterialThemeData,
            darkTheme: materialDarkMaterialThemeData,
            // ignore: cast_nullable_to_non_nullable
            myThemeMode: ThemeMode.dark,
            myCupertinoThemeData: cupertinoThemeData,
          ),
        );
      }

      Future<void> _givenSettingsViewScreenMaterialLight(
        WidgetTester tester,
      ) async {
        await tester.pumpWidgetBuilder(
          SettingsView(
            controller: settingsController,
          ),
          wrapper: goldenBaseWidgetWrapper(
            platform: TargetPlatform.windows,
            theme: materialLightMaterialThemeData,
            darkTheme: materialDarkMaterialThemeData,
            // ignore: cast_nullable_to_non_nullable
            myThemeMode: ThemeMode.light,
            myCupertinoThemeData: cupertinoThemeData,
          ),
        );
      }

      Future<void> _givenSettingsViewScreenCupertinoLight(
        WidgetTester tester,
      ) async {
        await tester.pumpWidgetBuilder(
          SettingsView(
            controller: settingsController,
          ),
          wrapper: goldenBaseWidgetWrapper(
            platform: TargetPlatform.macOS,
            theme: materialLightMaterialThemeData,
            darkTheme: materialDarkMaterialThemeData,
            // ignore: cast_nullable_to_non_nullable
            myThemeMode: ThemeMode.light,
            myCupertinoThemeData: cupertinoThemeData,
          ),
        );
      }

      Future<void> _givenSettingsViewScreenMaterialDark(
        WidgetTester tester,
      ) async {
        await tester.pumpWidgetBuilder(
          SettingsView(
            controller: settingsController,
          ),
          wrapper: goldenBaseWidgetWrapper(
            platform: TargetPlatform.windows,
            theme: materialLightMaterialThemeData,
            darkTheme: materialDarkMaterialThemeData,
            // ignore: cast_nullable_to_non_nullable
            myThemeMode: ThemeMode.dark,
            myCupertinoThemeData: cupertinoThemeData,
          ),
        );
      }

      Future<void> _givenSettingsViewScreenCupertinoDark(
        WidgetTester tester,
      ) async {
        await tester.pumpWidgetBuilder(
          SettingsView(
            controller: settingsController,
          ),
          wrapper: goldenBaseWidgetWrapper(
            platform: TargetPlatform.macOS,
            theme: materialLightMaterialThemeData,
            darkTheme: materialDarkMaterialThemeData,
            // ignore: cast_nullable_to_non_nullable
            myThemeMode: ThemeMode.dark,
            myCupertinoThemeData: cupertinoThemeData,
          ),
        );
      }

      testGoldens(
        'Home Screen - Responsive Material Light',
        (WidgetTester tester) async {
          await tester.runAsync<dynamic>(() async {
            await _givenSampleItemListViewScreenMaterialLigt(tester);
          });
          await multiScreenGolden(
            tester,
            'home_screen_responsive_material_light',
          );
        },
      );

      testGoldens(
        'Home Screen - Responsive Cupertino Light',
        (WidgetTester tester) async {
          await tester.runAsync<dynamic>(() async {
            await _givenSampleItemListViewScreenCupertinoLight(tester);
          });
          await multiScreenGolden(
            tester,
            'home_screen_responsive_cupertino_light',
          );
        },
      );

      testGoldens(
        'Home Screen - Responsive Material Dark',
        (WidgetTester tester) async {
          await tester.runAsync<dynamic>(() async {
            await _givenSampleItemListViewSceenMaterialDark(tester);
          });
          await multiScreenGolden(
            tester,
            'home_screen_responsive_material_dark',
          );
        },
      );

      testGoldens(
        'Home Screen - Responsive Cupertino Dark',
        (WidgetTester tester) async {
          await tester.runAsync<dynamic>(() async {
            await _givenSampleItemListViewScreenCupertinoDark(tester);
          });
          await multiScreenGolden(
            tester,
            'home_screen_responsive_cupertino_dark',
          );
        },
      );

      testGoldens(
        'Detail Screen- Responsive Material Light',
        (WidgetTester tester) async {
          await tester.runAsync<dynamic>(() async {
            await _givenSampleItemDetailsViewScreenMaterialLight(tester);
          });
          await multiScreenGolden(
            tester,
            'detail_screen_responsive_material_light',
          );
        },
      );

      testGoldens(
        'Detail Screen- Responsive Cupertino Light',
        (WidgetTester tester) async {
          await tester.runAsync<dynamic>(() async {
            await _givenSampleItemDetailsViewScreenCupertinoLight(tester);
          });
          await multiScreenGolden(
            tester,
            'detail_screen_responsive_cupertino_light',
          );
        },
      );

      testGoldens(
        'Detail Screen- Responsive Material Dark',
        (WidgetTester tester) async {
          await tester.runAsync<dynamic>(() async {
            await _givenSampleItemDetailsViewMaterialDark(tester);
          });
          await multiScreenGolden(
            tester,
            'detail_screen_responsive_material_dark',
          );
        },
      );

      testGoldens(
        'Detail Screen- Responsive Cupertino Dark',
        (WidgetTester tester) async {
          await tester.runAsync<dynamic>(() async {
            await _givenSampleItemDetailsViewScreenCupertinoDark(tester);
          });
          await multiScreenGolden(
            tester,
            'detail_screen_responsive_cupertino_dark',
          );
        },
      );

      testGoldens(
        'Settings Screen - Responsive Material Light',
        (WidgetTester tester) async {
          await tester.runAsync<dynamic>(() async {
            await _givenSettingsViewScreenMaterialLight(tester);
          });
          await multiScreenGolden(
            tester,
            'settings_screen_responsive_material_light',
          );
        },
      );

      testGoldens(
        'Settings Screen - Responsive Cupertino Light',
        (WidgetTester tester) async {
          await tester.runAsync<dynamic>(() async {
            await _givenSettingsViewScreenCupertinoLight(tester);
          });
          await multiScreenGolden(
            tester,
            'settings_screen_responsive_cupertino_light',
          );
        },
      );

      testGoldens(
        'Settings Screen - Responsive Material Dark',
        (WidgetTester tester) async {
          await tester.runAsync<dynamic>(() async {
            await _givenSettingsViewScreenMaterialDark(tester);
          });
          await multiScreenGolden(
            tester,
            'settings_screen_responsive_material_dark',
          );
        },
      );

      testGoldens(
        'Settings Screen - Responsive Cupertino Dark',
        (WidgetTester tester) async {
          await tester.runAsync<dynamic>(() async {
            await _givenSettingsViewScreenCupertinoDark(tester);
          });
          await multiScreenGolden(
            tester,
            'settings_screen_responsive_cupertino_dark',
          );
        },
      );
    },
  );
}
