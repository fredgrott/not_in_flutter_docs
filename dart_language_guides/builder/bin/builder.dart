// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// The intent of the Builder design pattern is to separate the construction
// of a complex object from its representation. By doing so the same construction
// process can create different representations.
//
// https://en.wikipedia.org/wiki/Builder_pattern

class PizzaBuilder {
  String? _crust;
  int? _diameter;
  Set<String>? _toppings;

  PizzaBuilder(this._diameter);

  // ignore: unnecessary_getters_setters
  String? get crust => _crust;
  set crust(String? newCrust) {
    _crust = newCrust;
  }

  // ignore: unnecessary_getters_setters
  int? get diameter => _diameter;
  set diameter(int? newDiameter) {
    _diameter = newDiameter;
  }

  Set<String>? get toppings => _toppings;
  set toppings(Set<String>? newToppings) {
    _toppings = newToppings;
    _ensureCheese();
  }

  void _ensureCheese() {
    _toppings!.add("cheese");
  }

  Pizza build() {
    return Pizza(this);
  }
}

class Pizza {
  String? _crust;
  int? _diameter;
  Set<String>? _toppings;

  Pizza(PizzaBuilder builder) {
    _crust = builder.crust;
    _diameter = builder.diameter;
    _toppings = builder.toppings;
  }

  String? get crust => _crust;
  int? get diameter => _diameter;
  String get toppings => _stringifiedToppings();
  String _stringifiedToppings() {
    var stringToppings = _toppings!.join(", ");
    var lastComma = stringToppings.lastIndexOf(",");
    var replacement =
        ",".allMatches(stringToppings).length > 1 ? ", and" : " and";

    return stringToppings.replaceRange(lastComma, lastComma + 1, replacement);
  }

  @override
  String toString() {
    return "A delicious $_diameter\" pizza with $_crust crust covered in $toppings";
  }
}

void main() {
  // Create a handy PizzaBuilder with an 8" diameter.
  var pizzaBuilder = PizzaBuilder(8);

  // Add some attributes to the builder.
  pizzaBuilder.crust = "deep dish";
  pizzaBuilder.toppings = {"pepperoni"};

  // Let's make a pizza!
  var plainPizza = Pizza(pizzaBuilder);
  print("Behold! $plainPizza.");
  assert(plainPizza.toString() ==
      "Behold! A delicious 8\" pizza with deep dish crust covered in pepperoni and cheese.");

  // Now to adjust some things for the next pizza...
  pizzaBuilder.crust = "gold plated";
  pizzaBuilder.diameter = 72;
  pizzaBuilder.toppings = {"anchovies", "caviar", "diamonds"};

  // The beauty of the build is you can quickly iterate and produce instances of a class.
  // For example, we have an early employee of the latest unicorn in line. So much disposable income!
  // Also note, we use the .build() function of the builder this time.
  var luxuriousPizza = pizzaBuilder.build();
  print("Wow! $luxuriousPizza? Someone is rich!");
  assert(luxuriousPizza.toString() ==
      "Wow! A delicious 72\" pizza with gold plated crust covered in anchovies, caviar, diamonds, and cheese? Someone is rich!");
}
