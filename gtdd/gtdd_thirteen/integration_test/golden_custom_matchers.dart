// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

class ItHasText extends CustomMatcher {
  ItHasText(dynamic matcher)
      : super(
          'Text data',
          'data',
          matcher,
        );

  @override
  String? featureValueOf(dynamic actual) {
    if (actual is Finder) {
      final element = actual.evaluate().single;
      final widget = element.widget;
      if (widget is Text) {
        return widget.data;
      } else {
        throw Exception("HasText matcher can't be applied to $element");
      }
    } else {
      throw Exception(
        'HasText matcher can only be applied to a Finder object',
      );
    }
  }
}

Matcher itContainsSubstringNoCase(String substring) => predicate(
      (String expected) => expected.contains(RegExp(
        substring,
        caseSensitive: false,
      )),
    );
