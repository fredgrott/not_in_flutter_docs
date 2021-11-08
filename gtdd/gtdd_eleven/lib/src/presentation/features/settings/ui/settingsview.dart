// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:gtdd_eleven/src/presentation/features/home/ui/sampleitem_listview.dart';
import 'package:gtdd_eleven/src/presentation/features/settings/viewcontrollers/settings_controller.dart';
import 'package:gtdd_eleven/src/presentation/themes/my_cupertinocolors.dart';
import 'package:gtdd_eleven/src/presentation/themes/my_special_cupertino_textstyles.dart';

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
    // PlatformScaffold of Flutter Platform Widgets serves up a Material
    // based scaffold for material targets and a Cupertino based scaffold for
    // cupertino targets. Source is at:
    // https://github.com/stryder-dev/flutter_platform_widgets/blob/master/lib/src/platform_scaffold.dart
    //
    // In adaptive nav strategies one could use the material and cupertino builders and
    // PlatformWidget builder to do some customization per platform targets.
    return PlatformScaffold(
      // Delivers MaterialAppBar to material targets and CupertinoNavigationBar to
      // cupertino targets. Source is at:
      // https://github.com/stryder-dev/flutter_platform_widgets/blob/master/lib/src/platform_app_bar.dart
      //
      appBar: PlatformAppBar(
        // Gist: To grab(find) during testing we have to set the widgetketys of each
        //       platform widget as it passes that widgetkety value onto the dynamically
        //       delivered Material or Cupertino widget
        widgetKey: const Key("SettingsAppBar"),
        // PlatformIconButton
        // https://github.com/stryder-dev/flutter_platform_widgets/blob/master/lib/src/platform_icon_button.dart
        leading: PlatformIconButton(
          onPressed: () {
            Navigator.restorablePushNamed(
              context,
              // platformPageRoute
              // https://github.com/stryder-dev/flutter_platform_widgets/blob/master/lib/src/platform_page_route.dart
              platformPageRoute<dynamic>(
                settings: SampleItemListView.routeName as RouteSettings,
                context: context,
              ) as String,
            );
          },
          // PlatformIcons
          // https://github.com/stryder-dev/flutter_platform_widgets/blob/master/lib/src/platform_icons.dart
          icon: Icon(PlatformIcons(context).back),
          padding: const EdgeInsets.all(1),
          material: (
            _,
            __,
          ) =>
              MaterialIconButtonData(
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          cupertino: (
            _,
            __,
          ) =>
              CupertinoIconButtonData(
            pressedOpacity: 0.1,
          ),
        ),
        title: PlatformText(
          title,
          key: titleKey,
        ),
        material: (
          _,
          __,
        ) =>
            MaterialAppBarData(
          centerTitle: true,
        ),
        cupertino: (
          _,
          __,
        ) =>
            CupertinoNavigationBarData(
          // have to set things as we have no appbar theme or themedata for cupertinonavigationbar
          // PlatformText of FPW source at:
          // https://github.com/stryder-dev/flutter_platform_widgets/blob/master/lib/src/platform_text.dart
          title: PlatformText(
            title,
            style: myCupertinoNavigationBarTextStyle,
            key: titleKey,
          ),
          backgroundColor: myCupertinoNavigationBarLightBackgroundColor,
          previousPageTitle: "Sample Items",
          brightness: Brightness.light,
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
              key: ValueKey<String>(ThemeMode.system.toString()),
              value: ThemeMode.system,
              child: PlatformText(
                dropMenuSystemThemeTitle,
              ),
            ),
            DropdownMenuItem(
              key: ValueKey<String>(ThemeMode.light.toString()),
              value: ThemeMode.light,
              child: PlatformText(
                dropMenuLightThemeTitle,
              ),
            ),
            DropdownMenuItem(
              key: ValueKey<String>(ThemeMode.dark.toString()),
              value: ThemeMode.dark,
              child: PlatformText(
                dropMenuDarkThemeTitle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
