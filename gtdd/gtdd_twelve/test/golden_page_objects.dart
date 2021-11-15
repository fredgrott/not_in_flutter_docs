// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// ignore_for_file: cast_nullable_to_non_nullable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:gtdd_twelve/src/presentation/features/home/ui/sampleitem_detailsview.dart';
import 'package:gtdd_twelve/src/presentation/features/home/ui/sampleitem_listview.dart';
import 'package:gtdd_twelve/src/presentation/features/settings/ui/settingsview.dart';

import 'package:page_object/page_object.dart';

import 'golden_base_widget.dart';

// Gist: To implement a Page Object Model in testing when a cross-platofrm
//       package such as flutter Platform Widgets is used we need to grab
//       something unique in the dynamic component for the finder.
//
//       For example, with FPW material appbar is delivered to material targets
//       and cupertino navigationbar is delivered to cupertino targets. Thus, the
//       unique finder would be the Text widget with data of the actual title would
//       be the right unique finder to use.

class MyAppPageObject extends PageObject {
  SampleItemListViewPageObject get homeScreen =>
      SampleItemListViewPageObject(this);

  SampleItemDetailsViewPageObject get sampleDetailsScreen =>
      SampleItemDetailsViewPageObject(this);

  SettingsViewPageObject get settingsScreen => SettingsViewPageObject(this);
  // have to refer to using the top inserted root widget
  MyAppPageObject() : super(find.byType(GoldenBaseWidget));
}

// The getter generally need to  find one or more specific
// widgets of the same widget type as we save the specificity to
// be fleshed out in our test expect matching declarations.
class SampleItemListViewPageObject extends PageObject {
  // Gist: In  cross-platform since we are using Flutter Platform Widgets
  //       package to dynamically deliver the right material or cupertino
  //       widget using platform widgets we have to find a way to
  //       find either the child material or cupertino widget or the
  //       parent platform widget of FPW.
  //

  // Given Finder of SampleitemlistView screen matches appBarKey to find
  // the descendant in the screen of Appbar
  Finder get appBar => find.descendant(
        of: this,
        matching: find.byWidget(PlatformAppBar()),
      );

  Finder get navButtonSettings => find.descendant(
        of: this,
        matching: find.byKey(const Key('NavButtonToSettingsKey')),
      );

  // Finds a listView with the key of ListView
  Finder get listView => find.descendant(
        of: this,
        matching: find.byKey(const Key("ListViewKey")),
      );

  // This will find many list tiles and should have findManyWidgets matcher
  Finder get listTile => find.descendant(
        of: this,
        matching: find.byKey(const Key('SampleItemListViewTitleKey')),
      );

  Finder get listTileOne => find.descendant(
        of: listTile,
        matching: find.byKey(const ValueKey(1)),
      );

  Finder get listTileTwo => find.descendant(
        of: listTile,
        matching: find.byKey(const ValueKey(2)),
      );

  Finder get listTileThree => find.descendant(
        of: listTile,
        matching: find.byKey(const ValueKey(3)),
      );

  SampleItemListViewPageObject(Finder finder)
      : super(
          find.descendant(
            of: finder,
            matching: find.byType(SampleItemListView),
          ),
        );
}

class SampleItemDetailsViewPageObject extends PageObject {
  // Gist: AppBar is delivered dynamically so let's grab the widgetKey that
  //       the PlatformAppBar will pass on to the Material Appbar or the
  //       CupertinoNavigationbar.
  Finder get appBar => find.descendant(
        of: this,
        matching: find.byWidget(PlatformAppBar()),
      );

  Finder get navButtonHome => find.descendant(
        of: this,
        matching: find.byKey(const Key('NavButtonToHomeKey')),
      );

  Finder get textDetail => find.descendant(
        of: this,
        matching: find.byKey(const Key('DetailKey')),
      );

  SampleItemDetailsViewPageObject(Finder finder)
      : super(
          find.descendant(
            of: finder,
            matching: find.byType(SampleItemDetailsView),
          ),
        );
}

// Note: DropDownButtons are different as we have two different stacks.
//       An Index Stack for the button itself and a normal stack for the list
//       of items. Somehow when assigning Keys and text to a menu item it
//       also gets associated with the DropDownButton itself. So my
//       findByKey finder as DropDownButton has to have an
//       equals('text value') applied as matcher as in this stackoverflow
//       answer: https://stackoverflow.com/questions/64490039/flutter-widget-test-does-not-trigger-dropdownbutton-onchanged-when-selecting-ano
//
//       To put it another way. Before any user interaction the Key of Parent is OurThemeMode and the
//       value is controller.themeMode and thus one could have a finder.byKey() a DropdownButton.value
//       and have as a matcher  equals(''system) as the first time it would be system as
//       no user interaction has occurred.

class SettingsViewPageObject extends PageObject {
  // Gist: AppBar is delivered dynamically so let's grab the widgetKey that
  //       the PlatformAppBar will pass on to the Material Appbar or the
  //       CupertinoNavigationbar.
  Finder get appBar => find.descendant(
        of: this,
        matching: find.byWidget(PlatformAppBar()),
      );

  Finder get navButtonHome => find.descendant(
        of: this,
        matching: find.byKey(const Key('NavButtonToHome')),
      );

  Finder get appbarTitle => find.descendant(
        of: this,
        matching: find.byKey(const Key('SettingsViewTitleKey')),
      );

  // Using find.byWidgetPredicate to find DropdownButton Parent with unique key
  Finder get dropDownButton => find.descendant(
        of: this,
        matching: find.byKey(const Key('OurThemeModeDropDownMenuKey')),
      );

  // two will widgets have system value the index stack widget
  // and the menuitem one so we have to ask for the last one
  Finder get dropDownButtonSystem => find.descendant(
        of: this,
        matching: find
            .byKey(
              ValueKey<String>('$ThemeMode.system'),
              skipOffstage: false,
            )
            .last,
      );

  Finder get dropDownButtonLight => find.descendant(
        of: this,
        matching: find
            .byKey(
              ValueKey<String>('$ThemeMode.light'),
              skipOffstage: false,
            )
            .last,
      );

  Finder get dropDownButtonDark => find.descendant(
        of: this,
        matching: find
            .byKey(
              ValueKey<String>('$ThemeMode.dark'),
              skipOffstage: false,
            )
            .last,
      );

  SettingsViewPageObject(Finder finder)
      : super(
          find.descendant(
            of: finder,
            matching: find.byType(SettingsView),
          ),
        );
}
