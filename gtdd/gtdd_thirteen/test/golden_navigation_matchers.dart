// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Original is from Mockingjay by Verty Goodd ventures MIT License 2021

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

Matcher isRoute<T>({String? named}) => _NamedRouteMatcher<T>(named);

class _NamedRouteMatcher<T> extends Matcher {

  final String? _name;
  bool get _hasType => T != dynamic;
  bool get _hasName => _name != null;

  const _NamedRouteMatcher(this._name);

  

  
  @override
  Description describe(Description description) {
    if (_hasType && _hasName) {
      return description.add('a route of type $T named "$_name"');
    } else if (_hasType) {
      return description.add('a route of type $T');
    } else if (_hasName) {
      return description.add('a route named "$_name"');
    } else {
      return description.add('a route');
    }
  }

  @override
  bool matches(dynamic item, Map<dynamic, dynamic> matchState,) {
    if (item is Route) {
      final typeMatches = item is Route<T>;
      final nameMatches = item.settings.name == _name;

      if (_hasType && _hasName) {
        return typeMatches && nameMatches;
      } else if (_hasType) {
        return typeMatches;
      } else if (_hasName) {
        return nameMatches;
      } else {
        return true;
      }
    } else {
      return false;
    }
  }

  @override
  Description describeMismatch(
    dynamic item,
    Description mismatchDescription,
    Map<dynamic, dynamic> matchState,
    bool verbose,
  ) {
    String formatName(String? value) {
      return value == null ? 'actually, no name at all' : '"$value"';
    }

    if (item is Route) {
      final typeMatches = item is Route<T>;
      final nameMatches = item.settings.name == _name;

      if (_hasType && !typeMatches && _hasName && !nameMatches) {
        return mismatchDescription.add(
          'is a route of the wrong type (${item.runtimeType}) '
          'and name (${formatName(item.settings.name)})',
        );
      } else if (_hasName && !nameMatches) {
        return mismatchDescription.add(
          'is a route with the wrong name (${formatName(item.settings.name)})',
        );
      } else {
        return mismatchDescription.add(
          'is a route of the wrong type (${item.runtimeType})',
        );
      }
    } else {
      return mismatchDescription.add('is not a route');
    }
  }
}
