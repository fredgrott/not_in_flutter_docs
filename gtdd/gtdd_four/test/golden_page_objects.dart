// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// ignore_for_file: cast_nullable_to_non_nullable

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:gtdd_four/src/presentation/features/home/ui/sample_item_details_view.dart';
import 'package:gtdd_four/src/presentation/features/home/ui/sample_item_list_view.dart';
import 'package:gtdd_four/src/presentation/features/settings/ui/settings_view.dart';
import 'package:page_object/page_object.dart';

import 'golden_root_widget.dart';

// Should have as many getter as screens in the app.
// We always use the inserted Root Widget test fixture
// instead of the app's real root widget.
//
// see: Page Object Model(POM) article for a general description of
// it https://medium.com/tech-tajawal/page-object-model-pom-design-pattern-f9588630800b
class MyAppPageObject extends PageObject {
  // have to refer to using the top inserted root widget
  MyAppPageObject() : super(find.byType(MyAppRootWidget));

  SampleItemListViewPageObject get homeScreen =>
      SampleItemListViewPageObject(this);

  SampleItemDetailsViewPageObject get sampleDetailsScreen =>
      SampleItemDetailsViewPageObject(this);

  SettingsViewPageObject get settingsScreen => SettingsViewPageObject(this);
}

// The getter generally need to  find one or more specific
// widgets of the same widget type as we save the specificity to
// be fleshed out in our test expect matching declarations.
class SampleItemListViewPageObject extends PageObject {
  SampleItemListViewPageObject(Finder finder)
      : super(
          find.descendant(
            of: finder,
            matching: find.byType(SampleItemListView),
          ),
        );
  Finder get appbarTitle => find.descendant(
        of: this,
        matching: find.byKey(SampleItemListView.titleKey),
      );

  Finder get listTileTitle => find.descendant(
      of: this, matching: find.byKey(SampleItemListView.listTileTitleKey),);

  
}

class SampleItemDetailsViewPageObject extends PageObject {
  SampleItemDetailsViewPageObject(Finder finder)
      : super(
          find.descendant(
            of: finder,
            matching: find.byType(SampleItemDetailsView),
          ),
        );

  Finder get appbarTitle => find.descendant(
        of: this,
        matching: find.byKey(SampleItemDetailsView.titleKey),
      );

  Finder get textDetail => find.descendant(
        of: this,
        matching: find.byKey(
          SampleItemDetailsView.detailKey,
        ),
      );
}

class SettingsViewPageObject extends PageObject {
  SettingsViewPageObject(Finder finder)
      : super(find.descendant(of: finder, matching: find.byType(SettingsView)));

  Finder get appbarTitle =>
      find.descendant(of: this, matching: find.byKey(SettingsView.titleKey));

  Finder get dropButtonSystemTheme => find.descendant(
        of: this,
        matching: find.byKey(SettingsView.dropMenuSystemThemeTitleKey),
      );

  Finder get dropButtonLightTheme => find.descendant(
        of: this,
        matching: find.byKey(SettingsView.dropMenuLightThemeTitleKey),
      );

  Finder get dropButtonDarkTheme => find.descendant(
        of: this,
        matching: find.byKey(SettingsView.dropMenuDarkThemeTitleKey),
      );
}
