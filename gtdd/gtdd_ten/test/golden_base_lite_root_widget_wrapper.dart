// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

import 'package:golden_toolkit/golden_toolkit.dart';

import 'golden_base_lite_root_widget.dart';

// Gist: Idea is a lite wrapper only suppling the Theme and a 
//       Material container to wrap the Individual Widget under test in.
WidgetWrapper goldenBaseLiteRootWidgetWrapper({
  TargetPlatform platform = TargetPlatform.android,
  required ThemeData myTheme,
}) {
  return (Widget child) => GoldenBaseLiteRootWidget(
        myTheme: myTheme.copyWith(platform: platform),
      );
}
