// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

// We need a wrapper as we have mocked deps attached to root widget
// see source at: https://github.com/eBay/flutter_glove_box/blob/master/packages/golden_toolkit/lib/src/testing_tools.dart
// and this will change depending upon which cross platform widgets
// plugin you use, such as Flutter Platform Widgets.
//
// 
// ignore: long-parameter-list
WidgetWrapper myAppWrapper({
  // we can do Goldens by platform
  TargetPlatform platform = TargetPlatform.android,
  ThemeData? theme,
  ThemeData? darkTheme,
  Iterable<LocalizationsDelegate<dynamic>>? localizations,
  Iterable<Locale>? localeOverrides,
  NavigatorObserver? navigatorObserver,
}) {
  return (child) => MaterialApp(
        theme: theme?.copyWith(platform: platform),
        darkTheme: theme?.copyWith(platform: platform, brightness: Brightness.dark),
        localizationsDelegates: localizations,
        supportedLocales: localeOverrides ?? const [Locale('en')],
        debugShowCheckedModeBanner: false,
        home: Material(child: child),
        navigatorObservers: [
          if (navigatorObserver != null) navigatorObserver,
        ],
      );
}

// My Custom Device Defs, see
// https://github.com/eBay/flutter_glove_box/blob/master/packages/golden_toolkit/lib/src/device.dart

Device samsungNineAndroid = const Device(
  name: "S9-Android",
  size: Size(1440, 3040),
);

Device samsungEightAndroid = const Device(
  name: "S8-Android",
  size: Size(1440, 2960),
);

Device pixelxlAndroid = const Device(
  name: "PixelXL-Android",
  size: Size(1440, 2560),
);

Device pixelfouraAndroid = const Device(
  name: "Pixel4A-Android",
  size: Size(1080, 2340),
);

Device pixelfourxlAndroid = const Device(
  name: "Pixel4XL-Android",
  size: Size(1440, 3040),
);

Device pixelfourAndroid = const Device(
  name: "Pixel4-Android",
  size: Size(1080, 2280),
);

Device pixelthreeaxlAndroid = const Device(
  size: Size(1080, 2160),
  name: "Pixel3a-Android",
);

Device pixelthreeaAndroid = const Device(
  size: Size(1080, 2220),
  name: "Pixel3a-Android",
);

Device pixelthreeAndroid = const Device(
  name: "Pixel3-Android",
  size: Size(1440, 2960),
);

Device iphonetenxIOS = const Device(
  size: Size(1125, 2436),
  name: "iPhoneX-iOS",
);

Device iphonetwelvepromaxIOS = const Device(
  size: Size(1284, 2778),
  name: "iPhone12ProMax-IOS",
);
