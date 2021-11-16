// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

// Gist: Error Hanlding is dynamic as we need to start with large amounts of
//       untrusted functions and futures and move both to the set of trusted and
//       monitoried functions and futures. We do that by implementing a error
//       handliing infrastructure.
//
//       For usage in data classes that abstract data layers see:
//        https://gist.github.com/CassiusPacheco/409e66e220ce563440df00385f39ac98

abstract class Failure extends Equatable implements Exception {
  @override
  List<Object> get props => [];

  @override
  String toString() => '$runtimeType Exception';
}

// Should have sets of Failures both for App Arch layers  and the
// sub-areas of each layer.
class GenericFailure extends Failure {}

class APIFailure extends Failure {}

// This is so we can also do error handling for futures
extension TaskX<T extends Either<Object, U>, U> on Task<T> {
  Task<Either<Failure, U>> mapLeftToFailure() {
    // ignore: unnecessary_this
    return this.map(
      (either) => either.leftMap((obj) {
        try {
          log(obj.toString());

          return obj as Failure;
        } catch (e) {

          log('$e.runtimeType.toString() $e.message');


          throw obj;
        }
      }),
    );
  }
}

typedef AVoidFunction = void Function();

/// Sandboxes a non returning function. Used for non-pure functions
/// that may trigger effects beyond the core of app such as systems,
/// outside services, etc.
/// usage: guardVoided<dynamic>(initLogger);
/// @author Fredrick Allan Grott
void guardVoided<T>(AVoidFunction callback) {
  try {
    callback();
  } on Failure catch (e) {
    log('$e.runtimeType.toString() $e.message');
  }
}

/// Sand boxing a returning function that offers a default value if function
/// miss-behaves.
/// @author Fredrick Allan Grott
T? guardDefaultValue<T>(T Function() callback, [T? defaultValue,]) {
  late T result;

  try {
    result = callback();
  } on Failure catch (e) {
    log('$e.runtimeType.toString() $e.message');
  }

  return result ?? defaultValue;
}

///
/// @author Fredrick Allan Grott
Future<T> asyncGuardDefaultValue<T>(
  Future<T> Function() callback, [
  T? defaultValue,
]) async {
  late T result;

  try {
    result = callback() as T;
  } on Failure catch (e) {
    log('$e.runtimeType.toString() $e.message');
  }

  return result ?? defaultValue as T;
}
