// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

// My Custom Device Defs, see
// https://github.com/eBay/flutter_glove_box/blob/master/packages/golden_toolkit/lib/src/device.dart
//
// 


Device samsungNineAndroid = const Device(
  name: "S9-Android",
  size: Size(
    1440,
    3040,
  ),
  safeArea: EdgeInsets.only(top: 44, bottom: 34,),
);

Device samsungEightAndroid = const Device(
  name: "S8-Android",
  size: Size(
    1440,
    2960,
  ),
  safeArea: EdgeInsets.only(
    top: 44,
    bottom: 34,
  ),
);

Device pixelxlAndroid = const Device(
  name: "PixelXL-Android",
  size: Size(
    1440,
    2560,
  ),
  safeArea: EdgeInsets.only(
    top: 44,
    bottom: 34,
  ),
);

Device pixelfouraAndroid = const Device(
  name: "Pixel4A-Android",
  size: Size(
    1080,
    2340,
  ),
  safeArea: EdgeInsets.only(
    top: 44,
    bottom: 34,
  ),
);

Device pixelfourxlAndroid = const Device(
  name: "Pixel4XL-Android",
  size: Size(
    1440,
    3040,
  ),
  safeArea: EdgeInsets.only(
    top: 44,
    bottom: 34,
  ),
);

Device pixelfourAndroid = const Device(
  name: "Pixel4-Android",
  size: Size(
    1080,
    2280,
  ),
  safeArea: EdgeInsets.only(
    top: 44,
    bottom: 34,
  ),
);

Device pixelthreeaxlAndroid = const Device(
  size: Size(
    1080,
    2160,
  ),
  name: "Pixel3a-Android",
  safeArea: EdgeInsets.only(
    top: 44,
    bottom: 34,
  ),
);

Device pixelthreeaAndroid = const Device(
  size: Size(
    1080,
    2220,
  ),
  name: "Pixel3a-Android",
  safeArea: EdgeInsets.only(
    top: 44,
    bottom: 34,
  ),
);

Device pixelthreeAndroid = const Device(
  name: "Pixel3-Android",
  size: Size(
    1440,
    2960,
  ),
  safeArea: EdgeInsets.only(
    top: 44,
    bottom: 34,
  ),
);

Device iphonetenxIOS = const Device(
  size: Size(
    1125,
    2436,
  ),
  name: "iPhoneX-iOS",
  safeArea: EdgeInsets.only(
    top: 44,
    bottom: 34,
  ),
);

Device iphonetwelvepromaxIOS = const Device(
  size: Size(
    1284,
    2778,
  ),
  name: "iPhone12ProMax-IOS",
  safeArea: EdgeInsets.only(
    top: 44,
    bottom: 34,
  ),
);

Device laptopMine = const Device(
  size: Size(
    1680,
    1050,
  ),
  name: "Laptop",
);

Device desktopMine = const Device(
  size: Size(1920, 1080,),
  name: "Desktop",);

Device landscapePhone = const Device(
  size: Size(896, 414,),
  name:"LandscapePhone" ,);
  
