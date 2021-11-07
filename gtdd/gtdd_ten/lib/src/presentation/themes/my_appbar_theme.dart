// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gtdd_ten/src/presentation/themes/my_actionsiconthemedata.dart';
import 'package:gtdd_ten/src/presentation/themes/my_appcolors.dart';
import 'package:gtdd_ten/src/presentation/themes/my_iconthemedata.dart';

// Gist: Cross-Platform wise the AppbarTheme only applies to the Material AppBar. 
//  One has to set individual properties of the CupertinoNavigationBar.

AppBarTheme myAppBarLightTheme = AppBarTheme(
  //brightness:
  backgroundColor: myLightPrimaryColor,
  shadowColor: myLightPrimaryVariantColor,
  
  centerTitle: true,
  titleSpacing: 1,
  iconTheme: myIconLightThemeData,
  actionsIconTheme: myActionsIconLightThemeData,
  titleTextStyle: myTitleTextStyle,
  toolbarTextStyle: myToolbarTextStyle,
);

AppBarTheme myAppBarDarkTheme = AppBarTheme(
  backgroundColor: myDarkPrimaryColor,
  shadowColor: myDarkPrimaryVariantColor,
  centerTitle: true,
  titleSpacing: 1,
  iconTheme: myIconDarkThemeData,
  actionsIconTheme: myActionsIconDarkThemeData,
  titleTextStyle: myTitleTextStyle,
  toolbarTextStyle: myToolbarTextStyle,
);

TextStyle myTitleTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontFamily: GoogleFonts.notoSans().fontFamily,
);

TextStyle myToolbarTextStyle = TextStyle(
  fontWeight: FontWeight.w600,
  fontFamily: GoogleFonts.notoSans().fontFamily,
);
