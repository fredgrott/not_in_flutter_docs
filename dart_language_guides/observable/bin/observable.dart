// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// The observer pattern is a software design pattern in which an object,
// called the subject, maintains a list of its dependents, called observers,
// and notifies them automatically of any state changes, usually by calling one
// of their methods.
//
// It is mainly used to implement distributed event handling systems, in
// "event driven" software. Most modern languages such as C# have built-in "event"
// constructs which implement the observer pattern components.
//
// The observer pattern is also a key part in the familiar
// model view controller (MVC) architectural pattern. The observer pattern is
// implemented in numerous programming libraries and systems, including almost
// all GUI toolkits.
//
// https://en.wikipedia.org/wiki/Observer_pattern



class Notification {
  String message;
  late DateTime timestamp;
  Notification(this.message, this.timestamp);
  Notification.forNow(this.message) {
    timestamp = DateTime.now();
  }
}

class Observable {
  late List<Observer> _observers;

  Observable([List<Observer>? observers]) {
    _observers = observers ?? [];
  }

  void registerObserver(Observer observer) {
    _observers.add(observer);
  }

  void notifyObservers(Notification notification) {
    for (var observer in _observers) {
      observer.notify(notification);
    }
  }
}

class Observer {
  String name;

  Observer(this.name);

  void notify(Notification notification) {
    print(
        "[${notification.timestamp.toIso8601String()}] Hey $name, ${notification.message}!");
  }
}

class CoffeeMaker extends Observable {
  CoffeeMaker([List<Observer>? observers]) : super(observers);
  void brew() {
    print("Brewing the coffee...");
    notifyObservers(Notification.forNow("coffee's done"));
  }
}

void main() {
  var me = Observer("Tyler");
  var mrCoffee = CoffeeMaker(List.from([me]));
  var myWife = Observer("Kate");
  mrCoffee.registerObserver(myWife);
  mrCoffee.brew();
  /*
    Brewing the coffee...
    [2019-06-18T07:30:04.397518] Hey Tyler, coffee's done!
    [2019-06-18T07:30:04.397518] Hey Kate, coffee's done!
  */
}
