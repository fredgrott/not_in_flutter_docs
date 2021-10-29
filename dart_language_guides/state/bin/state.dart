// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// The state pattern is used in computer programming to encapsulate varying
// behavior for the same object, based on its internal state. This can be a
// cleaner way for an object to change its behavior at runtime without resorting
// to conditional statements and thus improve maintainability.
//
// https://en.wikipedia.org/wiki/State_pattern

abstract class State {
  void handler(Stateful context);
  @override
  String toString();
}

class StatusOn implements State {
  @override
  handler(Stateful context) {
    print("  Handler of StatusOn is being called!");
    context.state = StatusOff();
  }

  @override
  String toString() {
    return "on";
  }
}

class StatusOff implements State {
  @override
  handler(Stateful context) {
    print("  Handler of StatusOff is being called!");
    context.state = StatusOn();
  }

  @override
  String toString() {
    return "off";
  }
}

class Stateful {
  State _state;

  Stateful(this._state);

  // ignore: unnecessary_getters_setters
  State get state => _state;
  set state(State newState) => _state = newState;

  void touch() {
    print("  Touching the Stateful...");
    _state.handler(this);
  }
}

void main() {
  var lightSwitch = Stateful(StatusOff());
  print("The light switch is ${lightSwitch.state}.");
  print("Toggling the light switch...");
  lightSwitch.touch();
  print("The light switch is ${lightSwitch.state}.");
}
