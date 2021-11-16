// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gtdd_thirteen/src/presentation/themes/material_actionsiconthemedata.dart';
import 'package:gtdd_thirteen/src/presentation/themes/material_colors.dart';
import 'package:gtdd_thirteen/src/presentation/themes/material_iconthemedata.dart';


AppBarTheme materialLightAppBarTheme = AppBarTheme(
  //brightness:
  backgroundColor: materialLightPrimaryColor,
  shadowColor: materialLightPrimaryVariantColor,

  centerTitle: true,
  titleSpacing: 1,
  iconTheme: materialLightIconThemeData,
  actionsIconTheme: materialLightActionsIconThemeData,
  titleTextStyle: materialAppBarTitleTextStyle,
  toolbarTextStyle: materialAppBarToolbarTextStyle,
);

AppBarTheme materialDarkAppBarTheme = AppBarTheme(
  backgroundColor: materialDarkPrimaryColor,
  shadowColor: materialDarkPrimaryVariantColor,
  centerTitle: true,
  titleSpacing: 1,
  iconTheme: materialDarkIconThemeData,
  actionsIconTheme: materialDarkActionsIconThemeData,
  titleTextStyle: materialAppBarTitleTextStyle,
  toolbarTextStyle: materialAppBarToolbarTextStyle,
);

TextStyle materialAppBarTitleTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontFamily: GoogleFonts.notoSans().fontFamily,
);

TextStyle materialAppBarToolbarTextStyle = TextStyle(
  fontWeight: FontWeight.w600,
  fontFamily: GoogleFonts.notoSans().fontFamily,
);
