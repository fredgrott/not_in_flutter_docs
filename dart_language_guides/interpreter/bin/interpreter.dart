// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// In computer programming, the interpreter pattern is a design pattern that
// specifies how to evaluate sentences in a language. The basic idea is to have
// a class for each symbol (terminal or non-terminal) in a specialized
// computer language. The syntax tree of a sentence in the language is an
// instance of the composite pattern and is used to evaluate (interpret)
// the sentence for a client.
//
// https://en.wikipedia.org/wiki/Interpreter_pattern

abstract class Expression {
  late Number number;
  void interpret(int value);
}

class Add implements Expression {
  @override
  Number number;
  Add(this.number);
  @override
  void interpret(int value) {
    print("Adding $value...");
    number.value += value;
  }
}

class Subtract implements Expression {
  @override
  Number number;
  Subtract(this.number);
  @override
  void interpret(int value) {
    print("Subtracting $value...");
    number.value -= value;
  }
}

class Number {
  late int value;
  Number(this.value) {
    print("Starting with $value...");
  }
}

void main() {
  var number = Number(0);
  var adder = Add(number);
  var subtracter = Subtract(number);

  adder.interpret(100);
  subtracter.interpret(60);
  adder.interpret(2);

  assert(number.value == 42);
  print("And the result is ${number.value}!");
}
