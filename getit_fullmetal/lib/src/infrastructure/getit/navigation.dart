// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/widgets.dart';
import 'package:getit_fullmetal/src/infrastructure/app_vars.dart';

// Gist: Several use cases of why I need to do it this way. One is that
//       in order to grab the localization delegate I need a build context,
//       per Stackoverflow answer:
//       https://stackoverflow.com/questions/63671225/flutter-using-getit-with-buildcontext
//       https://stackoverflow.com/questions/63324364/navigation-in-flutter-without-context
//
//      Then I have to register it:
//           GetIt locator = GetIt.instance;
//           locator.registerLazySingleton(() => NavigationService());
//
//          then assign it:
//           navigatorKey: navigationService.navigatorKey,
//
//          then create an instance
//             localeInstance() => AppLocalizations.of(locator<NavigationService>().navigatorKey.currentContext!)!;
//
//            localeInstance().your_localization_variable
//    
//           then use
//           void setUpServiceLocator(BuildContext context) {
//              getIt.registerSingleton<AppLocalizations>(AppLocalizations.of(context));
//           }
//
//         and use an extra builder
//
//        Note: Floater package navigation was legacy for the most part amd I already use 
//              lifecycle package to track nav so should only need this part to integrat 
//              into the service locator.
//
//        Okay need to cross-platform this check for target and deliver different 
//        platform based routes.

class NavigationService {
  

  Future<dynamic>? navigateTo(Route<dynamic> routeName) {
    return navigatorKey.currentState?.push<dynamic>(routeName);
  }

  dynamic goBack() {
    return navigatorKey.currentState?.pop();
  }
}
