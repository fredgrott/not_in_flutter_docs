// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:gtdd_ten/src/presentation/features/settings/viewcontrollers/settings_controller.dart';

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

  const SettingsView({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: PlatformText(
          title,
          key: titleKey,
          style: platformThemeData(
            context,
            material: (data) => data.textTheme.headline5,
            cupertino: (data) => data.textTheme.navTitleTextStyle,
          ),
          
        ),
        material: (_, __,)  => MaterialAppBarData(

        ),
        cupertino: (_, __,) => CupertinoNavigationBarData(

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
              child: PlatformText(
                dropMenuSystemThemeTitle,
                key: const Key('MySystem'),
                style: platformThemeData(
                  context,
                  material: (data) => data.textTheme.headline5,
                  cupertino: (data) => data.textTheme.navTitleTextStyle,
                ),
              ),
            ),
            DropdownMenuItem(
              
              value: ThemeMode.light,
              child: PlatformText(
                dropMenuLightThemeTitle,
                key: const Key('MyLight'),
                style: platformThemeData(
                  context,
                  material: (data) => data.textTheme.headline5,
                  cupertino: (data) => data.textTheme.navTitleTextStyle,
                ),
              ),
            ),
            DropdownMenuItem(
              
              value: ThemeMode.dark,
              child: PlatformText(
                dropMenuDarkThemeTitle,
                key: const Key('MyDark'),
                style: platformThemeData(
                  context,
                  material: (data) => data.textTheme.headline5,
                  cupertino: (data) => data.textTheme.navTitleTextStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
