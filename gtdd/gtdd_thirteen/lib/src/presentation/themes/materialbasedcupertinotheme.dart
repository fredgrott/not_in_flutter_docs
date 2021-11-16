// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:gtdd_thirteen/src/presentation/themes/material_themedata.dart';

// Gist: If we want Material Colors and Font Styles for Cupertino Widgets, this theme 
//       is used in the CupertinoApp theme slot.

MaterialBasedCupertinoThemeData materialBasedCupertinoThemeData =
    MaterialBasedCupertinoThemeData(
        materialTheme: materialLightMaterialThemeData,);
