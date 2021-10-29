// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// An adapter allows two incompatible interfaces to work together.
// This is the real-world definition for an adapter.
// Interfaces may be incompatible, but the inner functionality
// should suit the need. The adapter design pattern allows otherwise
// incompatible classes to work together by converting the interface of
// one class into an interface expected by the clients.
//
// https://en.wikipedia.org/wiki/Adapter_pattern

const adapteeMessage = 'Adaptee#method was called';

class Adaptee {
  String method() {
    print('Adaptee#method is being called');

    return adapteeMessage;
  }
}

abstract class Target {
  String call();
}

class Adapter implements Target {
  @override
  String call() {
    var adaptee = Adaptee();
    print('Adapter#call is being called');

    return adaptee.method();
  }
}

void main() {
  var adapter = Adapter();
  var result = adapter.call();

  assert(result == adapteeMessage);
}
