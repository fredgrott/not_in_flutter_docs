// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

// I have to provide these custom themes for color and
// geometry properties to inherited properly with
// using custom themes:
//    black
//    white
//    english like
//    dense
//    tall
//
//  according to class doc here:
// https://github.com/flutter/flutter/blob/master/packages/flutter/lib/src/material/typography.dart
//
// if platform is not set then, it will auto assign
// my defined custom typography themes via the return at line
//  187 after the case statements detecting platforms.
//
//
Typography myTypography = Typography(
  black: myBlackTextTheme,
  white: myWhiteTextTheme,
  englishLike: myEnglishLikeTextTheme,
  dense: myDenseTextTheme,
  tall: myTallTextTheme,
);

TextTheme myBlackTextTheme = TextTheme(
  // ignore: avoid_redundant_argument_values
  headline1: TextStyle(
    debugLabel: 'myBlackTextTheme headline1',
    fontFamily: GoogleFonts.notoSans().fontFamily,
    // ignore: avoid_redundant_argument_values
    inherit: true,
    color: Colors.black54,
    decoration: TextDecoration.none,
  ),
  // ignore: avoid_redundant_argument_values
  headline2: TextStyle(
    debugLabel: 'myBlackTextTheme headline2',
    fontFamily: GoogleFonts.notoSans().fontFamily,
    // ignore: avoid_redundant_argument_values
    inherit: true,
    color: Colors.black54,
    decoration: TextDecoration.none,
  ),
  // ignore: avoid_redundant_argument_values
  headline3: TextStyle(
    debugLabel: 'myBlackTextTheme headline3',
    fontFamily: GoogleFonts.notoSans().fontFamily,
    // ignore: avoid_redundant_argument_values
    inherit: true,
    color: Colors.black54,
    decoration: TextDecoration.none,
  ),
  // ignore: avoid_redundant_argument_values
  headline4: TextStyle(
    debugLabel: 'myBlackTextTheme headline4',
    fontFamily: GoogleFonts.notoSans().fontFamily,
    // ignore: avoid_redundant_argument_values
    inherit: true,
    color: Colors.black54,
    decoration: TextDecoration.none,
  ),
  // ignore: avoid_redundant_argument_values
  headline5: TextStyle(
    debugLabel: 'myBlackTextTheme headline5',
    fontFamily: GoogleFonts.notoSans().fontFamily,
    // ignore: avoid_redundant_argument_values
    inherit: true,
    color: Colors.black87,
    decoration: TextDecoration.none,
  ),
  // ignore: avoid_redundant_argument_values
  headline6: TextStyle(
    debugLabel: 'myBlackTextTheme headline6',
    fontFamily: GoogleFonts.notoSans().fontFamily,
    // ignore: avoid_redundant_argument_values
    inherit: true,
    color: Colors.black87,
    decoration: TextDecoration.none,
  ),
  // ignore: avoid_redundant_argument_values
  bodyText1: TextStyle(
    debugLabel: 'myBlackTextTheme bodyText1',
    fontFamily: GoogleFonts.notoSerif().fontFamily,
    // ignore: avoid_redundant_argument_values
    inherit: true,
    color: Colors.black87,
    decoration: TextDecoration.none,
  ),
  // ignore: avoid_redundant_argument_values
  bodyText2: TextStyle(
    debugLabel: 'myBlackTextTheme bodyText2',
    fontFamily: GoogleFonts.notoSerif().fontFamily,
    // ignore: avoid_redundant_argument_values
    inherit: true,
    color: Colors.black87,
    decoration: TextDecoration.none,
  ),
  // ignore: avoid_redundant_argument_values
  subtitle1: TextStyle(
    debugLabel: 'myBlackTextTheme subtitle1',
    fontFamily: GoogleFonts.notoSerif().fontFamily,
    // ignore: avoid_redundant_argument_values
    inherit: true,
    color: Colors.black87,
    decoration: TextDecoration.none,
  ),
  // ignore: avoid_redundant_argument_values
  subtitle2: TextStyle(
    debugLabel: 'myBlackTextTheme subtitle2',
    fontFamily: GoogleFonts.notoSerif().fontFamily,
    // ignore: avoid_redundant_argument_values
    inherit: true,
    color: Colors.black,
    decoration: TextDecoration.none,
  ),
  // ignore: avoid_redundant_argument_values
  caption: TextStyle(
    debugLabel: 'myBlackTextTheme caption',
    fontFamily: GoogleFonts.notoSerif().fontFamily,
    // ignore: avoid_redundant_argument_values
    inherit: true,
    color: Colors.black54,
    decoration: TextDecoration.none,
  ),
  // ignore: avoid_redundant_argument_values
  button: TextStyle(
    debugLabel: 'myBlackTextTheme button',
    fontFamily: GoogleFonts.notoSerif().fontFamily,
    // ignore: avoid_redundant_argument_values
    inherit: true,
    color: Colors.black87,
    decoration: TextDecoration.none,
  ),
  // ignore: avoid_redundant_argument_values
  overline: TextStyle(
    debugLabel: 'myBlackTextTheme overline',
    fontFamily: GoogleFonts.notoSerif().fontFamily,
    // ignore: avoid_redundant_argument_values
    inherit: true,
    color: Colors.black,
    decoration: TextDecoration.none,
  ),
);

