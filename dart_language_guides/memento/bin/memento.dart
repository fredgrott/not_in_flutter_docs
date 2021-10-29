// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// The memento pattern is a software design pattern that provides the
// ability to restore an object to its previous state (undo via rollback).
//
// The memento pattern is implemented with three objects: the originator,
// a caretaker and a memento. The originator is some object that has an
// internal state. The caretaker is going to do something to the originator,
// but wants to be able to undo the change. The caretaker first asks the
// originator for a memento object. Then it does whatever operation
// (or sequence of operations) it was going to do. To roll back to the state
// before the operations, it returns the memento object to the originator.
// The memento object itself is an opaque object (one which the caretaker cannot,
// or should not, change). When using this pattern, care should be taken if the
// originator may change other objects or resources - the memento pattern
// operates on a single object.
//
// https://en.wikipedia.org/wiki/Memento_pattern

class Memento {
  late String _state;

  Memento(String s) {
    _state = s;
    print("[Memento] State \"$s\" has been saved!");
  }

  String get state {
    print("[Memento] Providing saved state \"$_state\"...");
    return _state;
  }
}

class Originator {
  late String _state;

  // NOTE: This uses the state setter on init to get a handy print
  Originator(String s) {
    state = s;
  }

  String get state => _state;
  set state(String newState) {
    _state = newState;
    print("[Originator] Set state to $newState");
  }

  Memento saveToMemento() {
    print("[Originator] Saving to memento...");
    return Memento(state);
  }

  void restoreFromMemento(Memento m) {
    print("[Originator] Restoring from memento...");
    _state = m.state;
    print("[Originator] Restored to $state.");
  }
}

class CareTaker {
  late Memento memento;
}

void main() {
  var me = Originator("Returned from store");
  me.state = "Placing car keys down";

  var locationOfKeys = me.saveToMemento();
  var memory = CareTaker();
  memory.memento = locationOfKeys;

  me.state = "Putting away groceries";
  me.state = "Noticed missing pickles";
  me.state = "Looking for car keys...";

  me.restoreFromMemento(memory.memento);
  me.state = "Going back to store for pickles";

  /*
    [Originator] Set state to Returned from store
    [Originator] Set state to Placing car keys down
    [Originator] Saving to memento...
    [Memento] State "Placing car keys down" has been saved!
    [Originator] Set state to Putting away groceries
    [Originator] Set state to Noticed missing pickles
    [Originator] Set state to Looking for car keys...
    [Originator] Restoring from memento...
    [Memento] Providing saved state "Placing car keys down"...
    [Originator] Restored to Placing car keys down.
    [Originator] Set state to Going back to store for pickles
  */
}
