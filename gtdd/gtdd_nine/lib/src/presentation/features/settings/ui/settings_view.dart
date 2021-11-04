import 'package:flutter/material.dart';

import '../viewcontrollers/settings_controller.dart';

/// Displays the various settings that can be customized by the user.
///
/// When a user changes a setting, the SettingsController is updated and
/// Widgets that listen to the SettingsController are rebuilt.
class SettingsView extends StatelessWidget {
  static const routeName = '/settings';

  final SettingsController controller;

  static String title = 'Settings';

  static Key titleKey = const Key('SettingsView.title');

  static String dropMenuSystemThemeTitle = 'System Theme';

  static Key dropMenuSystemThemeTitleKey =
      const Key('SettingsView.dropMenuSystemThemeTitle');

  static String dropMenuLightThemeTitle = 'Light Theme';

  static Key dropMenuLightThemeTitleKey =
      const Key('SettingsView.dropMenuLightThemeTitle');

  static String dropMenuDarkThemeTitle = 'Dark Theme';

  static Key dropMenuDarkThemeTitleKey =
      const Key('SettingsView.dropMenuDarkThemeTitle');


  const SettingsView({Key? key, required this.controller,}) : super(key: key);

  
      

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          key: titleKey,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        // Glue the SettingsController to the theme selection DropdownButton.
        //
        // When a user selects a theme from the dropdown list, the
        // SettingsController is updated, which rebuilds the MaterialApp.
        //
        // all stackoverflow answers have this wrong.
        // its not keys that become the same but values where
        // the parent assumes value of child when an item choice is
        // made by the user.
        child: DropdownButton<ThemeMode>(
          key: const Key('OurThemeMode'),
          // Read the selected themeMode from the controller
          value: controller.themeMode,
          // Call the updateThemeMode method any time the user selects a theme.
          onChanged: controller.updateThemeMode,
          items: [
            DropdownMenuItem(
              
              value: ThemeMode.system,
              child: Text(
                dropMenuSystemThemeTitle,
                key: const Key('MySystem'),
              ),
            ),
            DropdownMenuItem(
              
              value: ThemeMode.light,
              child: Text(
                dropMenuLightThemeTitle,
                key: const Key('MyLight'),
              ),
            ),
            DropdownMenuItem(
              
              value: ThemeMode.dark,
              child: Text(
                dropMenuDarkThemeTitle,
                key: const Key('MyDark'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
