// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// In object-oriented programming, the iterator pattern is a design pattern
// in which an iterator is used to traverse a container and access the
// container's elements. The iterator pattern decouples algorithms from
// containers; in some cases, algorithms are necessarily container-specific
// and thus cannot be decoupled.
//
// For example, the hypothetical algorithm SearchForElement can be implemented
// generally using a specified type of iterator rather than implementing it as
// a container-specific algorithm. This allows SearchForElement to be used on
// any container that supports the required type of iterator.
//
// https://en.wikipedia.org/wiki/Iterator_pattern

class RainbowIterator implements Iterator {
  final _colors = [
    "Red",
    "Orange",
    "Yellow",
    "Green",
    "Blue",
    "Indigo",
    "Violet"
  ];
  var _index = 0;
  @override
  String get current => _colors[_index++];
  @override
  bool moveNext() => _index < _colors.length;
}

void main() {
  var rainbowColors = RainbowIterator();
  while (rainbowColors.moveNext()) {
    print(rainbowColors.current);
  }

  /*
    Red
    Orange
    Yellow
    Green
    Blue
    Indigo
    Violet
  */
}
