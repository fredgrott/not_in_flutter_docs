// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:gtdd_eleven/src/infrastructure/app_vars.dart';
import 'package:gtdd_eleven/src/presentation/features/settings/ui/settingsview.dart';
import 'package:gtdd_eleven/src/presentation/features/settings/viewcontrollers/settings_controller.dart';
import 'package:gtdd_eleven/src/presentation/themes/material_themedata.dart';


import 'package:mocktail/mocktail.dart';


import 'golden_base_rootwidgetwrapper.dart';
import 'golden_page_objects.dart';

class MockSettingsController extends Mock implements SettingsController {}

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
      // Gist:
      testGoldens(
        'User Choses System Theme and Then System Theme Visible',
        (WidgetTester tester) async {
          await tester.runAsync<dynamic>(
            () async {
              await tester.pumpWidgetBuilder(
                SettingsView(controller: settingsController),
                wrapper: goldenBaseFullFWPRootWidgetWrapper(
                  theme: materialLightMaterialThemeData,
                  darkTheme: materialDarkMaterialThemeData,
                  // ignore: cast_nullable_to_non_nullable
                  myThemeMode: settingsController.themeMode as ThemeMode,
                  
                  
                ),
              );

              final app = MyAppPageObject();
              expect(
                app.settingsScreen.appBar,
                findsOneWidget,
              );

              // stub the mock so we have a mocked response to use as macther
              when<dynamic>(()=> mockedSettingsController.themeMode).thenReturn(ThemeMode.system);

              // This is the way to grab anything that is dynamically generated list that will
              // have two indexes such as a dropdown menu
              expect(
                (tester.widget(find.byKey(const Key("OurThemeMode")))
                        as DropdownButton)
                    .value,
                equals(mockedSettingsController.themeMode),
              );
              await tester.ensureVisible(find.byKey(ValueKey<String>(ThemeMode.system.toString())));
              // Need to call pump twice; once to complete the action and once to complete
              // the animation.
              await tester.pump();
              await tester.pump(const Duration(seconds: 1));

              // after opening the menu we have two widgets with text 'Greater'
              // one in index stack of the dropdown button and one in the menu .
              // apparently the last one is from the menu.
              await tester.ensureVisible(find.byKey(ValueKey<String>(ThemeMode.system.toString())).last);
              await tester.pump();
              await tester.pump(const Duration(seconds: 1));

              
              

              //we use the mocked as the matcher, we do not need to stub the
              // mock first as we are using the matcher to verify a call as
              // the expect will match if the call is verifiable.
              expect(
                ThemeMode.system,
                mockedSettingsController.themeMode,
              );

              
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
            // I set up the simulated dark theme first, this
            // may be a wrong guess
            await tester.pumpWidgetBuilder(
              SettingsView(controller: settingsController),
              wrapper: goldenBaseFullFWPRootWidgetWrapper(
                theme: materialLightMaterialThemeData,
                darkTheme: materialDarkMaterialThemeData,
                // ignore: cast_nullable_to_non_nullable
                myThemeMode: settingsController.themeMode as ThemeMode,
                
                
              ),
            );

            final app = MyAppPageObject();
            expect(
              app.settingsScreen.appBar,
              findsOneWidget,
            );

             // stub the mock so we have a mocked response to use as macther
            when<dynamic>(() => mockedSettingsController.themeMode)
                .thenReturn(ThemeMode.system);

            // This is the way to grab anything that is dynamically generated list that will
            // have two indexes such as a dropdown menu
            expect(
              (tester.widget(find.byKey(const Key("OurThemeMode")))
                      as DropdownButton)
                  .value,
              equals(mockedSettingsController.themeMode),
            );
            await tester.ensureVisible(find.byKey(ValueKey<String>(ThemeMode.dark.toString())));
            // Need to call pump twice; once to complete the action and once to complete
            // the animation.
            await tester.pump();
            await tester.pump(const Duration(seconds: 1));

            // after opening the menu we have two widgets with text 'Greater'
            // one in index stack of the dropdown button and one in the menu .
            // apparently the last one is from the menu.
            await tester.ensureVisible(find.byKey(ValueKey<String>(ThemeMode.dark.toString())).last);
            await tester.pump();
            await tester.pump(const Duration(seconds: 1));

             // stub the mock so we have a mocked response to use as macther
            when<dynamic>(() => mockedSettingsController.themeMode)
                .thenReturn(ThemeMode.dark);

            

            //we use the mocked as the matcher, we do not need to stub the
            // mock first as we are using the matcher to verify a call as
            // the expect will match if the call is verifiable.
            expect(
              ThemeMode.dark,
              mockedSettingsController.themeMode,
            );

            

            // now we simulate the theme choice for the golden
          });

          await multiScreenGolden(tester, 'dark_theme_choice',);
        },
      );


      testGoldens(
        'User Choses Light Theme  and Then Its visible',
        (WidgetTester tester) async {
          await tester.runAsync<dynamic>(() async {
            // I set up the simulated dark theme first, this
            // may be a wrong guess
            await tester.pumpWidgetBuilder(
              SettingsView(controller: settingsController),
              wrapper: goldenBaseFullFWPRootWidgetWrapper(
                theme: materialLightMaterialThemeData,
                darkTheme: materialDarkMaterialThemeData,
                // ignore: cast_nullable_to_non_nullable
                myThemeMode: settingsController.themeMode as ThemeMode,
                
                
              ),
            );

            final app = MyAppPageObject();
            expect(
              app.settingsScreen.appBar,
              findsOneWidget,
            );

             // stub the mock so we have a mocked response to use as macther
            when<dynamic>(() => mockedSettingsController.themeMode)
                .thenReturn(ThemeMode.system);

            // This is the way to grab anything that is dynamically generated list that will
            // have two indexes such as a dropdown menu
            expect(
              (tester.widget(find.byKey(const Key("OurThemeMode")))
                      as DropdownButton)
                  .value,
              equals(mockedSettingsController.themeMode),
            );

            await tester.ensureVisible(find.byKey(ValueKey<String>(ThemeMode.light.toString())));
            // Need to call pump twice; once to complete the action and once to complete
            // the animation.
            await tester.pump();
            await tester.pump(const Duration(seconds: 1));

            // after opening the menu we have two widgets with text 'Greater'
            // one in index stack of the dropdown button and one in the menu .
            // apparently the last one is from the menu.
            await tester.ensureVisible(find.byKey(ValueKey<String>(ThemeMode.light.toString())).last);
            await tester.pump();
            await tester.pump(const Duration(seconds: 1));

             // stub the mock so we have a mocked response to use as macther
            when<dynamic>(() => mockedSettingsController.themeMode)
                .thenReturn(ThemeMode.light);

            
            //we use the mocked as the matcher, we do not need to stub the
            // mock first as we are using the matcher to verify a call as
            // the expect will match if the call is verifiable.
            expect(
              ThemeMode.light,
              mockedSettingsController.themeMode,
            );

            

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
