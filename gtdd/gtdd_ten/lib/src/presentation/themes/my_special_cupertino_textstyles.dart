// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';

// Gist: PlatformText in CupertinoNavigationBar is not a Cupertino Widget and 
//       so we need to use a different way to set the colors by ThemeMode as we 
//       do not have the Cupertino Widget context that CupertinoDynamicColors works 
//       with to set the colors.

TextStyle myCupertinoNavigationBarTextStyle = TextStyle(
  color: cupertinoNavBarTextColor(),
  fontSize: 36,
  fontWeight: FontWeight.bold,
  fontFamily: GoogleFonts.notoSans().fontFamily,
);



Color cupertinoNavBarTextColor() {
  final brightness = SchedulerBinding.instance?.window.platformBrightness;
  final isDarkMode = brightness == Brightness.dark;
  if (isDarkMode) {
    return Colors.white;
  }

  return Colors.black;
}