TextTheme myWhiteTextTheme = TextTheme(
  // ignore: avoid_redundant_argument_values
  headline1: TextStyle(
    debugLabel: 'myWhiteTextTheme headline1',
    fontFamily: GoogleFonts.notoSans().fontFamily,
    // ignore: avoid_redundant_argument_values
    inherit: true,
    color: Colors.white70,
    decoration: TextDecoration.none,
  ),
  // ignore: avoid_redundant_argument_values
  headline2: TextStyle(
    debugLabel: 'myWhiteTextTheme headline2',
    fontFamily: GoogleFonts.notoSans().fontFamily,
    // ignore: avoid_redundant_argument_values
    inherit: true,
    color: Colors.white70,
    decoration: TextDecoration.none,
  ),
  // ignore: avoid_redundant_argument_values
  headline3: TextStyle(
    debugLabel: 'myWhiteTextTheme headline3',
    fontFamily: GoogleFonts.notoSans().fontFamily,
    // ignore: avoid_redundant_argument_values
    inherit: true,
    color: Colors.white70,
    decoration: TextDecoration.none,
  ),
  // ignore: avoid_redundant_argument_values
  headline4: TextStyle(
    debugLabel: 'myWhiteTextTheme headline4',
    fontFamily: GoogleFonts.notoSans().fontFamily,
    // ignore: avoid_redundant_argument_values
    inherit: true,
    color: Colors.white70,
    decoration: TextDecoration.none,
  ),
  // ignore: avoid_redundant_argument_values
  headline5: TextStyle(
    debugLabel: 'myWhiteTextTheme headline5',
    fontFamily: GoogleFonts.notoSans().fontFamily,
    // ignore: avoid_redundant_argument_values
    inherit: true,
    color: Colors.white,
    decoration: TextDecoration.none,
  ),
  // ignore: avoid_redundant_argument_values
  headline6: TextStyle(
    debugLabel: 'myWhiteTextTheme headline6',
    fontFamily: GoogleFonts.notoSans().fontFamily,
    // ignore: avoid_redundant_argument_values
    inherit: true,
    color: Colors.white,
    decoration: TextDecoration.none,
  ),
  // ignore: avoid_redundant_argument_values
  bodyText1: TextStyle(
    debugLabel: 'myWhiteTextTheme bodyText1',
    fontFamily: GoogleFonts.notoSerif().fontFamily,
    // ignore: avoid_redundant_argument_values
    inherit: true,
    color: Colors.white,
    decoration: TextDecoration.none,
  ),
  // ignore: avoid_redundant_argument_values
  bodyText2: TextStyle(
    debugLabel: 'myWhiteTextTheme bodyText2',
    fontFamily: GoogleFonts.notoSerif().fontFamily,
    // ignore: avoid_redundant_argument_values
    inherit: true,
    color: Colors.white,
    decoration: TextDecoration.none,
  ),
  // ignore: avoid_redundant_argument_values
  subtitle1: TextStyle(
    debugLabel: 'myWhiteTextTheme subtitle1',
    fontFamily: GoogleFonts.notoSerif().fontFamily,
    // ignore: avoid_redundant_argument_values
    inherit: true,
    color: Colors.white,
    decoration: TextDecoration.none,
  ),
  // ignore: avoid_redundant_argument_values
  subtitle2: TextStyle(
    debugLabel: 'myWhiteTextTheme subtitle2',
    fontFamily: GoogleFonts.notoSerif().fontFamily,
    // ignore: avoid_redundant_argument_values
    inherit: true,
    color: Colors.white,
    decoration: TextDecoration.none,
  ),
  // ignore: avoid_redundant_argument_values
  caption: TextStyle(
    debugLabel: 'myWhiteTextTheme caption',
    fontFamily: GoogleFonts.notoSerif().fontFamily,
    // ignore: avoid_redundant_argument_values
    inherit: true,
    color: Colors.white70,
    decoration: TextDecoration.none,
  ),
  // ignore: avoid_redundant_argument_values
  button: TextStyle(
    debugLabel: 'myWhiteTextTheme button',
    fontFamily: GoogleFonts.notoSerif().fontFamily,
    // ignore: avoid_redundant_argument_values
    inherit: true,
    color: Colors.white,
    decoration: TextDecoration.none,
  ),
  // ignore: avoid_redundant_argument_values
  overline: TextStyle(
    debugLabel: 'myWhiteTextTheme overline',
    fontFamily: GoogleFonts.notoSerif().fontFamily,
    // ignore: avoid_redundant_argument_values
    inherit: true,
    color: Colors.white,
    decoration: TextDecoration.none,
  ),
);

