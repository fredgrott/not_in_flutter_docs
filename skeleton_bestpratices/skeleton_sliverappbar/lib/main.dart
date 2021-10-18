import 'package:flutter/material.dart';
import 'package:skeleton_sliverappbar/src/presentation/widgets/error_screen.dart';

import 'src/app.dart';
import 'src/presentation/features/settings/services/settings_service.dart';
import 'src/presentation/features/settings/viewcontrollers/settings_controller.dart';

Future<void> main() async {
  ErrorWidget.builder = (FlutterErrorDetails flutterErrorDetails) =>
      errorScreen(flutterErrorDetails.exception);

  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  final settingsController = SettingsController(SettingsService());

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await settingsController.loadSettings();

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  runApp(MyApp(settingsController: settingsController));
}
