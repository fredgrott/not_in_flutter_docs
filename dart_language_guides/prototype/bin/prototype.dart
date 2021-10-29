// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// The prototype pattern is a creational design pattern in software development.
// It is used when the type of objects to create is determined by a prototypical
// instance, which is cloned to produce new objects.
//
// This pattern is used to:
// * avoid subclasses of an object creator in the client application, like
// the factory method pattern does.
// * avoid the inherent cost of creating a new object in the standard way
// (e.g., using the 'new' keyword) when it is prohibitively expensive for a given application.
//
// To implement the pattern, declare an abstract base class that specifies a
// pure virtual clone() method. Any class that needs a "polymorphic constructor"
// capability derives itself from the abstract base class, and implements
// the clone() operation.
//
// https://en.wikipedia.org/wiki/Prototype_pattern

abstract class Shape {
  late int x;
  late int y;
  Shape clone();
}

class Rectangle implements Shape {
  late int height;
  late int width;
  @override
  late int x;
  @override
  late int y;

  late int _hashCode;
  bool isClone = false;
  String get cloneStatus => isClone ? "is a clone" : "is an original gangster";

  Rectangle(this.height, this.width, this.x, this.y);

  Rectangle.fromSource(Rectangle source) {
    height = source.height;
    width = source.width;
    x = source.x;
    y = source.y;
    _hashCode = source.hashCode;
    isClone = true;
  }

  @override
  Rectangle clone() {
    return Rectangle.fromSource(this);
  }

  @override
  int get hashCode {
    _hashCode = DateTime.now().millisecondsSinceEpoch;
    return _hashCode;
  }

  @override
  bool operator ==(dynamic other) {
    if (other is! Rectangle) return false;
    Rectangle rect = other;
    return rect.isClone && rect.hashCode == hashCode;
  }
}

void main() {
  var ogRect = Rectangle(0, 0, 100, 100);
  var cloneRect = ogRect.clone();
  var someOtherRect = Rectangle(0, 0, 100, 100);

  print("ogRect ${ogRect.cloneStatus}.");
  print("cloneRect ${cloneRect.cloneStatus}.");
  print("someOtherRect ${someOtherRect.cloneStatus}.");

  String cloneIsClone =
      ogRect == cloneRect ? "is a clone of" : "is not a clone of";
  print("\r\ncloneRect $cloneIsClone ogRect.");

  String someRectIsClone =
      ogRect == someOtherRect ? "is a clone of" : "is not a clone of";
  print("someOtherRect $someRectIsClone ogRect.");

  /*
    ogRect is an original gangster.
    cloneRect is a clone.
    someOtherRect is an original gangster.

    cloneRect is a clone of ogRect.
    someOtherRect is not a clone of ogRect.
  */
}
