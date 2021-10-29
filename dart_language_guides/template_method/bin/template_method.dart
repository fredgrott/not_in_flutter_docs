// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// In object-oriented programming, the template method is one of the behavioral
// design patterns identified by Gamma et al. in the book Design Patterns.
// The template method is a method in a superclass, usually an abstract superclass,
// and defines the skeleton of an operation in terms of a number of high-level steps.
// These steps are themselves implemented by additional helper methods in the same class
// as the template method.
//
// The helper methods may be either abstract methods, for which case subclasses
// are required to provide concrete implementations, or hook methods, which have
// empty bodies in the superclass. Subclasses can (but are not required to) customize
// the operation by overriding the hook methods. The intent of the template method
// is to define the overall structure of the operation, while allowing subclasses
// to refine, or redefine, certain steps.
//
// https://en.wikipedia.org/wiki/Template_method_pattern

abstract class Abstract {
  String abstractMethod();
  String hookMethod() => "OMG I am a hook!";
  void templateMethod() {
    print(abstractMethod());
    print(hookMethod());
  }
}

class Concrete extends Abstract {
  @override
  String abstractMethod() => "This is a boring example...";
}

class ConcreteOverridingHook extends Abstract {
  @override
  String abstractMethod() => "So, so boring...";
  @override
  String hookMethod() => "I'm an overriden hook method!";
}

void main() {
  var con1 = Concrete();
  var con2 = ConcreteOverridingHook();
  con1.templateMethod();
  con2.templateMethod();

  /*
    This is a boring example...
    OMG I am a hook!
    So, so boring...
    I'm an overriden hook method!
  */
}