TextTheme myEnglishLikeTextTheme = const TextTheme(
  headline1: TextStyle(
      debugLabel: 'myEnglishLikeTextTheme headline1',
      fontSize: 96.0,
      fontWeight: FontWeight.w300,
      textBaseline: TextBaseline.alphabetic,
      letterSpacing: -1.5,),
  headline2: TextStyle(
      debugLabel: 'myEnglishLikeTextTheme headline2',
      fontSize: 60.0,
      fontWeight: FontWeight.w300,
      textBaseline: TextBaseline.alphabetic,
      letterSpacing: -0.5,),
  headline3: TextStyle(
      debugLabel: 'myEnglishLikeTextTheme headline3',
      fontSize: 48.0,
      fontWeight: FontWeight.w400,
      textBaseline: TextBaseline.alphabetic,
      letterSpacing: 0.0,),
  headline4: TextStyle(
      debugLabel: 'myEnglishLikeTextTheme headline4',
      fontSize: 34.0,
      fontWeight: FontWeight.w400,
      textBaseline: TextBaseline.alphabetic,
      letterSpacing: 0.25,),
  headline5: TextStyle(
      debugLabel: 'myEnglishLikeTextTheme headline5',
      fontSize: 24.0,
      fontWeight: FontWeight.w400,
      textBaseline: TextBaseline.alphabetic,
      letterSpacing: 0.0,),
  headline6: TextStyle(
      debugLabel: 'myEnglishLikeTextTheme headline6',
      fontSize: 20.0,
      fontWeight: FontWeight.w500,
      textBaseline: TextBaseline.alphabetic,
      letterSpacing: 0.15,),
  bodyText1: TextStyle(
      debugLabel: 'myEnglishLikeTextTheme bodytext1',
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      textBaseline: TextBaseline.alphabetic,
      letterSpacing: 0.5,),
  bodyText2: TextStyle(
      debugLabel: 'myEnglishLikeTextTheme bodyText2',
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      textBaseline: TextBaseline.alphabetic,
      letterSpacing: 0.25,),
  subtitle1: TextStyle(
      debugLabel: 'myEnglishLikeTextTheme subtitle1',
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      textBaseline: TextBaseline.alphabetic,
      letterSpacing: 0.15,),
  subtitle2: TextStyle(
      debugLabel: 'myEnglishLikeTextTheme subtitle2',
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      textBaseline: TextBaseline.alphabetic,
      letterSpacing: 0.1,),
  button: TextStyle(
    debugLabel: 'myEnglishLikeTextTheme button',
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    textBaseline: TextBaseline.alphabetic,
    letterSpacing: 1.25,
  ),
  caption: TextStyle(
    debugLabel: 'myEnglishLikeTextTheme caption',
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
    textBaseline: TextBaseline.alphabetic,
    letterSpacing: 0.4,
  ),
  overline: TextStyle(
      debugLabel: 'myEnglishLikeTextTheme overline',
      fontSize: 10.0,
      fontWeight: FontWeight.w400,
      textBaseline: TextBaseline.alphabetic,
      letterSpacing: 1.5,),
);

