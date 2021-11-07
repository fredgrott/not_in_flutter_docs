// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// Cupertino Text Themes are not integrated with a
// typography class so we have to  include custom fonts via the
// Text Styles from the Text Theme.

import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gtdd_ten/src/presentation/themes/my_appcolors.dart';

// Gist: We wrap it in TextThemeData as that class dynamically adjusts colors 
//       according to the context of Cupertino Widgets.

CupertinoTextThemeData myCupertinoLightTextThemeData = CupertinoTextThemeData(
  textStyle: myDefaultTextStyle,
  actionTextStyle: myDefaultLightActionTextStyle,
  tabLabelTextStyle: myDefaultTabLabelTextStyle,
  navTitleTextStyle: myDeafaultMiddleTitleTextStyle,
  navLargeTitleTextStyle: myDefaultLargeTitleTextStyle,
  pickerTextStyle: myDefaultPickerTextStyle,
  dateTimePickerTextStyle: myDefaultDateTimePickerTextStyle,
  navActionTextStyle: myDefaultLightActionTextStyle,
);

CupertinoTextThemeData myCupertinoDarkTextThemeData = CupertinoTextThemeData(
  textStyle: myDefaultTextStyle,
  actionTextStyle: myDefaultDarkActionTextStyle,
  tabLabelTextStyle: myDefaultTabLabelTextStyle,
  navTitleTextStyle: myDeafaultMiddleTitleTextStyle,
  navLargeTitleTextStyle: myDefaultLargeTitleTextStyle,
  pickerTextStyle: myDefaultPickerTextStyle,
  dateTimePickerTextStyle: myDefaultDateTimePickerTextStyle,
  navActionTextStyle: myDefaultDarkActionTextStyle,
);

TextStyle myDefaultTextStyle = TextStyle(
  inherit: false,
  fontFamily: GoogleFonts.notoSerif().fontFamily,
  fontSize: 17,
  letterSpacing: -0.41,
  color: CupertinoColors.label,
  decoration: TextDecoration.none,
);

TextStyle myDefaultLightActionTextStyle = TextStyle(
  inherit: false,
  fontFamily: GoogleFonts.notoSerif().fontFamily,
  fontSize: 17,
  letterSpacing: -0.41,
  color: myLightPrimaryColor,
  decoration: TextDecoration.none,
);

TextStyle myDefaultDarkActionTextStyle = TextStyle(
  inherit: false,
  fontFamily: GoogleFonts.notoSerif().fontFamily,
  fontSize: 17,
  letterSpacing: -0.41,
  color: myDarkPrimaryColor,
  decoration: TextDecoration.none,
);

TextStyle myDefaultTabLabelTextStyle = TextStyle(
  inherit: false,
  fontFamily: GoogleFonts.notoSerif().fontFamily,
  fontSize: 10,
  letterSpacing: -0.24,
  color: CupertinoColors.inactiveGray,
);

TextStyle myDeafaultMiddleTitleTextStyle = TextStyle(
  inherit: false,
  fontFamily: GoogleFonts.notoSerif().fontFamily,
  fontSize: 17,
  fontWeight: FontWeight.w600,
  letterSpacing: -0.41,
  color: CupertinoColors.label,
);

TextStyle myDefaultLargeTitleTextStyle = TextStyle(
  inherit: false,
  fontFamily: GoogleFonts.notoSans().fontFamily,
  fontSize: 34.0,
  fontWeight: FontWeight.w700,
  letterSpacing: 0.41,
  color: CupertinoColors.label,
);

TextStyle myDefaultPickerTextStyle = TextStyle(
  inherit: false,
  fontFamily: GoogleFonts.notoSans().fontFamily,
  fontSize: 21,
  fontWeight: FontWeight.w400,
  letterSpacing: -0.6,
  color: CupertinoColors.label,
);

TextStyle myDefaultDateTimePickerTextStyle = TextStyle(
  inherit: false,
  fontFamily: GoogleFonts.notoSans().fontFamily,
  fontSize: 21,
  fontWeight: FontWeight.normal,
  color: CupertinoColors.label,
);
