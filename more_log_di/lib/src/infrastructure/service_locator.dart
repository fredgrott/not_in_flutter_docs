// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:get_it/get_it.dart';
import 'package:logging/logging.dart';
import 'package:more_log_di/src/infrastructure/app_logging.dart';

final serviceLocator = GetIt.instance;

void serviceLocatorSetUp() {
  serviceLocator.registerLazySingleton<Logger>(() => appLogger);
  // register more instaces for example, the theme model
}

late final Logger myLogger;

void loggingSetUp(){
  myLogger = serviceLocator.get<Logger>();

}
