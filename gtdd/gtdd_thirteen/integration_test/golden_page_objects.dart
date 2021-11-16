// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:gtdd_thirteen/src/my_app.dart';
import 'package:gtdd_thirteen/src/presentation/features/home/ui/sampleitem_detailsview.dart';
import 'package:gtdd_thirteen/src/presentation/features/home/ui/sampleitem_listview.dart';
import 'package:gtdd_thirteen/src/presentation/features/settings/ui/settingsview.dart';
import 'package:page_object/page_object.dart';

class IntegrationMyAppPageObject extends PageObject {
  IntegrationSampleItemListViewPageObject get homeScreen =>
      IntegrationSampleItemListViewPageObject(this);

  IntegrationSampleItemDetailsViewPageObject get sampleDetailsScreen =>
      IntegrationSampleItemDetailsViewPageObject(this);

  IntegrationSettingsViewPageObject get settingsScreen => IntegrationSettingsViewPageObject(this);

  IntegrationMyAppPageObject() : super(find.byType(MyApp));
}

class IntegrationSampleItemListViewPageObject extends PageObject {
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

  IntegrationSampleItemListViewPageObject(Finder finder)
      : super(
          find.descendant(
            of: finder,
            matching: find.byType(SampleItemListView),
          ),
        );
}

class IntegrationSampleItemDetailsViewPageObject extends PageObject {
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

  IntegrationSampleItemDetailsViewPageObject(Finder finder)
      : super(
          find.descendant(
            of: finder,
            matching: find.byType(SampleItemDetailsView),
          ),
        );
}

class IntegrationSettingsViewPageObject extends PageObject {
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

  IntegrationSettingsViewPageObject(Finder finder)
      : super(
          find.descendant(
            of: finder,
            matching: find.byType(SettingsView),
          ),
        );
}