TextTheme myDenseTextTheme = const TextTheme(
  headline1: TextStyle(
      debugLabel: 'myDenseTextTheme headline1',
      fontSize: 96.0,
      fontWeight: FontWeight.w100,
      textBaseline: TextBaseline.ideographic,),
  headline2: TextStyle(
      debugLabel: 'myDenseTextTheme headline2',
      fontSize: 60.0,
      fontWeight: FontWeight.w100,
      textBaseline: TextBaseline.ideographic,),
  headline3: TextStyle(
      debugLabel: 'myDenseTextTheme headline3',
      fontSize: 48.0,
      fontWeight: FontWeight.w400,
      textBaseline: TextBaseline.ideographic,),
  headline4: TextStyle(
      debugLabel: 'myDenseTextTheme headline4',
      fontSize: 34.0,
      fontWeight: FontWeight.w400,
      textBaseline: TextBaseline.ideographic,),
  headline5: TextStyle(
      debugLabel: 'myDenseTextTheme headline5',
      fontSize: 24.0,
      fontWeight: FontWeight.w400,
      textBaseline: TextBaseline.ideographic,),
  headline6: TextStyle(
      debugLabel: 'myDenseTextTheme headline6',
      fontSize: 21.0,
      fontWeight: FontWeight.w500,
      textBaseline: TextBaseline.ideographic,),
  bodyText1: TextStyle(
      debugLabel: 'myDenseTextTheme bodyText1',
      fontSize: 17.0,
      fontWeight: FontWeight.w400,
      textBaseline: TextBaseline.ideographic,),
  bodyText2: TextStyle(
      debugLabel: 'myDenseTextTheme bodyText2',
      fontSize: 15.0,
      fontWeight: FontWeight.w400,
      textBaseline: TextBaseline.ideographic,),
  subtitle1: TextStyle(
      debugLabel: 'myDenseTextTheme subtitle1',
      fontSize: 17.0,
      fontWeight: FontWeight.w400,
      textBaseline: TextBaseline.ideographic,),
  subtitle2: TextStyle(
      debugLabel: 'myDenseTextTheme subtitle2',
      fontSize: 15.0,
      fontWeight: FontWeight.w500,
      textBaseline: TextBaseline.ideographic,),
  button: TextStyle(
      debugLabel: 'myDenseTextTheme button',
      fontSize: 15.0,
      fontWeight: FontWeight.w500,
      textBaseline: TextBaseline.ideographic,),
  caption: TextStyle(
      debugLabel: 'myDenseTextTheme caption',
      fontSize: 13.0,
      fontWeight: FontWeight.w400,
      textBaseline: TextBaseline.ideographic,),
  overline: TextStyle(
      debugLabel: 'myDenseTextTheme overline',
      fontSize: 11.0,
      fontWeight: FontWeight.w400,
      textBaseline: TextBaseline.ideographic,),
);

TextTheme myTallTextTheme = const TextTheme(
  headline1: TextStyle(
      debugLabel: 'myTallTextTheme headline1',
      fontSize: 96.0,
      fontWeight: FontWeight.w400,
      textBaseline: TextBaseline.alphabetic,),
  headline2: TextStyle(
      debugLabel: 'myTallTextTheme headline2',
      fontSize: 60.0,
      fontWeight: FontWeight.w400,
      textBaseline: TextBaseline.alphabetic,),
  headline3: TextStyle(
      debugLabel: 'myTallTextTheme headline3',
      fontSize: 48.0,
      fontWeight: FontWeight.w400,
      textBaseline: TextBaseline.alphabetic,),
  headline4: TextStyle(
      debugLabel: 'myTallTextTheme headline4',
      fontSize: 34.0,
      fontWeight: FontWeight.w400,
      textBaseline: TextBaseline.alphabetic,),
  headline5: TextStyle(
      debugLabel: 'myTallTextTheme headline5',
      fontSize: 24.0,
      fontWeight: FontWeight.w400,
      textBaseline: TextBaseline.alphabetic,),
  headline6: TextStyle(
      debugLabel: 'myTallTextTheme headline6',
      fontSize: 21.0,
      fontWeight: FontWeight.w700,
      textBaseline: TextBaseline.alphabetic,),
  bodyText1: TextStyle(
      debugLabel: 'myTallTextTheme bodyText1',
      fontSize: 17.0,
      fontWeight: FontWeight.w700,
      textBaseline: TextBaseline.alphabetic,),
  bodyText2: TextStyle(
      debugLabel: 'myTallTextTheme bodyText2',
      fontSize: 15.0,
      fontWeight: FontWeight.w400,
      textBaseline: TextBaseline.alphabetic,),
  subtitle1: TextStyle(
      debugLabel: 'myTallTextTheme subtitle1',
      fontSize: 17.0,
      fontWeight: FontWeight.w400,
      textBaseline: TextBaseline.alphabetic,),
  subtitle2: TextStyle(
      debugLabel: 'myTallTextTheme subtitle2',
      fontSize: 15.0,
      fontWeight: FontWeight.w500,
      textBaseline: TextBaseline.alphabetic,),
  button: TextStyle(
      debugLabel: 'myTallTextTheme button',
      fontSize: 15.0,
      fontWeight: FontWeight.w700,
      textBaseline: TextBaseline.alphabetic,),
  caption: TextStyle(
      debugLabel: 'myTallTextTheme caption',
      fontSize: 13.0,
      fontWeight: FontWeight.w400,
      textBaseline: TextBaseline.alphabetic,),
  overline: TextStyle(
      debugLabel: 'myTallTextTheme overline',
      fontSize: 11.0,
      fontWeight: FontWeight.w400,
      textBaseline: TextBaseline.alphabetic,),
);
