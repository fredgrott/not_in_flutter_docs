// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

class A {
  void printMessage() => print('A');
}

mixin B on A {
  @override
  void printMessage() {
    print('B');
    super.printMessage();
  }
}
mixin C on A {
  @override
  void printMessage() {
    print('C');
    super.printMessage();
  }
}

//try to change C, B to B, C
class D extends A with C, B {
  @override
  void printMessage() {
    print('D');
    super.printMessage();
  }
}

void main() {
  final d = D();
  d.printMessage();
}
