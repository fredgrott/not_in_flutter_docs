// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// In object-oriented programming, the decorator pattern is a design pattern
// that allows behavior to be added to an individual object, dynamically,
// without affecting the behavior of other objects from the same class.
// The decorator pattern is often useful for adhering to the
// Single Responsibility Principle, as it allows functionality to be divided
// between classes with unique areas of concern. The decorator pattern is
// structurally nearly identical to the chain of responsibility pattern,
// the difference being that in a chain of responsibility, exactly one of
// the classes handles the request, while for the decorator, all classes
// handle the request.
//
// https://en.wikipedia.org/wiki/Decorator_pattern

abstract class Beverage {
  double get cost;
  String? get ingredients;
}

class Ingredient {
  double cost;
  String name;

  Ingredient(this.name, this.cost);

  @override
  // ignore: unnecessary_this
  String toString() => this.name;
}

var coffee = Ingredient("coffee", .25);
var milk = Ingredient("milk", .5);
var sugar = Ingredient("sugar", .1);

class Coffee implements Beverage {
  final Set<Ingredient> _ingredients = {coffee, milk, sugar};
  @override
  double get cost => _ingredients.fold(0, (total, i) => total + i.cost);
  @override
  String? get ingredients {
    var stringIngredients =
        _ingredients.fold("", (str, i) => "${i.name}, " + str.toString());
    var trimmedString =
        stringIngredients.substring(0, stringIngredients.length - 2);
    var lastComma = trimmedString.lastIndexOf(",");
    var replacement =
        ",".allMatches(trimmedString).length > 1 ? ", and" : " and";

    return trimmedString.replaceRange(lastComma, lastComma + 1, replacement);
  }
}

class StarbucksCoffeeDecorator implements Beverage {
  final Beverage _coffee = Coffee();
  @override
  double get cost => _coffee.cost * 5;
  @override
  String? get ingredients => _coffee.ingredients;
}

void main() {
  var coffee = Coffee();
  var starbucksCoffee = StarbucksCoffeeDecorator();

  print("Coffee contains ${coffee.ingredients}. It costs \$${coffee.cost}");
  print(
      "Starbucks coffee contains ${starbucksCoffee.ingredients}. It costs \$${starbucksCoffee.cost}");

  // Coffee contains coffee, milk, and sugar. It costs $0.85
  // Starbucks coffee contains coffee, milk, and sugar. It costs $4.25
}
