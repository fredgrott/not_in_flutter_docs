import 'package:flutter/material.dart';
import 'package:gtdd_three/src/domain/app_vars.dart';
import 'package:gtdd_three/src/my_app.dart';







Future<void> main() async {
  
  



  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await settingsController.loadSettings();

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  runApp(MyApp(settingsController: settingsController, ));
}
