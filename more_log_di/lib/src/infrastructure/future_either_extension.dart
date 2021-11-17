// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// This is so we can also do error handling for futures
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:more_log_di/src/infrastructure/base_exception.dart';

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
