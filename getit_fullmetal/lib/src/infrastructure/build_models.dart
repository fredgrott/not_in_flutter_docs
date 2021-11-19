// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/foundation.dart';

bool get isInDebugMode {
  // ignore: unused_local_variable
  bool _inDebugMode = false;

  return kDebugMode ? (_inDebugMode = true) : (_inDebugMode = false);
}

bool get isInReleaseMode {
  // ignore: unused_local_variable
  bool _inReleaseMode = false;

  return kReleaseMode ? (_inReleaseMode = true) : (_inReleaseMode = false);
}

bool get isInProfileMode {
  // ignore: unused_local_variable
  bool _inProfileMode = false;

  return kProfileMode ? (_inProfileMode = true) : (_inProfileMode = false);
}
