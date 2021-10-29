// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// A proxy, in its most general form, is a class functioning as an interface
// to something else. The proxy could interface to anything: a network connection,
// a large object in memory, a file, or some other resource that is expensive or
// impossible to duplicate. In short, a proxy is a wrapper or agent object that
// is being called by the client to access the real serving object behind the scenes.
//
// https://en.wikipedia.org/wiki/Proxy_pattern

abstract class Subject {
  void someMethod();
}

class ExpensiveClass implements Subject {
  String name;

  ExpensiveClass(this.name);

  @override
  void someMethod() {
    print("someMethod of $name (an ExpensiveClass) is being called");
  }
}

class Proxy implements Subject {
  late final String _name;
  late ExpensiveClass _sub;

  Proxy(this._name);

  @override
  void someMethod() {
    print("someMethod of $_name (a Proxy) is being called");
    _subject().someMethod();
  }

  ExpensiveClass _subject() {
    print("Creating an instance of ExpensiveClass for the proxy...");
    _sub = ExpensiveClass(_name);
    return _sub;
  }
}

void main() {
  var proxy = Proxy("yay");
  print("With our handy proxy, we call someMethod...\r\n");
  proxy.someMethod();
  print(
      "\r\nNotice that the proxy did not have an instance of ExpensiveClass, so it made one when required.");
  print("Now if we call someMethod again...\r\n");
  proxy.someMethod();
  print("\r\nWe reuse the instance we made above!");
}
