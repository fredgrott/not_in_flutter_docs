// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:developer';

import 'package:flutter/widgets.dart';

// Gist: Allows tracking of routes. Note, it only works if we use Nav push or
//       NAv pushNamed.

class MyRouteObserver extends RouteObserver<PageRoute<dynamic>> {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute,) {
    super.didPush(
      route,
      previousRoute,
    );
    if (route is PageRoute) {
      _sendScreenView(route);
    }
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute,}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute,);
    if (newRoute is PageRoute) {
      _sendScreenView(newRoute);
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute,) {
    super.didPop(route, previousRoute,);
    if (previousRoute is PageRoute && route is PageRoute) {
      _sendScreenView(previousRoute);
    }
  }


  void _sendScreenView(PageRoute<dynamic> route) {
    final screenName = route.settings.name;
    log('screenName $screenName');
    // do something with it, ie. send it to your analytics service collector
  }

  
}
