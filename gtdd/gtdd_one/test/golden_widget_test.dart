// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.



import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:gtdd_one/src/app.dart';
import 'package:gtdd_one/src/presentation/features/settings/viewcontrollers/settings_controller.dart';
import 'package:gtdd_one/src/presentation/features/settings/ui/settings_view.dart';
import 'package:mocktail/mocktail.dart';

import 'golden_tools.dart';

class MockSettingsController extends Mock implements SettingsController {}



void main() {
  // our var for our mocked dep
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
  });

  // to tear down mocked dependencies
  // ignore: no-empty-block
  tearDownAll(() async {});

  // group all tests in this unit of the test suite together
  group('Basic Golden Tests ', () {

    // this test sets up the Flutter Golden test main.png visual test artifacts
    testWidgets('Golden test', (WidgetTester tester) async {
      // pump the root widget of the app
      await tester
          .pumpWidget(MyApp(settingsController: mockedSettingsController));
      // set up the main goldens visual file
      await expectLater(find.byType(MyApp), matchesGoldenFile('main.png'));
    });

    testGoldens('DeviceBuilder-Settings View ', (WidgetTester tester) async {
      // In a real app one would supply the other parameters to the 
      // app wrapper of the RootWidget as when it's blank 
      // everything resolves to a default.
      final builder = DeviceBuilder(wrap: myAppWrapper())
        ..overrideDevicesForAllScenarios(devices: [
          Device.phone,
          Device.iphone11,
          Device.tabletPortrait,
          Device.tabletLandscape,
          samsungEightAndroid,
          samsungNineAndroid,
          iphonetwelvepromaxIOS,
        ],)
        ..addScenario(
          widget: SettingsView(controller: mockedSettingsController,
            
          ),
          name: 'Settings View',
        );
      await tester.pumpDeviceBuilder(builder);
      await screenMatchesGolden(tester, "settings view page multiple screens");
    });


    
  });
}
