// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Modification of the Floater pacakge which was
// created by Shrey Mahendru under mIT License

// ignore_for_file: avoid_unused_constructor_parameters



import 'package:getit_fullmetal/src/infrastructure/getit/extensions.dart';

abstract class Ensurer<T> {
  // Ensurer<T> ensureHasValue();
  Ensurer<T> ensure(bool Function(T t) func, [String? reason,]);
}

Ensurer<T> given<T>(T arg, String argName,) {
  if (argName.isEmptyOrWhiteSpace) {
    throw ArgumentError("argName can't be empty");
  }

  return _EnsurerInternal(arg, argName.trim(),);
}

class _EnsurerInternal<T> extends Ensurer<T> {
  late T _arg;
  late String _argName;

  _EnsurerInternal(dynamic _arg, String _argName,);

  // @override
  // Ensurer<T> ensureHasValue() {
  //   if (this._arg == null) throw new ArgumentError(this._argName);

  //   if (this._arg is String && (this._arg as String).isEmptyOrWhiteSpace)
  //     throw new ArgumentError("Argument ${this._argName} does not not have a value");

  //   return this;
  // }

  @override
  Ensurer<T> ensure(bool Function(T) func, [String? reason,]) {
    if (!func(_arg)) {
      if (_argName.toLowerCase() == "this") {
        throw StateError(reason != null && reason.isNotEmptyOrWhiteSpace
            ? "Current operation is invalid due to reason '${reason.trim()}'"
            : "Current operation is invalid",);
      }

      throw reason != null && reason.isNotEmptyOrWhiteSpace
          ? ArgumentError(
              "Argument '$_argName' is invalid due to reason '${reason.trim()}'",)
          : ArgumentError("Argument '$_argName' is invalid");
    }

    return this;
  }
}
