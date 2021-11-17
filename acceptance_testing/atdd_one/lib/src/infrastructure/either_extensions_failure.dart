// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:developer';

import 'package:atdd_one/src/infrastructure/exception_base.dart';
import 'package:dartz/dartz.dart';

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
