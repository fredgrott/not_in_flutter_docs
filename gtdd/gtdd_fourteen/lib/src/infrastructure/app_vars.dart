// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'package:flutter/widgets.dart';
import 'package:gtdd_fourteen/src/presentation/features/settings/services/settings_service.dart';
import 'package:gtdd_fourteen/src/presentation/features/settings/viewcontrollers/settings_controller.dart';

final settingsController = SettingsController(SettingsService());

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

String myAppTitle = "GTDD Thirteen";
