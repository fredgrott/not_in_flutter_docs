// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// ignore_for_file: cast_nullable_to_non_nullable

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:gtdd_seven/src/presentation/features/home/ui/sample_item_details_view.dart';
import 'package:gtdd_seven/src/presentation/features/home/ui/sample_item_list_view.dart';
import 'package:gtdd_seven/src/presentation/features/settings/ui/settings_view.dart';
import 'package:page_object/page_object.dart';

import 'golden_root_widget.dart';

// Should have as many getter as screens in the app.
// We always use the inserted Root Widget test fixture
// instead of the app's real root widget.
//
// see: Page Object Model(POM) article for a general description of
// it https://medium.com/tech-tajawal/page-object-model-pom-design-pattern-f9588630800b
class MyAppPageObject extends PageObject {
  SampleItemListViewPageObject get homeScreen =>
      SampleItemListViewPageObject(this);

  SampleItemDetailsViewPageObject get sampleDetailsScreen =>
      SampleItemDetailsViewPageObject(this);

  SettingsViewPageObject get settingsScreen => SettingsViewPageObject(this);
  // have to refer to using the top inserted root widget
  MyAppPageObject() : super(find.byType(MyAppRootWidget));
}

// The getter generally need to  find one or more specific
// widgets of the same widget type as we save the specificity to
// be fleshed out in our test expect matching declarations.
class SampleItemListViewPageObject extends PageObject {
  Finder get appbarTitle => find.descendant(
        of: this,
        matching: find.byKey(SampleItemListView.titleKey),
      );

  Finder get listView => find.descendant(
        of: this,
        matching: find.byKey(const Key('ListView')),
      );

  Finder get listTile => find.descendant(
        of: this,
        matching: find.byType(ListTile),
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
  Finder get appbarTitle => find.descendant(
        of: this,
        matching: find.byKey(SettingsView.titleKey),
      );

  // DropDown Button items are often dynamically created so we
  // need to use a use case of tap dropdown, then tap test object
  // wanted(item choice) so the sequence is find key on dropdownbutton
  // then find the text key of menu item.
  Finder get dropDownButton => find.descendant(
        of: this,
        matching: find.byKey(
          const Key('OurThemeMode'),
          skipOffstage: false,
        ),
      );

  // two will widgets have system value the index stack widget
  // and the menuitem one so we have to ask for the last one
  Finder get dropDownButtonSystem => find.descendant(
        of: this,
        matching: find.byKey(
          const Key('MySystem'),
          skipOffstage: false,
        ),
      );

  Finder get dropDownButtonLight => find.descendant(
        of: this,
        matching: find.byKey(
          const Key('MyLight'),
          skipOffstage: false,
        ),
      );

  Finder get dropDownButtonDark => find.descendant(
        of: this,
        matching: find.byKey(
          const Key('MyDark'),
          skipOffstage: false,
        ),
      );

  SettingsViewPageObject(Finder finder)
      : super(find.descendant(
          of: finder,
          matching: find.byType(SettingsView),
        ),);

  
}
